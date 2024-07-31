package com.example.service.lbService;

import com.example.entity.lbEntity.PatientFamily;

import java.util.HashMap;
import java.util.List;

/**
 * --- 好好好 ---
 *
 * @author LiuBing
 * @date 2024/7/24
 * @desc --- 代码敲烂 月薪过万 ---
 */
public interface PatientFamilyService {



    boolean deleteById(int patientNum);

    List<PatientFamily> findAllFamily(HashMap<String, String> map);

    boolean addFamily(PatientFamily familyId);

    boolean editFamily(PatientFamily family);

}
