package com.example.until;

/**
 * --- 天道酬勤 ---
 *
 * @author QiuShiju
 * @date 2024/7/2
 * @desc 这个R类,就是用于返回JSON数据的封装类
 */
public class R {
    // code指的是状态码
    private int code;
    // msg是返回的信息
    private String msg;
    // 这是返回的数据
    private Object data;

    // 定义的方法
    public static R ok(){
        return new R(20000,"成功");
    }

    public static R fail(){
        return new R(4000,"失败");
    }
    public static R fail(String msg){
        return new R(4000,msg);
    }

    public static R fail(int code ,String msg){
        return new R(code,msg);
    }

    public static R ok(Object data){
        return new R(20000,"成功",data);
    }

    public static R ok(int code){
        return new R(code,"成功");
    }
    public static R ok(int code,String msg){
        return new R(code,msg);
    }

    public static R ok(int code,String msg,Object data){
        return new R(code,msg,data);
    }
    public R(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public R(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public R() {
    }



    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
