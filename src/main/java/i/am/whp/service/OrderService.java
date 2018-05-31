package i.am.whp.service;

import i.am.whp.model.OrderDetailVo;
import i.am.whp.model.po.ConsigneeInfo;
import i.am.whp.model.po.ConsignorInfo;
import i.am.whp.model.po.OrderInfo;

import java.util.List;

public interface OrderService {
    List<OrderInfo> queryOrder(String username);

    List<OrderInfo> getAllOrder();

    List<OrderInfo> getAllOrderByState(int state);

    boolean deleteOrder(long delid);

    boolean updateOrder(OrderInfo orderInfo);

    boolean addNewOrder(OrderInfo orderInfo);

    OrderDetailVo queryOderDetail(long orderid);

    List<ConsigneeInfo> queryConsigneeInfo(String username);

    List<ConsignorInfo> queryConsignorInfo(String username);

    Integer isExistConsigneeInfo(ConsigneeInfo consigneeInfo);

    Integer isExistConsignorInfo(ConsignorInfo consignorInfo);

    int addConsigneeInfo(ConsigneeInfo consigneeInfo);

    int addConsignorInfo(ConsignorInfo consignorInfo);

    boolean delConsigneeInfo(int consigneeid);

    boolean delConsignorInfo(int consignorid);


    boolean updateConsigneeInfo(ConsigneeInfo consigneeInfo);

    boolean updateConsignorInfo(ConsignorInfo consignorInfo);

    ConsigneeInfo queryConsigneeInfoById(int consigneeid);

    ConsignorInfo queryConsignorInfoById(int consignorid);

}
