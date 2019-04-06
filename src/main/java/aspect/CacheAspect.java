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
	 * ��ȡ����ӻ���
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
			System.out.println("��ѯ����:");
			result = jp.proceed(args);			
			final long expire = cache.expire();
			redis.set(hashName+key, result,expire);
		} else {
			System.out.println("��ѯ����:");
			Class returnType = ((MethodSignature) jp.getSignature()).getReturnType();
			result = value;
		}
		return result;
	}

	/**
	 * ɾ������
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
	 * ��ȡ�����ط�������
	 * 
	 * MethodSignature.getMethod() ��ȡ���Ƕ���ӿڻ��߸���ķ������� �������ע����ʵ����ķ�����
	 * ����Ӧ��ʹ�÷����ȡ��ǰ����ķ�������
	 */
	public Method getMethod(ProceedingJoinPoint pjp) {
		// ��ȡ����������
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
	 * ��ȡ�����key key ������ע���ϣ�֧��SPEL���ʽ
	 * 
	 * @param pjp
	 * @return
	 */
	private String parseKey(String key, Method method, Object[] args) {
		// ��ȡ�����ط����������б�(ʹ��Spring֧�����)
		LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();
		String[] paraNameArr = u.getParameterNames(method);
		// ʹ��SPEL����key�Ľ���
		ExpressionParser parser = new SpelExpressionParser();
		// SPEL������
		StandardEvaluationContext context = new StandardEvaluationContext();
		// �ѷ�����������SPEL��������
		for (int i = 0; i < paraNameArr.length; i++) {
			context.setVariable(paraNameArr[i], args[i]);
		}
		return parser.parseExpression(key).getValue(context, String.class);
	}

	
}
