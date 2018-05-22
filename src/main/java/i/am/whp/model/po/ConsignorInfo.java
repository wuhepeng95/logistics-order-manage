package i.am.whp.model.po;

import lombok.Data;

@Data
public class ConsignorInfo {
    private int consignorid;
    private String username;

    private String consignorname;
    private String consignorphone;
    private String sendaddress;

    private int zipcode;
}