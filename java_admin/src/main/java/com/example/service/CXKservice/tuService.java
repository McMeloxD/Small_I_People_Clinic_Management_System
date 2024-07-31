package com.example.service.CXKservice;

import com.example.entity.CXKentity.Tu;

import java.util.HashMap;
import java.util.List;

public interface tuService {
    boolean addTu(Tu tu);

    List<Tu> findAll(HashMap<String, String> map);
}
