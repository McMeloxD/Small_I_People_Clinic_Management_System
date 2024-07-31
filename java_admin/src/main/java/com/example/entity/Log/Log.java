package com.example.entity.Log;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/25
 * @desc
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Log {
    private int id;
    private String operateUser;//操作人
    private String operateName;//执行的操作
    private String className;//操作的类名
    private String methodName;//操作的方法
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "Asia/Shanghai")
    private Date operateTime;//操作时间
    private String result;//操作结果
    private long costTime;//操作耗时

    public Log(long costTime, String result, Date operateTime, String methodName, String className, String operateName,String operateUser) {
        this.costTime = costTime;
        this.result = result;
        this.operateTime = operateTime;
        this.methodName = methodName;
        this.className = className;
        this.operateName = operateName;
        this.operateUser = operateUser;

    }
}

