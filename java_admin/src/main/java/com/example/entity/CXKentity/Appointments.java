package com.example.entity.CXKentity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/27
 * @desc
 */
@ToString
@Data
public class Appointments {
    private int appointmentId;
    private int patientId;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date appointmentDate;
    private String doctorName;
}
