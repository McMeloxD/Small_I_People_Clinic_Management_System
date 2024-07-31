package com.example.entity.wwjEntity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * --- 天道酬勤 ---
 * <p>
 * author WangWenJie
 * date 2024/7/22
 * desc 药品信息表
 */
@Data
public class Drug {
    //   序号
    @ExcelIgnore
    private int id;
    //   药品编码
    @ExcelProperty(value = "药品编码")
    private String medicineCoding;
    //药品名称
    @ExcelProperty(value = "药品名称")
    private String medicineName;
    //规格
    @ExcelProperty(value = "规格")
    private String specification;
    //  处方类别
    @ExcelProperty(value = "处方类别")
    private int category;
    //采购价
    @ExcelIgnore
    private double purchasePrice;
    //   售药价
    @ExcelProperty(value = "售药价")
    private double sellPrice;
    //   生产厂家
    @ExcelProperty(value = "生产厂家")
    private String manufacturers;
    //   药品状态
    @ExcelIgnore
    private int medicineState;
    //   创建时间
    @ExcelIgnore
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    //    药品剂型
    @ExcelIgnore
    private int medicineType;
    //     是否是OTC
    @ExcelIgnore
    private int OTCMedicine;
    //     批准文号
    @ExcelIgnore
    private String approvalNumber;
    //    出售数量
    @ExcelProperty(value = "出售数量")
    private int sellNum;
    //     库存数量
    @ExcelProperty(value = "库存数量")
    private int repertoryNum;
    //     调价次数
    @ExcelIgnore
    private int number;
    //购买数量
    @ExcelProperty(value = "购买数量")
    private int buyNum;
    //单位
    @ExcelIgnore
    private String unit;


}
