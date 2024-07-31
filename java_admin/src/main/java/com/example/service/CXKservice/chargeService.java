package com.example.service.CXKservice;

import com.example.entity.CXKentity.Charge;

import java.util.HashMap;
import java.util.List;

public interface chargeService {
    List<Charge> findAll(HashMap<String, String> map);


    boolean delById(int id);

    boolean update(Charge charge);

    boolean delByIds(List<Integer> ids);

    boolean addCharge(Charge charge);

    HashMap<String, List<Object>> getTu();
}
