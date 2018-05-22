package i.am.whp.model.po;

import i.am.whp.model.enums.LogisticsState;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class LogisticsInfo {
    private long orderid;
    private String info;
    /**
     * 物流状态
     * @see LogisticsState
     */
    private int logisticsstate;
    private Timestamp updatetime;
}