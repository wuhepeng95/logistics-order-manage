package i.am.whp.dao;


import i.am.whp.model.LoadInfo;
import i.am.whp.model.po.Vehicle;

import java.util.List;

public interface VehicleDao {
    int addVehicle(Vehicle vehicle);

    int deleteVehicle(String vehicleid);

    Vehicle getVehicleById(String vehicleid);

    List<Vehicle> getAllVehicles();

    List<Vehicle> getAllVehicleByDriver(String transporter);

    int updateVehicle(Vehicle vehicle);
}

