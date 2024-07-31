package com.example.service.GuahaoService;

import com.example.entity.GuahaoEntity.Doctor;
import com.example.entity.GuahaoEntity.Registration;

import java.util.List;
import java.util.Map;

/**
 * --- Be Humble and Hungry ---
 *
 * @author Liyuexian
 * @date 2024/7/24
 * @desc
 */
public interface GuahaoService {

    List<Registration> findAllGuahaoInfos(String departments, String doctorName, String startDate, String endDate, String patientName);

    boolean delByCoding(String coding);

    boolean guahaoService(Registration registration);

    List<Doctor> findDoctors(String departments);

    boolean editGuahaoInfo(Registration registration);

    boolean jiuZhen(String patientName);

    List<Registration> findAllGuahaoInfosBfy();

    List<Map<String, Object>> getBingkeECharts();
}
