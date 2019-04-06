package aspect;

import java.lang.reflect.Method;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;
import annotation.RedisCache;
import annotation.RedisEvict;
import redis.RedisCommand;


@Component
@Aspect
public class CacheAspect {
	@Autowired
	RedisCommand redis;

	/**
	 * 获取或添加缓存
	 * 
	 * @param jp
	 * @param cache
	 * @return
	 * @throws Throwable
	 */
	@Around("@annotation(annotation.RedisCache)")
	public Object RedisCache(final ProceedingJoinPoint jp) throws Throwable {
		Method method = getMethod(jp);
		RedisCache cache = method.getAnnotation(RedisCache.class);
		Object[] args = jp.getArgs();
		Class modelType = method.getAnnotation(RedisCache.class).type();
		 String hashName = modelType.getName();
		 String key =cache.key();
		 if(cache.key().length()>0)hashName="";
		 else key= parseKey(cache.fieldKey(), method, jp.getArgs());
		
		Object value=redis.get(hashName+key);
		Object result = null;
		if (null == value) {
			System.out.println("查询数据:");
			result = jp.proceed(args);			
			final long expire = cache.expire();
			redis.set(hashName+key, result,expire);
		} else {
			System.out.println("查询缓存:");
			Class returnType = ((MethodSignature) jp.getSignature()).getReturnType();
			result = value;
		}
		return result;
	}

	/**
	 * 删除缓存
	 * 
	 * @param jp
	 * @param cache
	 * @return
	 * @throws Throwable
	 */
	@Around("@annotation(annotation.RedisEvict)")
	public Object RedisEvict(final ProceedingJoinPoint jp) throws Throwable {
		Method me = ((MethodSignature) jp.getSignature()).getMethod();
		Class modelType = me.getAnnotation(RedisEvict.class).type();
		redis.remove(modelType.getName());
		return jp.proceed(jp.getArgs());
	}

	/**
	 * 获取被拦截方法对象
	 * 
	 * MethodSignature.getMethod() 获取的是顶层接口或者父类的方法对象 而缓存的注解在实现类的方法上
	 * 所以应该使用反射获取当前对象的方法对象
	 */
	public Method getMethod(ProceedingJoinPoint pjp) {
		// 获取参数的类型
		Object[] args = pjp.getArgs();
		Class[] argTypes = new Class[pjp.getArgs().length];
		for (int i = 0; i < args.length; i++) {
			//System.out.println(args[i].getClass());
			argTypes[i] = args[i].getClass();
		}
		Method method = null;
		try {
			//System.out.println("1:"+pjp.getTarget().getClass());
			//System.out.println("2:"+pjp.getSignature().getName());
			//System.out.println("3:"+argTypes);
			method = pjp.getTarget().getClass().getMethod(pjp.getSignature().getName(), argTypes);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		return method;
	}

	/**
	 * 获取缓存的key key 定义在注解上，支持SPEL表达式
	 * 
	 * @param pjp
	 * @return
	 */
	private String parseKey(String key, Method method, Object[] args) {
		// 获取被拦截方法参数名列表(使用Spring支持类库)
		LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();
		String[] paraNameArr = u.getParameterNames(method);
		// 使用SPEL进行key的解析
		ExpressionParser parser = new SpelExpressionParser();
		// SPEL上下文
		StandardEvaluationContext context = new StandardEvaluationContext();
		// 把方法参数放入SPEL上下文中
		for (int i = 0; i < paraNameArr.length; i++) {
			context.setVariable(paraNameArr[i], args[i]);
		}
		return parser.parseExpression(key).getValue(context, String.class);
	}

	
}
