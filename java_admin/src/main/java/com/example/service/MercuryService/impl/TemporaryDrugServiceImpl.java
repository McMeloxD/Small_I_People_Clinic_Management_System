package com.example.service.MercuryService.impl;

import com.example.entity.MercuryEntity.TemporaryDrug;
import com.example.mapper.MercuryMapper.TemporaryDrugMapper;
import com.example.service.MercuryService.TemporaryDrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/24
 * @desc
 */
@Service
public class TemporaryDrugServiceImpl implements TemporaryDrugService {

    @Autowired
    private TemporaryDrugMapper temporaryDrugMapper;

    @Override
    public boolean addTemDrug(TemporaryDrug temporaryDrug) {
        return temporaryDrugMapper.addTemDrug(temporaryDrug);
    }

    @Override
    public List<TemporaryDrug> findAllTemDrug() {
        return temporaryDrugMapper.findAllTemDrug();
    }

    @Override
    public boolean delTemDrug(int id) {
        return temporaryDrugMapper.delTemDrug(id);
    }

    @Override
    public double sum() {
        return temporaryDrugMapper.sum();
    }

    @Override
    public boolean clearDrug() {
        return temporaryDrugMapper.clearDrug();
    }
}
