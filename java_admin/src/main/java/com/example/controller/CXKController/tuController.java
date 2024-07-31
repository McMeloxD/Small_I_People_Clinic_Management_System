package com.example.controller.CXKController;

import com.example.entity.CXKentity.Tu;
import com.example.service.CXKservice.tuService;
import com.example.until.R;
import com.example.until.TencentCOSUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/30
 * @desc
 */
@RestController
@RequestMapping("/tu")
public class tuController {

    @Autowired
    private tuService service;
    /**
     * 演示上传文件到OSS
     */
    @PostMapping("/upload")
    public R upload(MultipartFile file){
        String filePath = TencentCOSUtil.upLoadFile(file);
        System.out.println("filePath = " + filePath);
        return R.ok(filePath);
    }

    //添加图片
    @PostMapping("/addTu")
    public R addTu(@RequestBody Tu tu) {
        System.out.println(tu);
        boolean isok = service.addTu(tu);
        return R.ok(isok);
    }

    @GetMapping("/findAll")
    public R findAll(@RequestParam HashMap<String,String> map) {
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        PageHelper.startPage(pageNum,pageSize);

        List<Tu> list = service.findAll(map);
        PageInfo<Tu> info = new PageInfo<>(list);
        return R.ok(info);
    }
}
