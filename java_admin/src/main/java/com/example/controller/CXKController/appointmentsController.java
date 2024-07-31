package com.example.controller.CXKController;

import com.example.entity.CXKentity.Appointments;
import com.example.entity.CXKentity.AppointmentsVO;
import com.example.service.CXKservice.appointmentsService;
import com.example.until.R;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/27
 * @desc
 */
@RestController
@RequestMapping("/appointment")
public class appointmentsController {
    @Autowired
    private appointmentsService service;

    //查，分页
    @GetMapping("/findAll")
    public R findAll(@RequestParam HashMap<String,String> map) {
        System.out.println("1" + map);
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        PageHelper.startPage(pageNum,pageSize);

        List<AppointmentsVO> appointmentsVOS = service.findAll(map);
        PageInfo<AppointmentsVO> info = new PageInfo<>(appointmentsVOS);
        return R.ok(info);
    }

    //删
    @GetMapping("/delById")
    public R delById(int id) {
        boolean isok = service.delById(id);
        return R.ok(isok);
    }

    //改
    @PostMapping("/update")
    public R update(@RequestBody AppointmentsVO appointmentsVO) {
        System.out.println("1234"+appointmentsVO);
        boolean isok = service.update(appointmentsVO);
        return R.ok(isok);
    }
}
