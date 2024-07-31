package com.example.service.MercuryService;

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
 * @date 2024/7/22
 * @desc
 */
public interface DetailsService {
    List<Details> findAllDetails(HashMap<String, String> map);

    boolean sellDrug(List<String> names );

    void saveBatch(ArrayList<Drug> list);

    List<Drug> findAllDrug(Object o);

    boolean addPicture(Picture picture);
}
