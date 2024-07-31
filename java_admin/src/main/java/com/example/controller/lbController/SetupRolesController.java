package com.example.controller.lbController;

import com.example.entity.lbEntity.setupRoles;
import com.example.service.lbService.setupRolseService;
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
@RequestMapping("/setup/roles")
public class SetupRolesController {
    @Autowired
    private setupRolseService service;
    /**
     * 分页/模糊查询
     */
    @GetMapping("/list")
    public R findAll(@RequestParam HashMap<String,String> map) {
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        // 1开始分页
        PageHelper.startPage(pageNum,pageSize);

        List<setupRoles> list = service.findAll(map);
        // System.out.println("map = " + map);
        // System.out.println("list = " + list);


        // 2 获得全部页信息
        PageInfo<setupRoles> info = new PageInfo<>(list);
        // System.out.println("pageInfo = " + list);
        // System.out.println("info = " + info);
        return R.ok(info);
    }
    /**
     * 删除角色信息
     */
    @GetMapping("/del")
    public R deleteById(Integer rolesId) {
        boolean isOk = service.deleteById(rolesId);
        return R.ok(isOk);
    }
    /**
     * 添加角色信息
     */
    @PostMapping("/add")
    public R addRoles(@RequestBody setupRoles roles) {
        System.out.println("roles = " + roles);
        boolean isOk = service.addRoles(roles);
        return R.ok(isOk);
    }
    /**
     * 修改角色信息
     */
    @PostMapping("/update")
    public R editRoles(@RequestBody setupRoles roles) {
        boolean isOk = service.editRoles(roles);
        return R.ok(isOk);
    }
}
