package com.example.service.SysUserService;

import com.example.entity.SysEntity.SysUser;
import com.example.until.R;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * --- 天道酬勤 ---
 *
 * @author QiuShiju
 * @date 2024/7/16
 * @desc
 */
public interface SysUserService {

    SysUser login(SysUser user);

    boolean updateLoginDate(SysUser sysUser, HttpServletRequest request);

    SysUser findProfileInfo(String username);

    boolean saveInfo(SysUser sysUser);

    int editPwd(String oldPwd,String newPwd,String username);

    R getSex4ECharts();


    HashMap<String, List<Object>> getDrug4ECharts();
}
