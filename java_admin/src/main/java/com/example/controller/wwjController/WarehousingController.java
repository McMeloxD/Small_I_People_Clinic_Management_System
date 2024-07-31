package com.example.controller.wwjController;

import com.example.entity.wwjEntity.Warehousing;
import com.example.service.wjjservice.drugService.WarehousingService;
import com.example.until.R;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * --- 天道酬勤 ---
 * <p>
 * author WangWenJie
 * date 2024/7/25
 * desc
 */
@RestController
@RequestMapping("/warehousing")
public class WarehousingController {
@Autowired
private WarehousingService warehousingService;
@GetMapping("/getList")
    public R grtList(@RequestParam HashMap<String,String> map){
    int pageNum = Integer.parseInt(map.get("pageNum"));
    int pageSize = Integer.parseInt(map.get("pageSize"));
    PageHelper.startPage(pageNum,pageSize);
    System.out.println("接收到的"+ map);
        List<Warehousing> list = warehousingService.getList(map);
    PageInfo<Warehousing> info  = new PageInfo<>(list);
    System.out.println("返回的"+ info);
        return R.ok(info);
    }

    @GetMapping("/delById")
    public R delById(int id){
       boolean isOk = warehousingService.delById(id);
       return R.ok(isOk);
    }

}
