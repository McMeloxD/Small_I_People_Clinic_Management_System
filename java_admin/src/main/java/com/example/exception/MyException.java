package com.example.exception;

import com.example.until.R;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/26
 * @desc
 */
@ControllerAdvice
public class MyException {
    @ExceptionHandler(Exception.class)
    public R handlerException(Exception e) {
        return R.fail("系统出错了，请耐心等待");
    }
}
