package com.example.service.CXKservice.impl;

import com.example.entity.CXKentity.Tu;
import com.example.mapper.CXKmapper.tuMapper;
import com.example.service.CXKservice.tuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/30
 * @desc
 */
@Service
public class tuServiceImpl implements tuService {
    @Autowired
    private tuMapper mapper;

    @Override
    public boolean addTu(Tu tu) {
        return mapper.addTu(tu);
    }

    @Override
    public List<Tu> findAll(HashMap<String, String> map) {
        return mapper.findAll(map);
    }
}
