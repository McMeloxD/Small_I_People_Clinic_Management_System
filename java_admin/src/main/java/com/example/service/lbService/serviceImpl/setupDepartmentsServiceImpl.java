package com.example.service.lbService.serviceImpl;

import com.example.entity.lbEntity.setupDepartments;
import com.example.mapper.lbMapper.setupDepartmentsMapper;
import com.example.service.lbService.setupDepartmentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/26
 */
@Service
public class setupDepartmentsServiceImpl implements setupDepartmentsService {
    @Autowired
    private setupDepartmentsMapper mapper;
    @Override
    public List<setupDepartments> findAll(HashMap<String, String> map) {
        return mapper.findAll(map);
    }

    @Override
    public boolean deleteById(Integer departmentsIdCard) {
        return mapper.deleteById(departmentsIdCard);
    }

    @Override
    public boolean addDepartments(setupDepartments departments) {
        return mapper.addDepartments(departments);
    }

    @Override
    public boolean editDepartments(setupDepartments departments) {
        return mapper.editDepartments(departments);
    }

}
