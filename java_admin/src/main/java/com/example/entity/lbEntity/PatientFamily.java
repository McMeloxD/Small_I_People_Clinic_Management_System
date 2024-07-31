package com.example.entity.lbEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.example.entity.lbEntity.PatientFamily;

import java.util.Date;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/24
 */
public class PatientFamily {
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")

    private Integer familyId;
    private Integer patientNum;
    private Integer familyRelation;
    private String familyName;
    private String familySex;
    private String workUnit;
    private Date familyDob;
    private String familyPhone;

    public PatientFamily()
    {
    }
    public PatientFamily(Integer familyId, Integer patientNum,
                         Integer familyRelation, String familyName,
                         String familySex, String workUnit,
                         Date familyDob, String familyPhone)
    {
        this.familyId = familyId;
        this.patientNum = patientNum;
        this.familyRelation = familyRelation;
        this.familyName = familyName;
        this.familySex = familySex;
        this.workUnit = workUnit;
        this.familyDob = familyDob;
        this.familyPhone = familyPhone;
    }

    @Override
    public String toString() {
        return "PatientFamily{" +
                "familyId=" + familyId +
                ", patientId=" + patientNum +
                ", familyRelation='" + familyRelation + '\'' +
                ", familyName='" + familyName + '\'' +
                ", familySex='" + familySex + '\'' +
                ", workUnit='" + workUnit + '\'' +
                ", familyDob=" + familyDob +
                ", familyPhone='" + familyPhone + '\'' +
                '}';
    }

    public Integer getFamilyId() {
        return familyId;
    }

    public void setFamilyId(Integer familyId) {
        this.familyId = familyId;
    }

    public Integer getPatientNum() {
        return patientNum;
    }

    public void setPatientNum(Integer patientNum) {
        this.patientNum = patientNum;
    }

    public Integer getFamilyRelation() {
        return familyRelation;
    }

    public void setFamilyRelation(Integer familyRelation) {
        this.familyRelation = familyRelation;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getFamilySex() {
        return familySex;
    }

    public void setFamilySex(String familySex) {
        this.familySex = familySex;
    }

    public String getWorkUnit() {
        return workUnit;
    }

    public void setWorkUnit(String workUnit) {
        this.workUnit = workUnit;
    }

    public Date getFamilyDob() {
        return familyDob;
    }

    public void setFamilyDob(Date familyDob) {
        this.familyDob = familyDob;
    }

    public String getFamilyPhone() {
        return familyPhone;
    }

    public void setFamilyPhone(String familyPhone) {
        this.familyPhone = familyPhone;
    }
}
