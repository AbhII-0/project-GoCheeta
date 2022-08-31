package com.GoCheeta.model;

public class Vehicle_Types {

	protected int vehicle_types_id;
	protected String vehicle_type;
	protected double vehicle_type_price;
	protected int vehicle_type_status;

	public Vehicle_Types(int vehicle_types_id, String vehicle_type, double vehicle_type_price,
			int vehicle_type_status) {
		super();
		this.vehicle_types_id = vehicle_types_id;
		this.vehicle_type = vehicle_type;
		this.vehicle_type_price = vehicle_type_price;
		this.vehicle_type_status = vehicle_type_status;
	}

	public Vehicle_Types(String vehicle_type, double vehicle_type_price, int vehicle_type_status) {
		super();
		this.vehicle_type = vehicle_type;
		this.vehicle_type_price = vehicle_type_price;
		this.vehicle_type_status = vehicle_type_status;
	}

	public int getVehicle_types_id() {
		return vehicle_types_id;
	}

	public void setVehicle_types_id(int vehicle_types_id) {
		this.vehicle_types_id = vehicle_types_id;
	}

	public String getVehicle_type() {
		return vehicle_type;
	}

	public void setVehicle_type(String vehicle_type) {
		this.vehicle_type = vehicle_type;
	}

	public double getVehicle_type_price() {
		return vehicle_type_price;
	}

	public void setVehicle_type_price(double vehicle_type_price) {
		this.vehicle_type_price = vehicle_type_price;
	}

	public int getVehicle_type_status() {
		return vehicle_type_status;
	}

	public void setVehicle_type_status(int vehicle_type_status) {
		this.vehicle_type_status = vehicle_type_status;
	}

}
