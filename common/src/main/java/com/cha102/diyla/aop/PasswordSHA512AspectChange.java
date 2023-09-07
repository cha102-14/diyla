package com.cha102.diyla.aop;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface PasswordSHA512AspectChange {
    String description() default "";
}
