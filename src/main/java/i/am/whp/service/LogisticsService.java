package i.am.whp.service;

import i.am.whp.model.po.*;

import java.util.List;

public interface LogisticsService {
    List<LogisticsPrice> queryAllPrice();

    boolean addNewPrice(LogisticsPrice logisticsPrice);

    boolean updatePrice(LogisticsPrice logisticsPrice);

    LogisticsPrice queryPrice(String sendcity, String reachcity);

    LogisticsPrice queryPriceById(int priceid);

    List<LogisticsInfo> queryLogisticsInfo(long orderid);

    void addLogisticsInfo(LogisticsInfo logisticsInfo);

}
