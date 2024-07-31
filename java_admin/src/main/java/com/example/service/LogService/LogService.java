package com.example.service.LogService;

import com.example.entity.Log.Log;

import java.util.HashMap;
import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/26
 * @desc
 */
public interface LogService {
    void add(Log log);

    List<Log> findAll(HashMap<String, String> map);

    boolean delLog(int id);
}
