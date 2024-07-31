package com.example.service.CXKservice;

import com.example.entity.CXKentity.Appointments;
import com.example.entity.CXKentity.AppointmentsVO;

import java.util.HashMap;
import java.util.List;

public interface appointmentsService {
    List<AppointmentsVO> findAll(HashMap<String, String> map);

    boolean delById(int id);

    boolean update(AppointmentsVO appointmentsVO);
}
