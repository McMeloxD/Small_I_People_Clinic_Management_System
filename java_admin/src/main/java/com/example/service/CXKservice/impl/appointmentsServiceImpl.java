package com.example.service.CXKservice.impl;

import com.example.entity.CXKentity.Appointments;
import com.example.entity.CXKentity.AppointmentsVO;
import com.example.mapper.CXKmapper.appointmentsMapper;
import com.example.service.CXKservice.appointmentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/27
 * @desc
 */
@Service
public class appointmentsServiceImpl implements appointmentsService {
    @Autowired
    private appointmentsMapper mapper;

    @Override
    public List<AppointmentsVO> findAll(HashMap<String, String> map) {
        return mapper.findAll(map);
    }

    @Override
    public boolean delById(int id) {
        return mapper.delById(id);
    }

    @Override
    public boolean update(AppointmentsVO appointmentsVO) {

        return mapper.update(appointmentsVO);
    }
}
