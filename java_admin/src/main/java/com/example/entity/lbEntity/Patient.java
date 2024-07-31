package com.example.entity.lbEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.example.entity.lbEntity.Patient;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/23
 */
public class Patient {
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Long patientId;
    private String patientNum;
    private String patientName;
    private String patientSex;
    private String patientAge;
    private String patientPhone;
    private String opreator;

    public Patient() {
    }

    public Patient(Long patientId, String patientNum,
                   String patientName, String patientSex,
                   String patientAge, String patientPhone,
                   String opreator) {
        this.patientId = patientId;
        this.patientNum = patientNum;
        this.patientName = patientName;
        this.patientSex = patientSex;
        this.patientAge = patientAge;
        this.patientPhone = patientPhone;
        this.opreator = opreator;
    }

    @Override
    public String toString() {
        return "Patient{" +
                "id=" + patientId +
                ", patientNum='" + patientNum + '\'' +
                ", patientName='" + patientName + '\'' +
                ", patientSex='" + patientSex + '\'' +
                ", patientAge='" + patientAge + '\'' +
                ", patientPhone='" + patientPhone + '\'' +
                ", opreator='" + opreator + '\'' +
                '}';
    }

    public Long getId() {
        return patientId;
    }

    public void setId(Long id) {
        this.patientId = patientId;
    }

    public String getPatientNum() {
        return patientNum;
    }

    public void setPatientNum(String patientNum) {
        this.patientNum = patientNum;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientSex() {
        return patientSex;
    }

    public void setPatientSex(String patientSex) {
        this.patientSex = patientSex;
    }

    public String getPatientAge() {
        return patientAge;
    }

    public void setPatientAge(String patientAge) {
        this.patientAge = patientAge;
    }

    public String getPatientPhone() {
        return patientPhone;
    }

    public void setPatientPhone(String patientPhone) {
        this.patientPhone = patientPhone;
    }

    public String getOpreator() {
        return opreator;
    }

    public void setOpreator(String opreator) {
        this.opreator = opreator;
    }
}
