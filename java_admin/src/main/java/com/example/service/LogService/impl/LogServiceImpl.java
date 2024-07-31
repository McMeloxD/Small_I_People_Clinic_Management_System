package com.example.service.LogService.impl;

import com.example.entity.Log.Log;
import com.example.mapper.LogMapper.LogMapper;
import com.example.service.LogService.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * --- 代码敲烂 月薪过万 ---
 *
 * @author Mercury
 * @date 2024/7/26
 * @desc
 */
@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    public void add(Log log) {
        logMapper.add(log);
    }

    @Override
    public List<Log> findAll(HashMap<String, String> map) {
        return logMapper.findAll(map);
    }

    @Override
    public boolean delLog(int id) {
        return logMapper.delLog(id);
    }
}
