package com.example.controller.CXKController;

import com.alibaba.excel.EasyExcel;
import com.example.config.MdUnitMeasureReadListener;
import com.example.entity.CXKentity.Supplier;
import com.example.entity.CXKentity.Tu;
import com.example.service.CXKservice.supplierService;
import com.example.until.R;
import com.example.until.TencentCOSUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

/**
 * --- 代码世界 ---
 *
 * @author cuixinke
 * @date 2024/7/26
 * @desc
 */
@RestController
@RequestMapping("/supplier")
@CrossOrigin
public class supplierController {
    @Autowired
    private supplierService service;
    //查
    @GetMapping("/findAll")
    public R findAll(@RequestParam HashMap<String,String> map) {
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        PageHelper.startPage(pageNum,pageSize);

        List<Supplier> list = service.findAll(map);
        PageInfo<Supplier> info = new PageInfo<>(list);
        return R.ok(info);
    }

    //删
    @GetMapping("/delById")
    public R delById(int id) {
        boolean isok = service.delById(id);
        return R.ok(isok);
    }

    //修改
    @PostMapping("/update")
    public R update(@RequestBody Supplier supplier){
        //System.out.println("7" + supplier);
        boolean isok = service.update(supplier);
        return R.ok(isok);
    }

    //批量删除
    @GetMapping("/dels")
    public R delByIds(@RequestParam List<Integer> ids) {
        boolean isok = service.delByIds(ids);
        return R.ok(isok);
    }

    //添加
    @PostMapping("/add")
    public R addSupplier(@RequestBody Supplier supplier) {
        boolean isok = service.addSupplier(supplier);
        return R.ok(isok);
    }

    //上传Excel文件
    @PostMapping("/upload/excel")
    public R uploadExcel(MultipartFile file) {
        try {
            EasyExcel.read(file.getInputStream(),
                            Supplier.class,
                            new MdUnitMeasureReadListener(service))
                    .sheet().doRead();
        } catch (Exception e) {
            e.printStackTrace();
            return R.fail(e.getMessage());
        }
        return R.ok();
    }

    /**
     * 下载Excel文件
     * 注意,返回值是void
     */
    @GetMapping("/download/excel")
    public void downloadExcel(HttpServletResponse response) throws IOException {

        //  查询数据库全部数据
        List<Supplier> list = service.findAllz(null);

        // 下面这个注释是前端使用方式1,即a标签发请求时采用
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        // 这里URLEncoder.encode可以防止中文乱码
        String fileName = URLEncoder.encode("计量单位信息", "UTF-8");
        response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");

        // easyexcel导出工具
        EasyExcel.write(response.getOutputStream(), Supplier.class).autoCloseStream(Boolean.FALSE).sheet("计量单位信息")
                .doWrite(list);
    }
}
