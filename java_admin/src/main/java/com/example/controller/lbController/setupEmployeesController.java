package com.example.controller.lbController;

import com.example.entity.lbEntity.setupEmployees;
import com.example.service.lbService.setupEmployeesService;
import com.example.until.R;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ---好好好---
 *
 * @author LiuBing
 * @date 2024/7/25
 */
@RestController
@RequestMapping("/setup/employ")
public class setupEmployeesController {
    @Autowired
    private setupEmployeesService service;

    /**
     * 分页/模糊查询
     */
    @GetMapping("/list")
    public R findAll(@RequestParam HashMap<String, String> map) {
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        // 1开始分页
        PageHelper.startPage(pageNum, pageSize);

        List<setupEmployees> list = service.findAll(map);
        // System.out.println("map = " + map);
        // System.out.println("list = " + list);


        // 2 获得全部页信息
        PageInfo<setupEmployees> info = new PageInfo<>(list);
        // System.out.println("pageInfo = " + list);
        // System.out.println("info = " + info);
        return R.ok(info);
    }

    // 删除员工信息
    @GetMapping("/del")
    public R deleteById(Integer employeesId) {
        System.out.println("employeesId = " + employeesId);
        boolean isOk = service.deleteById(employeesId);
        System.out.println("isOk = " + isOk);
        return R.ok(isOk);
    }

    // 添加员工信息
    @PostMapping("/add")
    public R addEmployees(@RequestBody setupEmployees employees) {
        System.out.println("employees = " + employees);
        boolean isOk = service.addEmployees(employees);
        return R.ok(isOk);
    }

    // 修改员工信息
    @PostMapping("/update")
    public R editEmployees(@RequestBody setupEmployees employees) {
        System.out.println("employees = " + employees);
        boolean isOk = service.editEmployees(employees);
        System.out.println("isOk = " + isOk);
        return R.ok(isOk);
    }

    @GetMapping("/sex")
    public R findSex4Charts() {
        List<Map<String, Object>> resultMap = service.findSex4Charts();
        System.out.println("resultMap = " + resultMap);
        ArrayList<String> sexList = new ArrayList<>();
        ArrayList<Object> numList = new ArrayList<>();
        resultMap.forEach(map -> {
            System.out.println("map = " + map);
            String sex = (String) map.get("sex");
            if (sex.equals("1")) {
                sexList.add("男");
            } else {
                sexList.add("女");
            }
            Object num = map.get("value");
                numList.add(num);
        });
        HashMap<String, Object> map = new HashMap<>();
        map.put("sex", sexList);
        map.put("num", numList);
        System.out.println("map = " + map);
        return R.ok(map);
    }
}
