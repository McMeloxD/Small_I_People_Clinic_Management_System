package com.example.controller.MercuryController;

import com.alibaba.excel.EasyExcel;
import com.example.MyLog.MyLog;
import com.example.entity.MercuryEntity.Details;
import com.example.entity.MercuryEntity.Picture;
import com.example.entity.wwjEntity.Drug;
import com.example.readListener.DetailsDrugReadListener;
import com.example.service.MercuryService.DetailsService;
import com.example.until.R;
import com.example.until.TencentCOSUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/22
 * @desc
 */
@RestController
@RequestMapping("/details")
@CrossOrigin
public class DetailsController {
    @Autowired
    private DetailsService detailsService;

    @GetMapping("/findAllDetails")
    public R findAllDetails(@RequestParam HashMap<String,String> map){
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));

        PageHelper.startPage(pageNum,pageSize);

        List<Details> list = detailsService.findAllDetails(map);

        PageInfo<Details> pageInfo = new PageInfo<>(list);
        return R.ok(pageInfo);
    }

    @GetMapping("/sellDrug")
    public R sellDrug(@RequestParam List<String> names){
        boolean isok = detailsService.sellDrug(names);
        return R.ok(isok);
    }

    // @MyLog("导入药品信息")
    @PostMapping("/upload")
    public R uploadUpload(MultipartFile file){

        try {
            EasyExcel.read(file.getInputStream(), Drug.class,
                    new DetailsDrugReadListener(detailsService)).sheet().doRead();
        } catch (Exception e) {
            e.printStackTrace();
            return R.fail(e.getMessage());
        }
        return R.ok();
    }

    @GetMapping("/download")
    public void downloadExcel(HttpServletResponse response) throws IOException {
        List<Drug> list = detailsService.findAllDrug(null);

        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");

        String fileName = URLEncoder.encode("药品信息","UTF-8");
        response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");

        EasyExcel.write(response.getOutputStream(),Drug.class).autoCloseStream(Boolean.FALSE).sheet("药品信息").doWrite(list);
    }


    @PostMapping("/uploadTu")
    public R uploadTu(MultipartFile file){
        // System.out.println("1235");
        String filePath = TencentCOSUtil.upLoadFile(file);
        return R.ok(filePath);
    }

    @PostMapping("/addPicture")
    public R addPicture(@RequestBody Picture picture){
        System.out.println(picture);
        boolean isok = detailsService.addPicture(picture);
        return R.ok(isok);
    }

}
