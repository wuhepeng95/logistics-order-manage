package i.am.whp.model;

import i.am.whp.model.enums.Category;
import i.am.whp.model.enums.OrderState;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderDetailVo {
    private long orderid;
    private String username;
    private float goodswt;
    private float postage;

    /**
     * 货物种类
     *
     * @see Category
     */
    private String category;

    private String consigneename;
    private String consigneephone;
    private String reachaddress;

    private String consignorname;
    private String consignorphone;
    private String sendaddress;

    private Timestamp ordertime;
    /**
     * 订单状态
     *
     * @see OrderState
     */
    private String orderstate;
}