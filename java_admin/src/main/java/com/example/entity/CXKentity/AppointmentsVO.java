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
public class AppointmentsVO extends Appointments{
    private Patients patients;
}
