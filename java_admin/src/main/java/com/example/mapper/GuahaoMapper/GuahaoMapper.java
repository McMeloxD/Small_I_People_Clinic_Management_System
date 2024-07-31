package com.example.mapper.GuahaoMapper;

import com.example.entity.GuahaoEntity.Doctor;
import com.example.entity.GuahaoEntity.Registration;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * --- Be Humble and Hungry ---
 *
 * @author McMeloxD
 * @date 2024/7/24
 * @desc
 */
public interface GuahaoMapper {

    List<Registration> findAllGuahaoInfos(@Param("departments") String departments, @Param("doctorName") String doctorName, @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("patientName") String patientName);

    boolean delByCoding(String coding);

    boolean guahaoService(Registration registration);

    String getNewCode();

    List<Doctor> findDoctors(String departments);

    boolean editGuahaoInfo(Registration registration);

    boolean jiuZhen(String patientName);

    List<Registration> findAllGuahaoInfosBfy();

    List<Map<String, Object>> getBingkeECharts();
}
