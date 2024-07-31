package com.example.controller.MercuryController;

import com.example.MyLog.MyLog;
import com.example.entity.MercuryEntity.TemporaryInfo;
import com.example.service.MercuryService.TemporaryInfoService;
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
public class TemporaryInfoController {

    @Autowired
    private TemporaryInfoService temporaryInfoService;

    @MyLog("开药患者记录")
    @PostMapping("addTemPatient")
    public R addTemPatient(@RequestBody TemporaryInfo temporaryInfo){
        boolean isok = temporaryInfoService.addTemPatient(temporaryInfo);
        return R.ok(isok);
    }

    @GetMapping("/findTemPat")
    public R findTemPat(){
        List<TemporaryInfo> list = temporaryInfoService.findTemPat();
        return R.ok(list);
    }

    @GetMapping("/clearInfo")
    public R clearInfo(){
        boolean isok = temporaryInfoService.clearInfo();
        return R.ok(isok);
    }
}
