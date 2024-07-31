package com.example.readListener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.example.entity.wwjEntity.Drug;
import com.example.service.MercuryService.DetailsService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/29
 * @desc
 */
@Component
@Scope("prototype")

public class DetailsDrugReadListener extends AnalysisEventListener<Drug> {

    private DetailsService detailsService;
    public DetailsDrugReadListener(){}
    public DetailsDrugReadListener(DetailsService detailsService){
        this.detailsService = detailsService;
    }

    private final int BATCH_COUNT = 5;
    private ArrayList<Drug> list = new ArrayList<>();
    @Override
    public void invoke(Drug drug, AnalysisContext analysisContext) {
        list.add(drug);
        if (list.size() >= BATCH_COUNT){
            saveDrug();

            list.clear();
        }

    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        if (list.size() > 0){
            saveDrug();
        }
        System.out.println("所有数据解析完成！");
    }

    private void saveDrug(){
        System.out.println("开始存储数据库！");
        detailsService.saveBatch(list);
        System.out.println("存储数据库成功");
    }
}
