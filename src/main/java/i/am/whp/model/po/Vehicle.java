package i.am.whp.model.po;

import lombok.Data;

@Data
public class Vehicle {
    private String vehicleid;
    private String nowplace;
    /**
     * @see i.am.whp.model.enums.VehicleState
     */
    private int state;
    private String owner;
    private String driver;
}
