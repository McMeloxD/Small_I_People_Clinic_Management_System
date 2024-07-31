package com.example.entity.MercuryEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/22
 * @desc
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Details {
    private int id;//序号
    private String patientName;//患者姓名
    private String patientCard;//患者卡号
    private int patientAge;//患者年龄
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date dob;//患者出生日期
    private int patientSex;//患者性别
    private String patientContact;//患者联系方式
    private String idCardNum;//患者身份证号码
    private String feeName;//收费名称
    private String specification;//规格
    private String unitPrice;//单价
    private int num;//数量
    private String unit;//单位
    private double totalPrice;//总价
    private double retailAmount;//销售金额
    private double discount;//折扣
    private double discountAmount;//折后金额
    private String operator;//操作员

    private double addFee;//附加费用
    private double balance;//账号余额
    private double mark;//积分


}
