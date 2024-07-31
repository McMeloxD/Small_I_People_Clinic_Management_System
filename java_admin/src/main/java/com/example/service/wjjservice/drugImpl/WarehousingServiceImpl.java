package com.example.service.wjjservice.drugImpl;

import com.example.entity.wwjEntity.Warehousing;
import com.example.mapper.wwjMapper.WarehousingMapper;
import com.example.service.wjjservice.drugService.WarehousingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * --- 天道酬勤 ---
 * <p>
 * author WangWenJie
 * date 2024/7/25
 * desc
 */
@Service
public class WarehousingServiceImpl implements WarehousingService {
    @Autowired
    private WarehousingMapper warehousingMapper;

    @Override
    public List<Warehousing> getList(HashMap<String,String> map) {
        return warehousingMapper.getList(map);
    }

    @Override
    public boolean delById(int id) {
        return warehousingMapper.delById(id);
    }
}
