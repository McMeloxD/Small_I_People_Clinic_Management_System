package com.example.interceptor;

import com.example.entity.SysEntity.SysUser;
import com.example.exception.NoLoginException;
import com.example.until.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * --- Be Humble and Hungry ---
 *
 * @author McMeloxD
 * @date 2024/7/30
 * @desc 前端请求拦截
 */
@Component
public class AuthorizationInterceptor implements HandlerInterceptor {
    @Autowired
    private RedisUtil redisUtil;

    // 登录成功后，将token发送给前端
    // 前端发送请求时，需要将token放到请求头中，发送给后台

    // 本例，从Authorization这个请求头中获取token值
    // 注意,需要将前端的请求头改变为Authorization
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader("Authorization");
        if (token == null || "".equals(token)) {
            throw new NoLoginException(50008,"无效令牌,重新登录");
        }
        SysUser sysUser = redisUtil.getCacheObject("user:" + token);
        if (sysUser == null) {
            throw new NoLoginException(50014,"身份信息失效,重新登录");
        }
        return true;
    }
}
