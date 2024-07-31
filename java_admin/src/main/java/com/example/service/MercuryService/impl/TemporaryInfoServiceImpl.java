package com.example.service.MercuryService.impl;

import com.example.entity.MercuryEntity.TemporaryInfo;
import com.example.mapper.MercuryMapper.TemporaryInfoMapper;
import com.example.service.MercuryService.TemporaryInfoService;
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
public class TemporaryInfoServiceImpl implements TemporaryInfoService {

    @Autowired
    private TemporaryInfoMapper temporaryInfoMapper;

    @Override
    public boolean addTemPatient(TemporaryInfo temporaryInfo) {
        return temporaryInfoMapper.addTemPatient(temporaryInfo);
    }

    @Override
    public List<TemporaryInfo> findTemPat() {
        return temporaryInfoMapper.findTemPat();
    }

    @Override
    public boolean clearInfo() {
        return temporaryInfoMapper.clearInfo();
    }
}
