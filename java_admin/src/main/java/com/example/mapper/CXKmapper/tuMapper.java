package com.example.mapper.CXKmapper;

import com.example.entity.CXKentity.Tu;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface tuMapper {
    boolean addTu(Tu tu);

    List<Tu> findAll(HashMap<String, String> map);
}
