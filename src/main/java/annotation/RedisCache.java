package annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface RedisCache {
	public String key() default ""; // 缓存key
	public String fieldKey() default "";  // 缓存key 加field区别
	public Class type();// 类型   不同类型+key区别
	public int expire() default 0; // 缓存多少秒,默认无限期
}
