package com.example.controller.wwjController;

import com.example.MyLog.MyLog;
import com.example.entity.wwjEntity.Drug;
import com.example.service.wjjservice.drugService.DrugService;
import com.example.until.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * --- 天道酬勤 ---
 * <p>
 * author WangWenJie
 * date 2024/7/22
 * desc
 */
@RestController
@RequestMapping("/drug")
public class DrugController {
    @Autowired
    private DrugService drugService;

    @MyLog("查全部药品")
    @GetMapping("/findAll")
    public R getList(Drug drug) {
        List<Drug> list = drugService.getList(drug);

        // System.out.println("list = " + list);

        return R.ok(list);
    }



    @MyLog("删除药品")
    @GetMapping("/delById")
    public R delById(int id) {

        boolean isOk = drugService.delById(id);

        return R.ok(isOk);
    }


    @MyLog("添加药品")
    @PostMapping("/addDrug")
    public R addDrug(@RequestBody Drug drug) {
        System.out.println("drug = " + drug);
        boolean isOk = drugService.addDrug(drug);
        System.out.println("isOk = " + isOk);
        return R.ok(isOk);
    }


@PostMapping("/editDrug")
public  R editDrug(@RequestBody Drug drug){
    System.out.println("drug = " + drug);
        boolean isOk = drugService.editDrug(drug);
    System.out.println("isOk = " + isOk);
        return R.ok(isOk);
}

    /**
     * 查全部排序取前十个
     */
    @GetMapping("/sort")
    public R sort() {
        List<Drug> list = drugService.sort();
        return R.ok(list);
    }
}
