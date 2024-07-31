package com.example.entity.MercuryEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/24
 * @desc
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TemporaryInfo {
    private int id;
    private String patientName;
    private String patientCard;
    private int patientAge;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date dob;
    private int patientSex;
    private String patientContact;
    private String idCardNum;
    private String operator;


}
