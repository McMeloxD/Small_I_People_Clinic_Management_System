package com.example.entity.CXKentity;

import lombok.Data;
import lombok.ToString;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/27
 * @desc
 */
@Data
@ToString
public class Patients {
    private int patientId;
    private String patientName;
    private int patientSex;
    private int patientAge;
    private String patientPhone;
}
