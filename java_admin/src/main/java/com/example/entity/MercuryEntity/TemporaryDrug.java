package com.example.entity.MercuryEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/24
 * @desc
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TemporaryDrug {
    private int id;//序号
    private String medicineCoding;//药品编码
    private String medicineName;//药品名称
    private String specification;//药品规格
    private int buyNum;//数量
    private String unit;//单位
    private double sellPrice;//单价
    // private int category;
}
