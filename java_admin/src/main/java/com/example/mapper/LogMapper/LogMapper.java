package com.example.mapper.LogMapper;

import com.example.entity.Log.Log;

import java.util.HashMap;
import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/25
 * @desc
 */
public interface LogMapper {
    void add(Log log);

    List<Log> findAll(HashMap<String, String> map);

    boolean delLog(int id);
}
