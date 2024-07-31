package com.example.service.CXKservice;

import com.example.entity.CXKentity.Supplier;
import com.example.entity.CXKentity.Tu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/26
 * @desc
 */
public interface supplierService {

    List<Supplier> findAll(HashMap<String, String> map);

    boolean delById(int id);

    boolean update(Supplier supplier);

    boolean delByIds(List<Integer> ids);

    boolean addSupplier(Supplier supplier);

    void saveBatch(ArrayList<Supplier> list);

    List<Supplier> findAllz(Object o);
}
