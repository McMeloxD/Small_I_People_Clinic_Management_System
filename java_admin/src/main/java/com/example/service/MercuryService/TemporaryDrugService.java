package com.example.service.MercuryService;

import com.example.entity.MercuryEntity.TemporaryDrug;

import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/24
 * @desc
 */
public interface TemporaryDrugService {
    boolean addTemDrug(TemporaryDrug temporaryDrug);

    List<TemporaryDrug> findAllTemDrug();

    boolean delTemDrug(int id);

    double sum();

    boolean clearDrug();
}
