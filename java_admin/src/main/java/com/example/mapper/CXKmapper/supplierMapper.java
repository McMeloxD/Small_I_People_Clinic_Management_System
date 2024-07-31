package com.example.mapper.CXKmapper;

import com.example.entity.CXKentity.Supplier;
import com.example.entity.CXKentity.Tu;
import com.example.service.CXKservice.supplierService;
import org.apache.ibatis.annotations.Mapper;

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
@Mapper
public interface supplierMapper {

    List<Supplier> findAll(HashMap<String, String> map);

    boolean delById(int id);

    boolean update(Supplier supplier);

    boolean delByIds(List<Integer> ids);

    boolean addSupplier(Supplier supplier);

    int findNumber();

    void saveBatch(ArrayList<Supplier> list);

    List<Supplier> findAllz(Object o);

}
