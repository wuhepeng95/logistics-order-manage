package i.am.whp.model.po;

import lombok.Data;

@Data
public class LogisticsPrice {
    private int priceid;
    private String sendcity;
    private String reachcity;
    private int startprice;
    private int perkgprice;
    private float discount;
}
