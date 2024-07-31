package com.example.mapper.MercuryMapper;

import com.example.entity.MercuryEntity.TemporaryInfo;

import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/24
 * @desc
 */
public interface TemporaryInfoMapper {

    boolean addTemPatient(TemporaryInfo temporaryInfo);

    List<TemporaryInfo> findTemPat();

    boolean clearInfo();
}
