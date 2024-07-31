package com.example.controller.lbController;

import com.example.MyLog.MyLog;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.example.entity.lbEntity.PatientFamily;
import com.example.service.lbService.PatientFamilyService;
import com.example.until.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;


/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/24
 */
@RestController
@RequestMapping("/patient/family")
public class patientFamilyController {

    @Autowired
    private PatientFamilyService service;

    // 分页/模糊查询

    @GetMapping("/list")
    public R findAllFamily(@RequestParam HashMap<String, String> map) {
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        // System.out.println("pageSize = " + pageSize);
        // System.out.println("map = " + map);
        // 1开始分页
        PageHelper.startPage(pageNum, pageSize);

        List<PatientFamily> list = service.findAllFamily(map);
        // System.out.println("map = " + map);
        // System.out.println("list = " + list);


        // 2 获得全部页信息
        PageInfo<PatientFamily> info = new PageInfo<>(list);
        // System.out.println("pageInfo = " + list);
        // System.out.println("info = " + info);
        return R.ok(info);
    }

    //删除ById
    @MyLog("删除患者亲属信息")
    @GetMapping("/del")
    public R deleteById(int familyId) {
        System.out.println("familyId = " + familyId);
        boolean isOk = service.deleteById(familyId);
        System.out.println("isOk = " + isOk);
        return R.ok(isOk);
    }

    // 添加
    @MyLog("新增患者亲属信息")
    @PostMapping("/add")
    public R addFamily(@RequestBody PatientFamily family) {
        boolean isOk = service.addFamily(family);
        return R.ok(isOk);
    }

    // 修改
    @MyLog("修改患者亲属信息")
    @PostMapping("/update")
    public R editFamily(@RequestBody PatientFamily family) {
        System.out.println("family = " + family);
        boolean isOk = service.editFamily(family);
        return R.ok(isOk);
    }
}
