package com.example.controller.lbController;

import com.example.entity.lbEntity.setupDepartments;
import com.example.service.lbService.setupDepartmentsService;
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
 * @date 2024/7/26
 */
@RestController
@RequestMapping("/setup/depart")
public class setupDepartmentsController {

    @Autowired
    private setupDepartmentsService service;

    /**
     * 分页/模糊查询
     */
    @GetMapping("/list")
    public R findAll(@RequestParam HashMap<String,String> map) {
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        // 1开始分页
        PageHelper.startPage(pageNum,pageSize);

        List<setupDepartments> list = service.findAll(map);
        // System.out.println("map = " + map);
        // System.out.println("list = " + list);


        // 2 获得全部页信息
        PageInfo<setupDepartments> info = new PageInfo<>(list);
        // System.out.println("pageInfo = " + list);
        // System.out.println("info = " + info);
        return R.ok(info);
    }
    /**
     * 删除科室信息
     */
    @GetMapping("/del")
    public R deleteById(Integer departmentsIdCard) {
        System.out.println("departmentsId = " + departmentsIdCard);
        boolean isOk = service.deleteById(departmentsIdCard);
        return R.ok(isOk);
    }
    /**
     * 添加科室信息
     */
    @PostMapping("/add")
    public R addDepartments(@RequestBody setupDepartments departments) {
        boolean isOk = service.addDepartments(departments);
        return R.ok(isOk);
    }
    /**
     * 修改科室信息
     */
    @PostMapping("/update")
    public R editDepartments(@RequestBody setupDepartments departments) {
        System.out.println("departments = " + departments);
        boolean isOk = service.editDepartments(departments);
        System.out.println("isOk = " + isOk);
        return R.ok(isOk);
    }

}
