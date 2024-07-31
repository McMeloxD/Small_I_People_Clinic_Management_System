package com.example.controller.MercuryController;

import com.example.MyLog.MyLog;
import com.example.entity.MercuryEntity.TemporaryDrug;
import com.example.service.MercuryService.TemporaryDrugService;
import com.example.until.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/24
 * @desc
 */
@RestController
@RequestMapping("/temporary")
public class TemporaryDrugController {

    @Autowired
    private TemporaryDrugService temporaryDrugService;

    @MyLog("选购药品")
    @PostMapping("addTemDrug")
    public R addTemDrug(@RequestBody TemporaryDrug temporaryDrug){
        boolean isok = temporaryDrugService.addTemDrug(temporaryDrug);
        return R.ok(isok);
    }

    @GetMapping("/findAllTemDrug")
    public R findAllTemDrug(){
        List<TemporaryDrug> list = temporaryDrugService.findAllTemDrug();
        return R.ok(list);
    }

    @GetMapping("/delTemDrug")
    public R delTemDrug(int id){
        boolean isok = temporaryDrugService.delTemDrug(id);
        return R.ok(isok);
    }

    @GetMapping("/sum")
    public R sum(){
        double num = temporaryDrugService.sum();
        return R.ok(num);
    }

    @MyLog("收费操作")
    @GetMapping("/clearDrug")
    public R clearDrug(){
        boolean isok = temporaryDrugService.clearDrug();
        return R.ok(isok);
    }

}
