package com.example.entity.lbEntity;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/26
 */
public class setupDepartments {
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    /**
     * 序号
     */
    private Integer departmentsId;
    /**
     * 部门编号
     */
    private Integer departmentsIdCard;
    /**
     * 部门名称
     */
    private String departmentsName;
    /**
     * 部门介绍
     */
    private String departmentsText;
    /**
     * 部门创建时间
     */
    private String departmentsCreateTime;
    /**
     * 创建人员
     */
    private String departmentsCreateBy;
    /**
     * 部门状态
     */
    private String departmentsStatus;

    public setupDepartments(Integer departmentsId, Integer departmentsIdCard,
                            String departmentsName, String departmentsText,
                            String departmentsCreateTime, String departmentsCreateBy,
                            String departmentsStatus)
    {
        this.departmentsId = departmentsId;
        this.departmentsIdCard = departmentsIdCard;
        this.departmentsName = departmentsName;
        this.departmentsText = departmentsText;
        this.departmentsCreateTime = departmentsCreateTime;
        this.departmentsCreateBy = departmentsCreateBy;
        this.departmentsStatus = departmentsStatus;
    }
    public setupDepartments()
    {
    }

    @Override
    public String toString() {
        return "setupDepartments{" +
                "departmentsId=" + departmentsId +
                ", departmentsIdCard=" + departmentsIdCard +
                ", departmentsName='" + departmentsName + '\'' +
                ", departmentsText='" + departmentsText + '\'' +
                ", departmentsCreateTime='" + departmentsCreateTime + '\'' +
                ", departmentsCreateBy='" + departmentsCreateBy + '\'' +
                ", departmentsStatus='" + departmentsStatus + '\'' +
                '}';
    }

    public Integer getDepartmentsId() {
        return departmentsId;
    }

    public void setDepartmentsId(Integer departmentsId) {
        this.departmentsId = departmentsId;
    }

    public Integer getDepartmentsIdCard() {
        return departmentsIdCard;
    }

    public void setDepartmentsIdCard(Integer departmentsIdCard) {
        this.departmentsIdCard = departmentsIdCard;
    }

    public String getDepartmentsName() {
        return departmentsName;
    }

    public void setDepartmentsName(String departmentsName) {
        this.departmentsName = departmentsName;
    }

    public String getDepartmentsText() {
        return departmentsText;
    }

    public void setDepartmentsText(String departmentsText) {
        this.departmentsText = departmentsText;
    }

    public String getDepartmentsCreateTime() {
        return departmentsCreateTime;
    }

    public void setDepartmentsCreateTime(String departmentsCreateTime) {
        this.departmentsCreateTime = departmentsCreateTime;
    }

    public String getDepartmentsCreateBy() {
        return departmentsCreateBy;
    }

    public void setDepartmentsCreateBy(String departmentsCreateBy) {
        this.departmentsCreateBy = departmentsCreateBy;
    }

    public String getDepartmentsStatus() {
        return departmentsStatus;
    }

    public void setDepartmentsStatus(String departmentsStatus) {
        this.departmentsStatus = departmentsStatus;
    }
}
