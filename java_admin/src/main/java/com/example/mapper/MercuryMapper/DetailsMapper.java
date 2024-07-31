package com.example.mapper.MercuryMapper;

import com.example.entity.MercuryEntity.Details;
import com.example.entity.MercuryEntity.Picture;
import com.example.entity.wwjEntity.Drug;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/23
 * @desc
 */
public interface DetailsMapper {
    List<Details> findAllDetails(HashMap<String, String> map);

    boolean sellDrug(List<String> names);

    void saveBatch(ArrayList<Drug> list);

    List<Drug> findAllDrug(Object o);

    boolean addPicture(Picture picture);
}
