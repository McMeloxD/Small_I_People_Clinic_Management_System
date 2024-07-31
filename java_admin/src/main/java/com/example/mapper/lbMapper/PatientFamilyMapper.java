package com.example.mapper.lbMapper;


import com.example.entity.lbEntity.PatientFamily;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;


/**
 * --- 好好好 ---
 *
 * @author LiuBing
 * @date 2024/7/24
 * @desc --- 代码敲烂 月薪过万 ---
 */
@Mapper
public interface PatientFamilyMapper {


    boolean deleteById(int patientNum);

    List<PatientFamily> findAllFamily(HashMap<String, String> map);

    boolean addFamily(PatientFamily family);

    boolean editFamily(PatientFamily family);

}
