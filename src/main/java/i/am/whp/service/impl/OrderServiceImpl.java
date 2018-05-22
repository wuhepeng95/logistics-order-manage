package i.am.whp.service.impl;

import i.am.whp.dao.OrderDao;
import i.am.whp.model.OrderDetailVo;
import i.am.whp.model.po.ConsigneeInfo;
import i.am.whp.model.po.ConsignorInfo;
import i.am.whp.model.po.OrderInfo;
import i.am.whp.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;

    public List<OrderInfo> queryOrder(String username) {
        return orderDao.queryOrder(username);
    }

    @Override
    public boolean deleteOrder(long delid) {
        return orderDao.deleteOrder(delid) == 1;
    }

    @Override
    public boolean addNewOrder(OrderInfo orderInfo) {
        return orderDao.addNewOrder(orderInfo) == 1;
    }

    @Override
    public OrderDetailVo queryOderDetail(long orderid) {
        return orderDao.queryOrderDetail(orderid);
    }

    @Override
    public List<ConsigneeInfo> queryConsigneeInfo(String username) {
        return orderDao.queryConsigneeInfoByName(username);
    }

    @Override
    public List<ConsignorInfo> queryConsignorInfo(String username) {
        return orderDao.queryConsignorInfoByName(username);
    }

    @Override
    public Integer isExistConsigneeInfo(ConsigneeInfo consigneeInfo) {
        return orderDao.existConsigneeInfo(consigneeInfo);
    }

    @Override
    public Integer isExistConsignorInfo(ConsignorInfo consignorInfo) {
        return orderDao.existConsignorInfo(consignorInfo);
    }

    @Override
    public int addConsigneeInfo(ConsigneeInfo consigneeInfo) {
        return orderDao.addConsigneeInfo(consigneeInfo);
    }

    @Override
    public int addConsignorInfo(ConsignorInfo consignorInfo) {
        return orderDao.addConsignorInfo(consignorInfo);
    }

    @Override
    public boolean delConsigneeInfo(int consigneeid) {
        return orderDao.delConsigneeInfo(consigneeid) == 1;
    }

    @Override
    public boolean delConsignorInfo(int consignorid) {
        return orderDao.delConsignorInfo(consignorid) == 1;
    }

    @Override
    public boolean updateConsigneeInfo(ConsigneeInfo consigneeInfo) {
        return orderDao.updateConsigneeInfo(consigneeInfo) == 1;
    }

    @Override
    public boolean updateConsignorInfo(ConsignorInfo consignorInfo) {
        return orderDao.updateConsignorInfo(consignorInfo) == 1;
    }

    @Override
    public ConsigneeInfo queryConsigneeInfoById(int consigneeid) {
        return orderDao.queryConsigneeInfoById(consigneeid);
    }

    @Override
    public ConsignorInfo queryConsignorInfoById(int consignorid) {
        return orderDao.queryConsignorInfoById(consignorid);
    }
}
