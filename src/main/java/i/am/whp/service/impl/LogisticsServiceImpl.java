package i.am.whp.service.impl;


import i.am.whp.dao.LogisticsDao;
import i.am.whp.dao.OrderDao;
import i.am.whp.model.po.LogisticsInfo;
import i.am.whp.model.po.LogisticsPrice;
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
    public  List<LogisticsPrice> queryAllPrice() {
        return logisticsDao.queryAllPrice();
    }

    @Override
    public boolean addNewPrice(LogisticsPrice logisticsPrice) {
        return logisticsDao.addNewPrice(logisticsPrice) == 1;
    }

    @Override
    public boolean updatePrice(LogisticsPrice logisticsPrice) {
        return logisticsDao.updatePrice(logisticsPrice) == 1;
    }

    @Override
    public LogisticsPrice queryPrice(String sendcity, String reachcity) {
        LogisticsPrice logisticsPrice = new LogisticsPrice();
        logisticsPrice.setSendcity(sendcity);
        logisticsPrice.setReachcity(reachcity);
        return logisticsDao.queryPrice(logisticsPrice);
    }

    @Override
    public LogisticsPrice queryPriceById(int priceid) {
        return logisticsDao.queryPriceById(priceid);
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
