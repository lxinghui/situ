package utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * ͨ�����༴������ͨ���������ȡspring�����bean
 * @author wolf
 *
 */
public final class SpringTool implements ApplicationContextAware {
    private static ApplicationContext applicationContext = null;

    
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        if (SpringTool.applicationContext == null) {
            SpringTool.applicationContext = applicationContext;
            System.out.println(
                    "========ApplicationContext���óɹ�,����ͨ�����ͨ������ToolSpring.getAppContext()��ȡapplicationContext����,applicationContext="
                            + applicationContext + "========");
        }
    }

    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public static Object getBean(String name) {
        return getApplicationContext().getBean(name);
    }
}