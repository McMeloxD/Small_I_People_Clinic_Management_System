package com.example.service.wjjservice.drugService;

import com.example.entity.wwjEntity.Warehousing;

import java.util.HashMap;
import java.util.List;

public interface WarehousingService {
    List<Warehousing> getList(HashMap<String,String> map);

    boolean delById(int id);
}
