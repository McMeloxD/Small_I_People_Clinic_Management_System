package com.example.mapper.CXKmapper;

import com.example.entity.CXKentity.Charge;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface chargeMapper {
    List<Charge> findAll(HashMap<String, String> map);

    boolean delById(int id);

    boolean update(Charge charge);

    boolean delByIds(List<Integer> ids);

    boolean addCharge(Charge charge);

    int findNumber();

    List<String> getDepartment();

    List<Map<String, Object>> getNumber();
}
