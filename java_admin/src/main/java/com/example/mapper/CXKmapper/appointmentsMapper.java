package com.example.mapper.CXKmapper;

import com.example.entity.CXKentity.Appointments;
import com.example.entity.CXKentity.AppointmentsVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface appointmentsMapper {
    List<AppointmentsVO> findAll(HashMap<String, String> map);

    boolean delById(int id);

    boolean update(AppointmentsVO appointmentsVO);
}
