package com.example.controller.CXKController;

import com.example.MyLog.MyLog;
import com.example.entity.CXKentity.Charge;
import com.example.service.CXKservice.chargeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.example.until.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/22
 * @desc
 */
@RestController
@RequestMapping("/md/nested")
public class chargeController {
    @Autowired
    private chargeService service;

    //查
    @GetMapping("/findAll")
    public R findAll(@RequestParam HashMap<String,String> map) {
        //System.out.println("99999"+map);
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        PageHelper.startPage(pageNum,pageSize);

        List<Charge> list = service.findAll(map);

        PageInfo<Charge> info = new PageInfo<>(list);
        return R.ok(info);
    }

    @MyLog("删除收费管理")
    //删除
    @GetMapping("/delById")
    public R delById(int id) {
        boolean isok = service.delById(id);
        System.out.println("9999" + isok);
        return R.ok(isok);
    }

    //改
    @MyLog("修改收费管理")
    @PostMapping("/update")
    public R update(@RequestBody Charge charge) {
        //System.out.println("charge" + charge);
        boolean isok = service.update(charge);
        return R.ok(isok);
    }

    //批量删除
    @MyLog("批量删除收费管理")
    @GetMapping("/dels")
    public R delByIds(@RequestParam List<Integer> ids) {
        boolean isok = service.delByIds(ids);
        return R.ok(isok);
    }

    //添加
    @PostMapping("/add")
    public R addCharge(@RequestBody Charge charge) {
        //System.out.println(charge);
        boolean isok = service.addCharge(charge);
        return R.ok(isok);
    }
    @GetMapping("/tu")
    public R getTu() {
        HashMap<String,List<Object>> map = service.getTu();
        return R.ok(map);
    }
}
