package com.example.anno;

import com.alibaba.fastjson.JSONObject;
import com.example.MyLog.MyLog;
import com.example.entity.Log.Log;
import com.example.entity.SysEntity.SysUser;
import com.example.service.LogService.LogService;
import com.example.until.R;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/25
 * @desc
 */
@RestController
@Component
@Aspect
@RequestMapping("/log")
public class LogAspect {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private LogService logService;
    @Around("@annotation(com.example.MyLog.MyLog)")
    public Object recordLog(ProceedingJoinPoint joinPoint) throws Throwable {

        SysUser userInfo = (SysUser) request.getSession().getAttribute("userInfo");
        String username = userInfo.getUsername();
        // String operateUser = username;

        //执行的操作
        String annoDesc = getAnnoDesc(joinPoint);

        //操作时间
        Date operateTime = new Date();

        //操作类名
        String className = joinPoint.getTarget().getClass().getName();

        //操作方法名
        String methodName = joinPoint.getSignature().getName();

        long begin = System.currentTimeMillis();
        //调用原始目标方法运行
        Object result = joinPoint.proceed();
        long end = System.currentTimeMillis();
        R r = (R) result;

        //方法返回值
        String returnValue = JSONObject.toJSONString(r.getMsg());

        //操作耗时
        long costTime = end - begin;

        Log log = new Log(costTime, returnValue, operateTime, methodName, className, annoDesc,username);

        logService.add(log);

        return result;
    }
    public static String getAnnoDesc(ProceedingJoinPoint joinPoint) {
        String value = "";
        try {
            MethodSignature signature = (MethodSignature) joinPoint.getSignature( );
            // 获得目标方法对象
            Method method = signature.getMethod( );
            // 获得目标方法对象上的日志注解
            MyLog myLog = method.getDeclaredAnnotation(MyLog.class);
            // 获得日志注解上的值
            value = myLog.value( );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return value;
    }

    @GetMapping("/findAll")
    public R findAll(@RequestParam HashMap<String,String> map) {
        // System.out.println("363" + map);
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        PageHelper.startPage(pageNum,pageSize);
        List<Log> list = logService.findAll(map);
        PageInfo<Log> info = new PageInfo<>(list);
        return R.ok(info);
    }

    @GetMapping("/delLog")
    public R delLog(int id){
        boolean isok = logService.delLog(id);
        return R.ok(isok);
    }

}
