package com.example.entity.lbEntity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/25
 */
public class setupEmployees {
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    /**
     * 序号
     */
    private Integer employeesId;
    /**
     * 工号
     */
    private Integer employeesIdCard;
    /**
     * 员工姓名
     */
    private String employeesName;
    /**
     * 员工性别
     */
    private String employeesSex;
    /**
     * 员工年龄
     */
    private String employeesAge;
    /**
     * 员工电话
     */
    private String employeesPhone;
    /**
     * 诊所
     */
    private String employeesClinic;
    /**
     * 科室
     */
    private String departmentsName;
    /**
     * 角色
     */
    private String roleName;
    /**
     * 创建时间
     */
    private Date employeesCreateTime;
    /**
     * 创建人员
     */
    private String employeesBy;
    /**
     * 员工状态
     */
    private String employeesStatus;

    public setupEmployees() {
    }
    public setupEmployees(Integer employeesId, Integer employeesIdCard,
                          String employeesName, String employeesSex,
                          String employeesAge, String employeesPhone,
                          String employeesClinic, String departmentsName,
                          String roleName, Date employeesCreateTime,
                          String employeesBy, String employeesStatus)
    {
        this.employeesId = employeesId;
        this.employeesIdCard = employeesIdCard;
        this.employeesName = employeesName;
        this.employeesSex = employeesSex;
        this.employeesAge = employeesAge;
        this.employeesPhone = employeesPhone;
        this.employeesClinic = employeesClinic;
        this.departmentsName = departmentsName;
        this.roleName = roleName;
        this.employeesCreateTime = employeesCreateTime;
        this.employeesBy = employeesBy;
        this.employeesStatus = employeesStatus;
    }

    @Override
    public String toString() {
        return "setupEmployees{" +
                "employeesId=" + employeesId +
                ", employeesIdCard=" + employeesIdCard +
                ", employeesName='" + employeesName + '\'' +
                ", employeesSex='" + employeesSex + '\'' +
                ", employeesAge='" + employeesAge + '\'' +
                ", employeesPhone='" + employeesPhone + '\'' +
                ", employeesClinic='" + employeesClinic + '\'' +
                ", departmentsName='" + departmentsName + '\'' +
                ", roleName='" + roleName + '\'' +
                ", employeesCreateTime=" + employeesCreateTime +
                ", employeesBy='" + employeesBy + '\'' +
                ", employeesStatus='" + employeesStatus + '\'' +
                '}';
    }

    public Integer getEmployeesId() {
        return employeesId;
    }

    public void setEmployeesId(Integer employeesId) {
        this.employeesId = employeesId;
    }

    public Integer getEmployeesIdCard() {
        return employeesIdCard;
    }

    public void setEmployeesIdCard(Integer getEmployeesIdCard) {
        this.employeesIdCard = getEmployeesIdCard;
    }

    public String getEmployeesName() {
        return employeesName;
    }

    public void setEmployeesName(String employeesName) {
        this.employeesName = employeesName;
    }

    public String getEmployeesSex() {
        return employeesSex;
    }

    public void setEmployeesSex(String employeesSex) {
        this.employeesSex = employeesSex;
    }

    public String getEmployeesAge() {
        return employeesAge;
    }

    public void setEmployeesAge(String employeesAge) {
        this.employeesAge = employeesAge;
    }

    public String getEmployeesPhone() {
        return employeesPhone;
    }

    public void setEmployeesPhone(String employeesPhone) {
        this.employeesPhone = employeesPhone;
    }

    public String getEmployeesClinic() {
        return employeesClinic;
    }

    public void setEmployeesClinic(String employeesClinic) {
        this.employeesClinic = employeesClinic;
    }

    public String getDepartmentsName() {
        return departmentsName;
    }

    public void setDepartmentsName(String departmentsName) {
        this.departmentsName = departmentsName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Date getEmployeesCreateTime() {
        return employeesCreateTime;
    }

    public void setEmployeesCreateTime(Date employeesCreateTime) {
        this.employeesCreateTime = employeesCreateTime;
    }

    public String getEmployeesBy() {
        return employeesBy;
    }

    public void setEmployeesBy(String employeesBy) {
        this.employeesBy = employeesBy;
    }

    public String getEmployeesStatus() {
        return employeesStatus;
    }

    public void setEmployeesStatus(String employeesStatus) {
        this.employeesStatus = employeesStatus;
    }
}
