package com.example.mapper.SysUserMapper;


import com.example.entity.SysEntity.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * --- 天道酬勤 ---
 *
 * @author QiuShiju
 * @date 2024/7/16
 * @desc
 */
@Mapper
public interface SysUserMapper {

    SysUser login(SysUser user);

    boolean updateLoginDate(SysUser sysUser);

    SysUser findProfileInfo(String username);

    boolean saveInfo(SysUser sysUser);

    int editPwd(@Param("username") String username,@Param("newpwd")String newpwd);

    SysUser OldPwdisTrue(@Param("username") String username, @Param("oldPwd")String oldPwd);

    SysUser pwdIsSame(@Param("username")String username, @Param("newPwd")String newPwd);

    List<Map<String, Object>> getSex4ECharts();

}
