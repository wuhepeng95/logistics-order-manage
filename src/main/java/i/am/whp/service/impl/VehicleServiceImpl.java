package i.am.whp.service.impl;

import i.am.whp.dao.VehicleDao;
import i.am.whp.model.po.Vehicle;
import i.am.whp.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    VehicleDao vehicleDao;

    @Override
    public boolean addVehicle(Vehicle vehicle) {
        return vehicleDao.addVehicle(vehicle) == 1;
    }

    @Override
    public boolean deleteVehicle(String vehicleid) {
        return vehicleDao.deleteVehicle(vehicleid) == 1;
    }

    @Override
    public List<Vehicle> getAllVehicles() {
        return vehicleDao.getAllVehicles();
    }

    @Override
    public Vehicle getVehicleById(String vehicleid) {
        return vehicleDao.getVehicleById(vehicleid);
    }

    @Override
    public List<Vehicle> getAllVehicleByDriver(String transporter) {
        return vehicleDao.getAllVehicleByDriver(transporter);
    }

    @Override
    public boolean updateVehicle(Vehicle vehicle) {
        return vehicleDao.updateVehicle(vehicle) == 1;
    }
}
