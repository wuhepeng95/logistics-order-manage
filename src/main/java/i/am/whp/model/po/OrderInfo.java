package i.am.whp.model.po;

import i.am.whp.model.enums.Category;
import i.am.whp.model.enums.OrderState;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderInfo {
    private long orderid;
    private String username;
    private float goodswt;
    private float postage;

    /**
     * 货物种类
     *
     * @see Category
     */
    private int category;

    private int consignorid;
    private int consigneeid;

    private Timestamp ordertime;

    /**
     * 订单状态
     *
     * @see OrderState
     */
    private int orderstate;
}
