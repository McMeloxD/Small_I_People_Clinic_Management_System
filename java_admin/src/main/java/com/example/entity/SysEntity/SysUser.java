package com.example.entity.SysEntity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

/**
 * 用户信息对象 sys_user
 *
 * @author McMeloxD
 * @date 2024-07-22
 */

@Data
public class SysUser{
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户账号
     */
    private String username;

    /**
     * 手机号码
     */
    private String phonenumber;

    /**
     * 用户性别（0男 1女 2未知）
     */
    private String sex;

    /**
     * 密码
     */
    private String password;


    /**
     * 最后登录时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "Asia/Shanghai")
    private Date loginDate;

    /**
     * 头像
     */
    private String avatar;

    /**
     * Ip地址
     */
    private String ipAddress;

    /**
     * 地址
     */
    private String address;

}
