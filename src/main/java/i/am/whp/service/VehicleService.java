package i.am.whp.service;

import i.am.whp.model.po.Vehicle;

import java.util.List;

public interface VehicleService {
    boolean addVehicle(Vehicle vehicle);

    boolean deleteVehicle(String  vehicleid);

    List<Vehicle> getAllVehicles();

    Vehicle getVehicleById(String vehicleid);

    List<Vehicle> getAllVehicleByDriver(String transporter);

    boolean updateVehicle(Vehicle vehicle);
 }
