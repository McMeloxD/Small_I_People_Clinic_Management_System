package com.example.service.lbService.serviceImpl;

import com.example.entity.lbEntity.setupRoles;
import com.example.mapper.lbMapper.SetupRolesMapper;
import com.example.service.lbService.setupRolseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/26
 */
@Service
public class setupRolseServiceImpl implements setupRolseService {
    @Autowired
    private SetupRolesMapper mapper;
    @Override
    public List<setupRoles> findAll(HashMap<String, String> map) {
        return mapper.findAll(map);
    }

    @Override
    public boolean deleteById(Integer rolesId) {
        return mapper.deleteById(rolesId);
    }

    @Override
    public boolean addRoles(setupRoles roles) {
        return mapper.addRoles(roles);
    }

    @Override
    public boolean editRoles(setupRoles roles) {
        return mapper.editRoles(roles);
    }
}
