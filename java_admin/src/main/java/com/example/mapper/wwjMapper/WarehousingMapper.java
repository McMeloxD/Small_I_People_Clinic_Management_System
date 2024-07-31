package com.example.mapper.wwjMapper;

import com.example.entity.wwjEntity.Warehousing;

import java.util.HashMap;
import java.util.List;

public interface WarehousingMapper {
    List<Warehousing> getList(HashMap<String,String> map);

    boolean delById(int id);
}
