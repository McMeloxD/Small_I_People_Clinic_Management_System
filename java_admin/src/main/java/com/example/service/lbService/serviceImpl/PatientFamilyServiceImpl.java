package com.example.service.lbService.serviceImpl;


import com.example.entity.lbEntity.PatientFamily;
import com.example.mapper.lbMapper.PatientFamilyMapper;
import com.example.service.lbService.PatientFamilyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/24
 */
@Service
public class PatientFamilyServiceImpl implements PatientFamilyService {

    @Autowired
    private PatientFamilyMapper mapper;

    // 删除
    @Override
    public boolean deleteById(int familyId) {
        return mapper.deleteById(familyId);
    }

    // 查询
    @Override
    public List<PatientFamily> findAllFamily(HashMap<String, String> map) {
        System.out.println("map = " + map);
        return mapper.findAllFamily(map);
    }

    // 添加
    @Override
    public boolean addFamily(PatientFamily family) {
        return mapper.addFamily(family);
    }

    // 修改
    @Override
    public boolean editFamily(PatientFamily family) {
        return mapper.editFamily(family);
    }


}
