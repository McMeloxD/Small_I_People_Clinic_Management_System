package com.example.mapper.lbMapper;

import com.example.entity.lbEntity.setupRoles;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

/**
 * --- 好好好 ---
 *
 * @author LiuBing
 * @date 2024/7/26
 * @desc --- 代码敲烂 月薪过万 ---
 */
@Mapper
public interface SetupRolesMapper {
    List<setupRoles> findAll(HashMap<String, String> map);

    boolean deleteById(Integer rolesId);

    boolean addRoles(setupRoles roles);

    boolean editRoles(setupRoles roles);
}
