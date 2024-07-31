package com.example.mapper.lbMapper;

import com.example.entity.lbEntity.setupDepartments;
import org.apache.ibatis.annotations.Mapper;

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
@Mapper
public interface setupDepartmentsMapper {
    List<setupDepartments> findAll(HashMap<String, String> map);

    boolean deleteById(Integer departmentsIdCard);

    boolean addDepartments(setupDepartments departments);

    boolean editDepartments(setupDepartments departments);

}
