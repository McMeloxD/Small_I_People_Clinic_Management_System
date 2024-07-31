package com.example.service.lbService;

import com.example.entity.lbEntity.Patient;
import com.example.entity.lbEntity.setupEmployees;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * --- 好好好 ---
 *
 * @author LiuBing
 * @date 2024/7/25
 * @desc --- 代码敲烂 月薪过万 ---
 */
public interface setupEmployeesService {

    List<setupEmployees> findAll(HashMap<String, String> map);

    boolean deleteById(Integer employeesId);

    boolean addEmployees(setupEmployees employees);

    boolean editEmployees(setupEmployees employees);

    List<Map<String, Object>> findSex4Charts();


    //
}
