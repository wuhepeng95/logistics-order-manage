package i.am.whp.dao;

import i.am.whp.model.OrderDetailVo;
import i.am.whp.model.po.ConsigneeInfo;
import i.am.whp.model.po.ConsignorInfo;
import i.am.whp.model.po.OrderInfo;

import java.util.List;

public interface OrderDao {

    List<OrderInfo> queryOrder(String username);

    int addNewOrder(OrderInfo orderInfo);

    int deleteOrder(long orderid);

    OrderDetailVo queryOrderDetail(long orderid);


    List<ConsigneeInfo> queryConsigneeInfoByName(String username);

    List<ConsignorInfo> queryConsignorInfoByName(String username);

    int addConsigneeInfo(ConsigneeInfo consigneeInfo);

    int addConsignorInfo(ConsignorInfo consignorInfo);

    int delConsigneeInfo(int consigneeid);

    int delConsignorInfo(int consignorid);

    Integer existConsigneeInfo(ConsigneeInfo consigneeInfo);

    Integer existConsignorInfo(ConsignorInfo consignorInfo);

    int updateConsigneeInfo(ConsigneeInfo consigneeInfo);

    int updateConsignorInfo(ConsignorInfo consignorInfo);

    ConsigneeInfo queryConsigneeInfoById(int consigneeid);

    ConsignorInfo queryConsignorInfoById(int consignorid);
}