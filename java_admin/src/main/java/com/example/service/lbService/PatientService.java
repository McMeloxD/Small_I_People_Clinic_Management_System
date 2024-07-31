package com.example.service.lbService;

import com.example.entity.lbEntity.Patient;

import java.util.HashMap;
import java.util.List;

/**
 * --- 好好好 ---
 *
 * @author LiuBing
 * @date 2024/7/23
 * @desc --- 代码敲烂 月薪过万 ---
 */
public interface PatientService {
    List<Patient> findAll(HashMap<String, String> map);

    boolean deleteById(Integer patientNum);

    boolean addPatient(Patient patient);

    boolean editPatient(Patient patient);
}
