package com.example.service.CXKservice.impl;

import com.example.entity.CXKentity.Supplier;
import com.example.entity.CXKentity.Tu;
import com.example.mapper.CXKmapper.supplierMapper;
import com.example.service.CXKservice.supplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/26
 * @desc
 */
@Service
public class supplierServiceImpl implements supplierService {
    @Autowired
    private supplierMapper mapper;

    @Override
    public List<Supplier> findAll(HashMap<String, String> map) {
        return mapper.findAll(map);
    }

    @Override
    public boolean delById(int id) {
        return mapper.delById(id);
    }

    @Override
    public boolean update(Supplier supplier) {
        return mapper.update(supplier);
    }

    @Override
    public boolean delByIds(List<Integer> ids) {
        return mapper.delByIds(ids);
    }

    @Override
    public boolean addSupplier(Supplier supplier) {
        supplier.setCreateTime(new Date());
        int i = mapper.findNumber();
        i++;
        supplier.setSupplierNumber(i);
        return mapper.addSupplier(supplier);
    }

    @Override
    public void saveBatch(ArrayList<Supplier> list) {
        mapper.saveBatch(list);
    }

    @Override
    public List<Supplier> findAllz(Object o) {
        return mapper.findAllz(o);
    }

}
