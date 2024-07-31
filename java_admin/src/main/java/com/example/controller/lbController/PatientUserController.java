package com.example.controller.lbController;

import com.example.MyLog.MyLog;
import com.example.entity.lbEntity.Patient;
import com.example.service.lbService.PatientService;
import com.example.until.R;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/23
 */
@RestController
@RequestMapping("/patient/pusher")
public class PatientUserController {

    @Autowired
    private PatientService service;
    /**
     * 分页查询
     */
    @GetMapping("/plist")
    public R findAll(@RequestParam HashMap<String,String> map) {
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        // 1开始分页
        PageHelper.startPage(pageNum,pageSize);

        List<Patient> list = service.findAll(map);
        // System.out.println("map = " + map);
        // System.out.println("list = " + list);


        // 2 获得全部页信息
        PageInfo<Patient> info = new PageInfo<>(list);
        // System.out.println("pageInfo = " + list);
        // System.out.println("info = " + info);
        return R.ok(info);
    }
    /**
     * 删除患者
     */
    @MyLog("删除患者")
    @GetMapping("/del")
    public R deleteById(int patientNum) {
        System.out.println("patientId = " + patientNum);
        boolean isOk = service.deleteById(patientNum);
        if (isOk == false) {
            return R.fail();
        }
        return R.ok(isOk);
    }
    /**
     * 添加患者
     */
    @MyLog("新增患者")
    @PostMapping("/add")
    public R addPatient(@RequestBody Patient patient) {
        System.out.println("patient = " + patient);
        boolean isOk = service.addPatient(patient);
        return R.ok(isOk);
    }
    /**
     * 修改患者信息
     */
    @MyLog("修改患者")
    @PostMapping("/update")
    public R editPatient(@RequestBody Patient patient) {
        System.out.println("patient = " + patient);
        boolean isOk = service.editPatient(patient);
        return R.ok(isOk);
    }
}
