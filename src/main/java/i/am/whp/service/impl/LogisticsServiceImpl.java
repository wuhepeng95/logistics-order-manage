package i.am.whp.service.impl;


import i.am.whp.dao.LogisticsDao;
import i.am.whp.dao.OrderDao;
import i.am.whp.model.po.*;
import i.am.whp.service.LogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogisticsServiceImpl implements LogisticsService {

    @Autowired
    OrderDao orderDao;
    @Autowired
    LogisticsDao logisticsDao;

    @Override
    public LogisticsPrice queryPrice(String sendcity, String reachcity) {
        LogisticsPrice logisticsPrice = new LogisticsPrice();
        logisticsPrice.setSendcity(sendcity);
        logisticsPrice.setReachcity(reachcity);
        return logisticsDao.queryPrice(logisticsPrice);
    }

    @Override
    public List<LogisticsInfo> queryLogisticsInfo(long orderid) {
        return logisticsDao.queryLogisticsInfo(orderid);
    }

    @Override
    public void addLogisticsInfo(LogisticsInfo logisticsInfo) {
        logisticsDao.addLogisticsInfo(logisticsInfo);
    }
}	
