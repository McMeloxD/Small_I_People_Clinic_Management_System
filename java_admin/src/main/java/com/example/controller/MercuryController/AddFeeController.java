package com.example.controller.MercuryController;

import com.example.MyLog.MyLog;
import com.example.entity.MercuryEntity.AddFee;
import com.example.service.MercuryService.AddFeeService;
import com.example.until.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/23
 * @desc
 */
@RestController
@RequestMapping("/details")
public class AddFeeController {

    @Autowired
    private AddFeeService addFeeService;

    @GetMapping("/findAllAddFee")
    public R findAllAddFee(){
        List<AddFee> list = addFeeService.findAllAddFee();
        return R.ok(list);
    }




}
