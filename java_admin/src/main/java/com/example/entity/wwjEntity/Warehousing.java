package com.example.entity.wwjEntity;

import java.time.LocalDateTime;

/**
 * --- 天道酬勤 ---
 * <p>
 * author WangWenJie
 * date 2024/7/25
 * desc
 */
public class Warehousing {
    private int id;
    private String warehousingOrder;
    private int type;
    private String supplierName;
    private String makeName;
    private double procurementAmount;
    private double procurementRetail;
    private String warehousingName;
    private LocalDateTime createTime;
    private LocalDateTime makeTime;
    private int reviewStatus;

    // Getters and Setters

    @Override
    public String toString() {
        return "Warehousing{" +
                "id=" + id +
                ", warehousingOrder='" + warehousingOrder + '\'' +
                ", type=" + type +
                ", supplierName='" + supplierName + '\'' +
                ", makeName='" + makeName + '\'' +
                ", procurementAmount=" + procurementAmount +
                ", procurementRetail=" + procurementRetail +
                ", warehousingName='" + warehousingName + '\'' +
                ", createTime=" + createTime +
                ", makeTime=" + makeTime +
                ", reviewStatus=" + reviewStatus +
                '}';
    }

    public LocalDateTime getMakeTime() {
        return makeTime;
    }

    public void setMakeTime(LocalDateTime makeTime) {
        this.makeTime = makeTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWarehousingOrder() {
        return warehousingOrder;
    }

    public void setWarehousingOrder(String warehousingOrder) {
        this.warehousingOrder = warehousingOrder;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getMakeName() {
        return makeName;
    }

    public void setMakeName(String makeName) {
        this.makeName = makeName;
    }

    public double getProcurementAmount() {
        return procurementAmount;
    }

    public void setProcurementAmount(double procurementAmount) {
        this.procurementAmount = procurementAmount;
    }

    public double getProcurementRetail() {
        return procurementRetail;
    }

    public void setProcurementRetail(double procurementRetail) {
        this.procurementRetail = procurementRetail;
    }

    public String getWarehousingName() {
        return warehousingName;
    }

    public void setWarehousingName(String warehousingName) {
        this.warehousingName = warehousingName;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public int getReviewStatus() {
        return reviewStatus;
    }

    public void setReviewStatus(int reviewStatus) {
        this.reviewStatus = reviewStatus;
    }

}
