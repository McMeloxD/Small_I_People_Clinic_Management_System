package com.example.service.lbService.serviceImpl;

import com.example.entity.lbEntity.Patient;
import com.example.entity.lbEntity.setupEmployees;
import com.example.mapper.lbMapper.setupEmployeesMapper;
import com.example.service.lbService.setupEmployeesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/25
 */
@Service
public class setupEmployeesServiceImpl implements setupEmployeesService {

    @Autowired
    private setupEmployeesMapper mapper;
    @Override
    public List<setupEmployees> findAll(HashMap<String, String> map) {
        return mapper.findAll(map);
    }

    @Override
    public boolean deleteById(Integer employeesId) {
        return mapper.deleteById(employeesId);
    }

    @Override
    public boolean addEmployees(setupEmployees employees) {
        return mapper.addEmployees(employees);
    }

    @Override
    public boolean editEmployees(setupEmployees employees) {
        return mapper.editEmployees(employees);
    }

    @Override
    public List<Map<String, Object>> findSex4Charts() {
        return mapper.findSex4Echarts();
    }


}
