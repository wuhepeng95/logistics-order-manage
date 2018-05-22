package i.am.whp.model.po;

import lombok.Data;

@Data
public class ConsigneeInfo {
    private int consigneeid;
    private String username;

    private String consigneename;
    private String consigneephone;
    private String reachaddress;
    private int zipcode;
}
