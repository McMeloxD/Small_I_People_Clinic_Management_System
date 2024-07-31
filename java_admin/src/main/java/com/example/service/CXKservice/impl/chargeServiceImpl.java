package com.example.service.CXKservice.impl;

import com.example.entity.CXKentity.Charge;
import com.example.mapper.CXKmapper.chargeMapper;
import com.example.service.CXKservice.chargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/22
 * @desc
 */
@Service
public class chargeServiceImpl implements chargeService {
    @Autowired
    private chargeMapper mapper;


    @Override
    public List<Charge> findAll(HashMap<String, String> map) {
        return mapper.findAll(map);
    }

    @Override
    public boolean delById(int id) {
        return mapper.delById(id);
    }

    @Override
    public boolean update(Charge charge) {
        return mapper.update(charge);
    }

    @Override
    public boolean delByIds(List<Integer> ids) {
        return mapper.delByIds(ids);
    }

    @Override
    public boolean addCharge(Charge charge) {
        charge.setCreateTime(new Date());
        int i = mapper.findNumber();
        System.out.println("i"+i);
        i++;
        charge.setOrderNumber(i);
        return mapper.addCharge(charge);
    }

    @Override
    public HashMap<String, List<Object>> getTu() {
        HashMap<String, List<Object>> map = new HashMap<>();
        List<String> department = mapper.getDepartment();
        map.put("categories", Collections.singletonList(department));
        List<Map<String,Object>> number = mapper.getNumber();
        List<Object> objects = new ArrayList<>();
        for (String s : department) {
            for (Map<String, Object> objectMap : number) {
                if (s.equals(objectMap.get("name"))) {
                    objects.add(objectMap.get("num"));
                }
            }
        }
        map.put("values",objects);
        return map;
    }

}
