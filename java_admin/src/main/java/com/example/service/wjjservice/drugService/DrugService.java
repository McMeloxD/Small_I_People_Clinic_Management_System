package com.example.service.wjjservice.drugService;

import com.example.entity.wwjEntity.Drug;

import java.util.List;


public interface DrugService {
    List<Drug> getList(Drug drug);


    boolean delById(int id);


    boolean addDrug(Drug drug);

    List<Drug> sort();

    boolean editDrug(Drug drug);

}
