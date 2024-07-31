package com.example.service.MercuryService.impl;

import com.example.entity.MercuryEntity.Details;
import com.example.entity.MercuryEntity.Picture;
import com.example.entity.wwjEntity.Drug;
import com.example.mapper.MercuryMapper.DetailsMapper;
import com.example.service.MercuryService.DetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/22
 * @desc
 */
@Service
public class DetailsServiceImpl implements DetailsService {

    @Autowired
    private DetailsMapper detailsMapper;
    @Override
    public List<Details> findAllDetails(HashMap<String, String> map) {
        return detailsMapper.findAllDetails(map);
    }

    @Override
    public boolean sellDrug(List<String> names) {

        return detailsMapper.sellDrug(names);
    }

    @Override
    public void saveBatch(ArrayList<Drug> list) {
        detailsMapper.saveBatch(list);
    }

    @Override
    public List<Drug> findAllDrug(Object o) {
        return detailsMapper.findAllDrug(o);
    }

    @Override
    public boolean addPicture(Picture picture) {
        return detailsMapper.addPicture(picture);
    }
}
