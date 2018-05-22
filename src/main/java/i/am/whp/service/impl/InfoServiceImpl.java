package i.am.whp.service.impl;

import i.am.whp.dao.LogisticsDao;
import i.am.whp.model.po.LogisticsInfo;
import i.am.whp.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoServiceImpl implements InfoService {

    @Autowired
    LogisticsDao logisticsDao;

    @Override
    public List<LogisticsInfo> queryAllWuLiuMessage(int orderid) {
        return logisticsDao.queryLogisticsInfo(orderid);
    }
}
