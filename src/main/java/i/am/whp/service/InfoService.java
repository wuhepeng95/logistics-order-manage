package i.am.whp.service;

import i.am.whp.model.po.LogisticsInfo;

import java.util.List;

public interface InfoService {
    List<LogisticsInfo> queryAllWuLiuMessage(int orderid);

}
