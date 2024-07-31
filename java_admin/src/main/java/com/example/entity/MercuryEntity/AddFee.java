package com.example.entity.MercuryEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/23
 * @desc
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AddFee {
    private int id;//附加费序号
    private String additionType;//附加类型
    private int additionNum;//数量
    private double additionPrice;//价格

}
