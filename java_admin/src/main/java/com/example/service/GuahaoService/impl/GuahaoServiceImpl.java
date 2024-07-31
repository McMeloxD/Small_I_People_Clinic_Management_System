package com.example.service.GuahaoService.impl;

import com.example.entity.GuahaoEntity.Doctor;
import com.example.entity.GuahaoEntity.Registration;
import com.example.mapper.GuahaoMapper.GuahaoMapper;
import com.example.service.GuahaoService.GuahaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * --- Be Humble and Hungry ---
 *
 * @author McMeloxD
 * @date 2024/7/24
 * @desc
 */

@Service
public class GuahaoServiceImpl implements GuahaoService {

    @Autowired
    private GuahaoMapper guahaoMapper;

    @Override
    public List<Registration> findAllGuahaoInfos(String departments, String doctorName, String startDate, String endDate, String patientName) {
        return guahaoMapper.findAllGuahaoInfos(departments,doctorName,startDate,endDate,patientName);
    }

    @Override
    public boolean delByCoding(String coding) {
        return guahaoMapper.delByCoding(coding);
    }

    @Override
    public boolean guahaoService(Registration registration) {
        //应收金额为挂号费+诊疗费
        registration.setReceivable(registration.getRegistrationFee()+registration.getConsultationFee());
        //挂号单由当前日期+数据库最新记录排序
        String code = guahaoMapper.getNewCode();
        Long coding = Long.valueOf(code); // 获取最新一条code
        //获取当前日期 年份月份日 中间无分隔符
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String now = sdf.format(new Date());
        // 判断是否相等
        if (now.equals(code.substring(0,8))) {
            //如果相等就在原本的coding基础上+1
            registration.setRegistrationCoding(String.valueOf(coding+1));
        }else {
            //不相等就用新的日期从1开始
            registration.setRegistrationCoding(now+"0001");
        }

        System.out.println(registration);
        return guahaoMapper.guahaoService(registration);
    }

    @Override
    public List<Doctor> findDoctors(String departments) {
        return guahaoMapper.findDoctors(departments);
    }

    @Override
    public boolean editGuahaoInfo(Registration registration) {
        return guahaoMapper.editGuahaoInfo(registration);
    }

    @Override
    public boolean jiuZhen(String patientName) {
        return guahaoMapper.jiuZhen(patientName);
    }

    @Override
    public List<Registration> findAllGuahaoInfosBfy() {
        return guahaoMapper.findAllGuahaoInfosBfy();
    }

    @Override
    public List<Map<String, Object>> getBingkeECharts() {
        List<Map<String, Object>> map = guahaoMapper.getBingkeECharts();
        return map;
    }
}
