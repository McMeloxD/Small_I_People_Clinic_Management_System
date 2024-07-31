package com.example.controller.SysUserController;
import javax.servlet.http.HttpServletRequest;
import com.example.MyLog.MyLog;
import com.example.entity.SysEntity.SysUser;
import com.example.service.SysUserService.SysUserService;
import com.example.until.R;
import com.example.until.RedisUtil;
import com.example.until.TencentCOSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * --- Be Humble and Hungry ---
 *
 * @author McMeloxD
 * @date 2024/7/24
 * @desc
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private TencentCOSUtil tencentCOSUtil;

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 系统用户登录
     * @param sysUser
     * @return token，session
     */
    @PostMapping("/login")
    public R login(@RequestBody SysUser sysUser, HttpSession session,HttpServletRequest request) throws Exception {
        SysUser login = sysUserService.login(sysUser);
        if (login != null) {
            // 1 登录成功,生成令牌
            String token = UUID.randomUUID( ).toString( ).replace("-", "");
            // 更新一下最近登录日期和IP
            boolean n = sysUserService.updateLoginDate(sysUser,request);
            // 2 已令牌为key,对象信息为value存储到redis
            // key形如: user:34j34h53j4hj36
            // value是对象,已经配置value使用jackson2Json将对象转成JSON字符串
            //token15分钟后到期
            redisUtil.setCacheObject("user:"+token,login,15, TimeUnit.MINUTES);
            //登陆成功存用户信息
            session.setAttribute("userInfo", login);
            //将令牌返回前端
            HashMap<String,String> map = new HashMap<>();
            map.put("token", token);
            return R.ok(map);
        }
        return new R(40000,"账号或密码错误~");
    }

    /**
     * 获取用户信息
     * @param session
     * @return info
     */
    @MyLog("登录")
    @GetMapping("/getInfo")
    public R getUserInfo(HttpSession session){
        SysUser Info = (SysUser)session.getAttribute("userInfo");
        return R.ok(Info);
    }

    /**
     * 退出
     * @param session
     * @return R
     */
    @MyLog("退出登录")
    @PostMapping("/logout")
    public R logout(HttpSession session,HttpServletRequest request){
        //清除session
        session.removeAttribute("userInfo");
        String token = request.getHeader("Authorization");

        // 销毁redis中的token
        redisUtil.deleteObject("user:"+token);
        return R.ok();
    }

    /**
     * 上传头像
     * @param
     * @return R
     */
    @MyLog("更改头像信息")
    @PostMapping("/upload")
    public R upload(MultipartFile file) {
        String url = tencentCOSUtil.upLoadFile(file);
        char[] charArray = url.toCharArray();
        int temp = 0;
        int n = 0;
        for (int i = charArray.length - 1; i >= 0; i--) {
            if (charArray[i] == '/') {
                temp++;
            }
            // 如果找到位置就结束
            if (temp == 2){
                n = i;
                break;
            }
        }
        // 从倒数第二个/开始截取
        String ImgUrl = url.substring(n+1);
        System.out.println("文件的Url：{}"+ImgUrl);
        return R.ok(ImgUrl);
    }

    /**
     * 获取用户个人中心信息
     * @param
     * @return info
     */
    @GetMapping("/findProfileInfo")
    public R findProfileInfo(String username){
        SysUser form = sysUserService.findProfileInfo(username);
        return R.ok(form);
    }

    /**
     * 个人信息修改
     * @param sysUser
     * @return token，session
     */
    @MyLog("修改个人信息")
    @PostMapping("/saveInfo")
    public R saveInfo(@RequestBody SysUser sysUser){
        boolean isSave = sysUserService.saveInfo(sysUser);
        return R.ok(isSave);
    }

    /**
     * 修改密码
     * @param map
     * @return info
     */
    @MyLog("修改密码")
    @PostMapping("/editPwd")
    public R editPwd(@RequestBody HashMap<String,String> map){
        String username = map.get("username");
        String oldPwd = map.get("oldPwd");
        String newPwd = map.get("newPwd");
        int isEdit = sysUserService.editPwd(oldPwd,newPwd,username);
        if (isEdit > 0){
            return R.ok(20000,"修改成功,请重新登录~");
        }else if (isEdit == -1){
            return R.ok(40000,"您输入的旧密码出错~");
        }else if (isEdit == -2){
            return R.ok(40000,"新密码不能和旧密码一样~");
        }
        return R.ok(40000,"修改失败~");
    }

    @GetMapping("/sex")
    public R getSex4ECharts() {
        return sysUserService.getSex4ECharts();
    }

    @GetMapping("/drug")
    public R getDrug4ECharts() {
        // System.out.println("12345");
        HashMap<String, List<Object>> map = sysUserService.getDrug4ECharts();
        return R.ok(map);
    }
}
