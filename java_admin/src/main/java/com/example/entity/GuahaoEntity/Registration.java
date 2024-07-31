package com.example.entity.GuahaoEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * --- Be Humble and Hungry ---
 *
 * @author McMeloxD
 * @date 2024/7/24
 * @desc 挂号记录表
 */
@Data
public class Registration {
    /**
     * 序号
     */
    private int id;

    /**
     * 挂号单号
     */
    private String registrationCoding;

    /**
     * 挂号费
     */
    private double registrationFee;

    /**
     * 就诊状态
     */
    private int registrationState;

    /**
     * 科室
     */
    private String departments;

    /**
     * 接诊类型
     */
    private int receptionType;

    /**
     * 接诊医生
     */
    private String doctorName;

    /**
     * 诊疗费
     */
    private Double consultationFee;

    /**
     * 应收费用(挂号费+诊疗费)
     */
    private Double receivable;

    /**
     * 挂号日期
     * 注意：我们在格式化的时候要指定时区（timezone ），不然前端接收的日期会少1一天
     * 是因为@JsonFormat注解默认的时区为格林尼治时间，比中国时间（东八区是要小8个小时的）。
     */
    @JsonFormat(pattern = "yyyy-MM-dd" , locale = "zh", timezone = "Asia/Shanghai")
    private Date registrationDate;

    /**
     * 挂号员
     */
    private String registrationBy;

    /**
     * 患者姓名
     */
    private String patientName;

    /**
     * 患者性别
     */
    private int patientSex;

    /**
     * 患者年龄
     */
    private int patientAge;

}
