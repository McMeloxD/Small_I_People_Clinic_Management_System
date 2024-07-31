package com.example.config;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.example.entity.CXKentity.Supplier;
import com.example.service.CXKservice.supplierService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import java.util.ArrayList;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/28
 * @desc
 */
@Component
@Scope("prototype")    // 作者要求每次读取都要使用新的Listener
public class MdUnitMeasureReadListener extends AnalysisEventListener<Supplier> {
    // 有个很重要的点 DemoDataListener 不能被spring管理，
    // 要每次读取excel都要new,然后里面用到spring可以构造方法传进去
    private supplierService service;
    public MdUnitMeasureReadListener(){} // 空参构造

    // 有参构造
    public MdUnitMeasureReadListener(supplierService service){
        this.service = service;
    }

    // 每隔5条存储数据库，实际项目中使用时可以100条，然后清理list ，方便内存回收
    private final int BATCH_COUNT = 5;
    private ArrayList<Supplier> list = new ArrayList<>( );


    // 每读一行，会调用该invoke方法一次
    @Override
    public void invoke(Supplier data, AnalysisContext analysisContext) {
        list.add(data);
        // 达到BATCH_COUNT了，需要去存储一次数据库，防止数据几万条数据在内存，容易OOM
        if (list.size() >= BATCH_COUNT) {
            // 调用方法,执行插入
            saveData();
            // 存储完成清理 list
            list.clear();
        }
    }

    // 全部读完之后，会调用该方法
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        // 这里也要保存数据，确保最后遗留的数据也存储到数据库
        if(list.size() > 0) {
            saveData( );
        }
        System.out.println("所有数据解析完成！");
    }

    // 向数据库插入数据
    private void saveData() {
        System.out.println("开始存储数据库！");

        // 调用业务层存数据库
        service.saveBatch(list);
        System.out.println("存储数据库成功！");
    }
}
