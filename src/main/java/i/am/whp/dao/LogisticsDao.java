package i.am.whp.dao;

import i.am.whp.model.po.LogisticsInfo;
import i.am.whp.model.po.LogisticsPrice;

import java.util.List;


public interface LogisticsDao {
    LogisticsPrice queryPrice(LogisticsPrice logisticsPrice);

    LogisticsPrice queryPriceById(int priceid);

    List<LogisticsPrice> queryAllPrice();

    int addNewPrice(LogisticsPrice logisticsPrice);

    int updatePrice(LogisticsPrice logisticsPrice);

    List<LogisticsInfo> queryLogisticsInfo(long orderid);

    int addLogisticsInfo(LogisticsInfo logisticsInfo);
}
