package com.example.entity.CXKentity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/23
 * @desc
 */
@Data
@ToString
public class Charge {
    //序号
    private int buillId;
    //订单编号
    private int orderNumber;
    //订单类型
    private String orderType;
    //患者姓名
    private String patientName;
    //患者性别
    private int patientSex;
    //患者年龄
    private int patientAge;
    //患者联系方式
    private String patientContact;
    //科室
    private String department;
    //接诊医生
    private String doctorName;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    //应收金额
    private double amountReceivable;
    //实收金额
    private double receiveAmount;
    //支付方式
    private int paymentMethod;
    //收费状态
    private int chargingState;
    //退费金额
    private double returnFee;

}
