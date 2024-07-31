package com.example.controller.GuahaoController;

import com.example.MyLog.MyLog;
import com.example.entity.GuahaoEntity.Doctor;
import com.example.entity.GuahaoEntity.Registration;
import com.example.service.GuahaoService.GuahaoService;
import com.example.until.R;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * --- Be Humble and Hungry ---
 *
 * @author McMeloxD
 * @date 2024/7/24
 * @desc
 */

@RestController
@RequestMapping("/guahao")
public class GuahaoController {
    @Autowired
    private GuahaoService guahaoService;

    /**
     * 获取所有挂号记录
     * @param map
     * @return R
     */
    @GetMapping("/findAllGuahaoInfos")
    public R findAllGuahaoInfos(@RequestParam HashMap<String,String> map) throws ParseException {
        int pageNum = Integer.parseInt(map.get("pageNum"));
        int pageSize = Integer.parseInt(map.get("pageSize"));
        String departments = map.get("departments");
        String doctorName = map.get("doctorName");
        String startDateStr = map.get("startDate");
        String endDateStr = map.get("endDate");
        String patientName = map.get("patientName");
        // 1 先设置分页信息
        PageHelper.startPage(pageNum,pageSize);
        // 2 正常执行查询
        List<Registration> list = guahaoService.findAllGuahaoInfos(departments,doctorName,startDateStr,endDateStr,patientName);
        // 3 通过查询返回的list创建出分页信息,PageInfo内包含所有分页数据,可以点入源码查看
        PageInfo<Registration> pageInfo = new PageInfo<>(list);
        return R.ok(pageInfo);
    }

    /**
     * 获取所有挂号记录不分页
     * @param
     * @return R
     */
    @GetMapping("/findAllGuahaoInfosBfy")
    public R findAllGuahaoInfosBfy(){
        List<Registration> list = guahaoService.findAllGuahaoInfosBfy();
        return R.ok(list);
    }

    /**
     * 删除挂号信息
     * @param coding
     * @return R
     */
    @MyLog("删除挂号信息")
    @GetMapping("/delByCoding")
    public R delByCoding(String coding){
        boolean isDel = guahaoService.delByCoding(coding);
        return R.ok(isDel);
    }

    /**
     * 增加一条记录单位数据
     *
     * @param registration
     * @return ji
     */
    @MyLog("新增挂号信息")
    @PostMapping("/addGuahaoInfo")
    public R addGuahaoInfo(@RequestBody Registration registration) {
        boolean isAdd = guahaoService.guahaoService(registration);
        return R.ok(isAdd);
    }

    /**
     * 根据部门查医生
     * @param departments
     * @return R
     */
    @GetMapping("/findDoctors")
    public R findDoctors(String departments){
        List<Doctor> Doclist = guahaoService.findDoctors(departments);
        return R.ok(Doclist);
    }

    /**
     * 修改记录单位数据
     *
     * @param registration
     * @return ji
     */
    @MyLog("修改记录单位数据")
    @PostMapping("/editGuahaoInfo")
    public R editGuahaoInfo(@RequestBody Registration registration) {
        boolean isEdit = guahaoService.editGuahaoInfo(registration);
        return R.ok(isEdit);
    }

    /**
     * 根据患者姓名修改就诊状态
     * @param patientName
     * @return R
     */
    @MyLog("修改就诊状态")
    @GetMapping("/jiuZhen")
    public R jiuZhen(String patientName){
        boolean isJiuzhen = guahaoService.jiuZhen(patientName);
        return R.ok(isJiuzhen);
    }


    /**
     * 患者按病科分类同级人数
     * @param
     * @return R
     */
    @GetMapping("/getBingkeECharts")
    public R getBingkeECharts(){
        List<Map<String, Object>> map = guahaoService.getBingkeECharts();
        return R.ok(map);
    }
}
