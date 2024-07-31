package com.example.service.lbService.serviceImpl;

import com.example.entity.lbEntity.Patient;
import com.example.mapper.lbMapper.PatientMapper;
import com.example.service.lbService.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/23
 */
@Service
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientMapper mapper;
    @Override
    public List<Patient> findAll(HashMap<String, String> map) {
        return mapper.findAll(map);
    }

    @Override
    public boolean deleteById(Integer patientNum) {
        return mapper.deleteById(patientNum);
    }

    @Override
    public boolean addPatient(Patient patient) {
        System.out.println("patient = " + patient);
        return mapper.addPatient(patient);
    }

    @Override
    public boolean editPatient(Patient patient) {
        return mapper.editPatient(patient);
    }

}
