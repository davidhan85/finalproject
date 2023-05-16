package com.team5.finalTopic.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME) //設定何時會跑
@Target(ElementType.METHOD) //設定哪裡可以使用這個註釋
public @interface MemberLogin {

}
