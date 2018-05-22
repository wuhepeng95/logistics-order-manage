package i.am.whp.service;

import i.am.whp.model.po.*;

import java.util.List;

public interface LogisticsService {
    LogisticsPrice queryPrice(String sendcity, String reachcity);

    List<LogisticsInfo> queryLogisticsInfo(long orderid);


    void addLogisticsInfo(LogisticsInfo logisticsInfo);

}
