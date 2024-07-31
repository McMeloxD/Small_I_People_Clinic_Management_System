package com.example.service.MercuryService.impl;

import com.example.entity.MercuryEntity.AddFee;
import com.example.mapper.MercuryMapper.AddFeeMapper;
import com.example.service.MercuryService.AddFeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/23
 * @desc
 */
@Service
public class AddFeeServiceImpl implements AddFeeService {

    @Autowired
    private AddFeeMapper addFeeMapper;


    @Override
    public List<AddFee> findAllAddFee() {
        return addFeeMapper.findAllAddFee();
    }
}
