package annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface RedisCache {
	public String key() default ""; // ����key
	public String fieldKey() default "";  // ����key ��field����
	public Class type();// ����   ��ͬ����+key����
	public int expire() default 0; // ���������,Ĭ��������
}
