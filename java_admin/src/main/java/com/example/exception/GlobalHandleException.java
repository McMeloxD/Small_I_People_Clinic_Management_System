package com.example.exception;

import com.example.until.R;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 *
 * @author McMeloxD
 * @date 2024/7/30
 * @desc 自定义全局异常处理类
 */
@RestControllerAdvice
public class GlobalHandleException  {

    @ExceptionHandler(NoLoginException.class)
    public R handlerException(Exception ex){
        System.out.println("出错啦!" + ex.getMessage());
        NoLoginException noLoginException = (NoLoginException) ex;
        // 返回状态码和错误信息
        return R.fail(noLoginException.getCode(),noLoginException.getMessage());
    }
}
