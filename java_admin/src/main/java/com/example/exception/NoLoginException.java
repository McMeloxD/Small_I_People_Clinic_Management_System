package com.example.exception;

/**
 * --- Be Humble and Hungry ---
 *
 * @author McMeloxD
 * @date 2024/7/30
 * @desc 未登录异常
 */
public class NoLoginException extends RuntimeException {

    // 为了接收状态码
    private int code;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public NoLoginException(int code,String message){
        super(message);
        this.code = code;
    }
}
