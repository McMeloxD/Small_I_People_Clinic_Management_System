package com.example.service.wjjservice.drugImpl;

import com.example.entity.wwjEntity.Drug;
import com.example.mapper.wwjMapper.DrugMapper;
import com.example.service.wjjservice.drugService.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * --- 天道酬勤 ---
 * <p>
 * author WangWenJie
 * date 2024/7/22
 * desc
 */
@Service
public class DrugServiceImpl implements DrugService {
    @Autowired
    private DrugMapper drugMapper;

    @Override
    public List<Drug> getList(Drug drug) {
        return drugMapper.getList(drug);
    }

    @Override

    public boolean delById(int id) {
        return drugMapper.delById(id);
    }

    @Override
    public boolean addDrug(Drug drug) {
        return drugMapper.addDrug(drug);
    }
@Override
    public List<Drug> sort() {
        return drugMapper.sort();
    }

    @Override
    public boolean editDrug(Drug drug) {
        return drugMapper.editDrug(drug);
    }
}
