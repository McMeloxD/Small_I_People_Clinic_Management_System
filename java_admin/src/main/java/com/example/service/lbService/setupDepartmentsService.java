package com.example.service.lbService;

import com.example.entity.lbEntity.setupDepartments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * --- 好好好 ---
 *
 * @author LiuBing
 * @date 2024/7/26
 * @desc --- 代码敲烂 月薪过万 ---
 */
public interface setupDepartmentsService {
    List<setupDepartments> findAll(HashMap<String, String> map);

    boolean deleteById(Integer departmentsIdCard);

    boolean addDepartments(setupDepartments departments);

    boolean editDepartments(setupDepartments departments);

}
