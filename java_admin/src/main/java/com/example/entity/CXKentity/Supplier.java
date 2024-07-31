package com.example.entity.CXKentity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;
import org.joda.time.DateTime;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/26
 * @desc
 */
public class Supplier {
    @ExcelIgnore
    private Integer supplierId; // 供应商ID
    @ExcelProperty("供应商编号")
    private Integer supplierNumber; // 供应商编号
    @ExcelProperty("供应商名称")
    private String supplierName; // 供应商名称
    @ExcelProperty("联系人")
    private String contacts; // 联系人
    @ExcelProperty("联系电话")
    private String phone; // 联系电话
    @ExcelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "Asia/Shanghai")
    private Date createTime; // 创建时间
    @ExcelProperty("创建人员")
    private String supplierUser; // 创建人员
    @ExcelProperty("供应商状态")
    private Integer supplierState; // 供应商状态 (1.启用，2.禁用)

    @Override
    public String toString() {
        return "Supplier{" +
                "supplierId=" + supplierId +
                ", supplierNumber=" + supplierNumber +
                ", supplierName='" + supplierName + '\'' +
                ", contacts='" + contacts + '\'' +
                ", phone='" + phone + '\'' +
                ", createTime=" + createTime +
                ", supplierUser='" + supplierUser + '\'' +
                ", supplierState=" + supplierState +
                '}';
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Integer getSupplierNumber() {
        return supplierNumber;
    }

    public void setSupplierNumber(Integer supplierNumber) {
        this.supplierNumber = supplierNumber;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getSupplierUser() {
        return supplierUser;
    }

    public void setSupplierUser(String supplierUser) {
        this.supplierUser = supplierUser;
    }

    public Integer getSupplierState() {
        return supplierState;
    }

    public void setSupplierState(Integer supplierState) {
        this.supplierState = supplierState;
    }
}
