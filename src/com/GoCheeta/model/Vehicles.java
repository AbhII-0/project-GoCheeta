package com.GoCheeta.model;

public class Vehicles {

	protected int vehicle_id;
	protected String vehicle_number;
	protected String vehicle_description;
	protected int vehicle_status;
	protected int vehicle_types_vehicle_types_id;
	protected int drivers_driver_id;

	public Vehicles(int vehicle_id, String vehicle_number, String vehicle_description, int vehicle_status,
			int vehicle_types_vehicle_types_id, int drivers_driver_id) {
		super();
		this.vehicle_id = vehicle_id;
		this.vehicle_number = vehicle_number;
		this.vehicle_description = vehicle_description;
		this.vehicle_status = vehicle_status;
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
		this.drivers_driver_id = drivers_driver_id;
	}

	public Vehicles(String vehicle_number, String vehicle_description, int vehicle_status,
			int vehicle_types_vehicle_types_id, int drivers_driver_id) {
		super();
		this.vehicle_number = vehicle_number;
		this.vehicle_description = vehicle_description;
		this.vehicle_status = vehicle_status;
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
		this.drivers_driver_id = drivers_driver_id;
	}

	public int getVehicle_id() {
		return vehicle_id;
	}

	public void setVehicle_id(int vehicle_id) {
		this.vehicle_id = vehicle_id;
	}

	public String getVehicle_number() {
		return vehicle_number;
	}

	public void setVehicle_number(String vehicle_number) {
		this.vehicle_number = vehicle_number;
	}

	public String getVehicle_description() {
		return vehicle_description;
	}

	public void setVehicle_description(String vehicle_description) {
		this.vehicle_description = vehicle_description;
	}

	public int getVehicle_status() {
		return vehicle_status;
	}

	public void setVehicle_status(int vehicle_status) {
		this.vehicle_status = vehicle_status;
	}

	public int getVehicle_types_vehicle_types_id() {
		return vehicle_types_vehicle_types_id;
	}

	public void setVehicle_types_vehicle_types_id(int vehicle_types_vehicle_types_id) {
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
	}

	public int getDrivers_driver_id() {
		return drivers_driver_id;
	}

	public void setDrivers_driver_id(int drivers_driver_id) {
		this.drivers_driver_id = drivers_driver_id;
	}

}
