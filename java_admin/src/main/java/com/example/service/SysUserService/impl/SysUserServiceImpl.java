package com.example.service.SysUserService.impl;


import com.example.entity.SysEntity.SysUser;
import com.example.entity.wwjEntity.Drug;
import com.example.mapper.MercuryMapper.DetailsMapper;
import com.example.mapper.SysUserMapper.SysUserMapper;
import com.example.mapper.wwjMapper.DrugMapper;
import com.example.service.SysUserService.SysUserService;
import com.example.until.IpAddressUtil;
import com.example.until.R;
import com.example.until.RsaUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * --- Be Humble and Hungry ---
 *
 * @author McMeloxD
 * @date 2024/7/16
 * @desc
 */
@Slf4j
@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private DrugMapper drugMapper;

    @Override
    public SysUser login(SysUser user) {
        try {
            user.setPassword(RsaUtils.decryptByPrivateKey(user.getPassword()));
        } catch (Exception e) {
            System.out.println("解密出错");
            throw new RuntimeException(e);
        }
            return sysUserMapper.login(user);

    }

    @Override
    public boolean updateLoginDate(SysUser sysUser, HttpServletRequest request) {
        // 设置ip地址和时间和地址
        sysUser.setLoginDate(new Date());
        sysUser.setIpAddress(IpAddressUtil.getIpAddress(request));
        sysUser.setAddress(IpAddressUtil.getIpAddressByOnline(IpAddressUtil.getIpAddress(request)));
        return sysUserMapper.updateLoginDate(sysUser);
    }

    @Override
    public SysUser findProfileInfo(String username) {
        return sysUserMapper.findProfileInfo(username);
    }

    @Override
    public boolean saveInfo(SysUser sysUser) {
        return sysUserMapper.saveInfo(sysUser);
    }

    @Override
    public int editPwd(String oldPwd,String newPwd,String username) {
        //先解密
        try {
            oldPwd = RsaUtils.decryptByPrivateKey(oldPwd);
            newPwd = RsaUtils.decryptByPrivateKey(newPwd);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        // 先检查旧密码输入的对不对
        SysUser sysUser = sysUserMapper.OldPwdisTrue(username,oldPwd);
        if (sysUser != null) {
            // 再检查新旧密码是否相同
            SysUser sysUser1 = sysUserMapper.pwdIsSame(username,newPwd);
            if (sysUser1 == null) {
                return sysUserMapper.editPwd(username,newPwd);
            }else return -2;
        }else return -1; //-1说明旧密码不对
    }

    @Override
    public R getSex4ECharts() {
        List<Map<String, Object>> sexValues = sysUserMapper.getSex4ECharts();
        List<Object> values = new ArrayList<>();
        // System.out.println("sexValues"+sexValues);
        sexValues.forEach(sexMap ->{
            if(sexMap.get("patient_sex").equals(0)){
                // System.out.println("val"+sexMap.get("val"));
                values.add(Integer.parseInt(String.valueOf(sexMap.get("val"))));
            }else if (sexMap.get("patient_sex").equals(1)){
                values.add(Integer.parseInt(String.valueOf(sexMap.get("val"))));
            }
        });
        // System.out.println("values"+values);
        HashMap<String, List<Object>> map = new HashMap<>();
        map.put("categories", Arrays.asList("男", "女"));

        map.put("values",values);
        return R.ok(map);
    }

    @Override
    public HashMap<String, List<Object>> getDrug4ECharts() {
        HashMap<String, List<Object>> map = new HashMap<>();
        // System.out.println("map"+map);
        List<Drug> list = drugMapper.getList(null);

        // System.out.println("list"+list);
        ArrayList<Object> name = new ArrayList<>();
        for (Drug drug : list) {
            name.add(drug.getMedicineName());
        }
        map.put("categories",name);
        ArrayList<Object> num = new ArrayList<>();
        for (Drug drug : list){
            num.add(drug.getSellNum());
        }
        map.put("values",num);
        // System.out.println("map2"+map);
        return map;
    }


}
