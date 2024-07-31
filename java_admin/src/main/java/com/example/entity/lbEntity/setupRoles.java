package com.example.entity.lbEntity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/26
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class setupRoles {
    /**
     * 序号
     */
    private Integer rolesId;
    /**
     * 角色编号
     */
    private Integer rolesIdCard;
    /**
     * 角色名称
     */
    private String rolesName;
    /**
     * 角色描述
     */
    private String rolesText;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date rolesCreateTime;
    /**
     * 创建人员
     */
    private String rolesCreateBy;
    /**
     * 状态
     */
    private String rolesStatus;

}
