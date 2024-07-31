package com.example.mapper.wwjMapper;

import com.example.entity.wwjEntity.Drug;

import java.util.List;

public interface DrugMapper {
   boolean delById(int id) ;

    List<Drug> getList(Drug drug);

    boolean addDrug(Drug drug);



 List<Drug> sort();

    boolean editDrug(Drug drug);
}
