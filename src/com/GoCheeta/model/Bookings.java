package com.GoCheeta.model;

public class Bookings {

	protected int booking_id;
	protected String booking_name;
	protected String booking_create_time;
	protected String booking_time;
	protected String booking_start_location;
	protected String booking_start_location_cordinate;
	protected String booking_end_location;
	protected String booking_endt_location_cordinate;
	protected double bookin_charge;
	protected int booking_driver_get_user;
	protected String booking_driver_get_user_time;
	protected int booking_driver_drop_user;
	protected String booking_driver_drop_user_time;
	protected String booking_user_status;
	protected String booking_driver_status;
	protected String booking_status;
	protected String booking_cancel_reason;
	protected int users_user_id;
	protected int drivers_driver_id;
	protected int vehicle_types_vehicle_types_id;
	protected int vehicles_vehicle_id;
	protected String user_name;
	protected String user_tp_number;
	protected String driver_user_name;
	protected String driver_tp_number;
	protected String vehicle_number;
	protected String vehicle_type;
	protected double rev;
	protected int mnth;

	public Bookings(int booking_id, String booking_name, String booking_create_time, String booking_time,
			String booking_start_location, String booking_start_location_cordinate, String booking_end_location,
			String booking_endt_location_cordinate, double bookin_charge, int booking_driver_get_user,
			String booking_driver_get_user_time, int booking_driver_drop_user, String booking_driver_drop_user_time,
			String booking_user_status, String booking_driver_status, String booking_status,
			String booking_cancel_reason, int users_user_id, int drivers_driver_id, int vehicle_types_vehicle_types_id,
			int vehicles_vehicle_id, String user_name, String user_tp_number, String driver_user_name,
			String driver_tp_number, String vehicle_number, String vehicle_type) {
		super();
		this.booking_id = booking_id;
		this.booking_name = booking_name;
		this.booking_create_time = booking_create_time;
		this.booking_time = booking_time;
		this.booking_start_location = booking_start_location;
		this.booking_start_location_cordinate = booking_start_location_cordinate;
		this.booking_end_location = booking_end_location;
		this.booking_endt_location_cordinate = booking_endt_location_cordinate;
		this.bookin_charge = bookin_charge;
		this.booking_driver_get_user = booking_driver_get_user;
		this.booking_driver_get_user_time = booking_driver_get_user_time;
		this.booking_driver_drop_user = booking_driver_drop_user;
		this.booking_driver_drop_user_time = booking_driver_drop_user_time;
		this.booking_user_status = booking_user_status;
		this.booking_driver_status = booking_driver_status;
		this.booking_status = booking_status;
		this.booking_cancel_reason = booking_cancel_reason;
		this.users_user_id = users_user_id;
		this.drivers_driver_id = drivers_driver_id;
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
		this.vehicles_vehicle_id = vehicles_vehicle_id;
		this.user_name = user_name;
		this.user_tp_number = user_tp_number;
		this.driver_user_name = driver_user_name;
		this.driver_tp_number = driver_tp_number;
		this.vehicle_number = vehicle_number;
		this.vehicle_type = vehicle_type;
	}

	public Bookings(double rev, int mnth) {
		super();
		this.rev = rev;
		this.mnth = mnth;
	}

	public Bookings(int booking_id, String booking_name, String booking_create_time, String booking_time,
			String booking_start_location, String booking_start_location_cordinate, String booking_end_location,
			String booking_endt_location_cordinate, double bookin_charge, int booking_driver_get_user,
			String booking_driver_get_user_time, int booking_driver_drop_user, String booking_driver_drop_user_time,
			String booking_user_status, String booking_driver_status, String booking_status,
			String booking_cancel_reason, int users_user_id, int drivers_driver_id, int vehicle_types_vehicle_types_id,
			int vehicles_vehicle_id, String vehicle_type) {
		super();
		this.booking_id = booking_id;
		this.booking_name = booking_name;
		this.booking_create_time = booking_create_time;
		this.booking_time = booking_time;
		this.booking_start_location = booking_start_location;
		this.booking_start_location_cordinate = booking_start_location_cordinate;
		this.booking_end_location = booking_end_location;
		this.booking_endt_location_cordinate = booking_endt_location_cordinate;
		this.bookin_charge = bookin_charge;
		this.booking_driver_get_user = booking_driver_get_user;
		this.booking_driver_get_user_time = booking_driver_get_user_time;
		this.booking_driver_drop_user = booking_driver_drop_user;
		this.booking_driver_drop_user_time = booking_driver_drop_user_time;
		this.booking_user_status = booking_user_status;
		this.booking_driver_status = booking_driver_status;
		this.booking_status = booking_status;
		this.booking_cancel_reason = booking_cancel_reason;
		this.users_user_id = users_user_id;
		this.drivers_driver_id = drivers_driver_id;
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
		this.vehicles_vehicle_id = vehicles_vehicle_id;
		this.vehicle_type = vehicle_type;
	}

	public Bookings(int booking_id, String booking_name, String booking_create_time, String booking_time,
			String booking_start_location, String booking_start_location_cordinate, String booking_end_location,
			String booking_endt_location_cordinate, double bookin_charge, int booking_driver_get_user,
			String booking_driver_get_user_time, int booking_driver_drop_user, String booking_driver_drop_user_time,
			String booking_user_status, String booking_driver_status, String booking_status,
			String booking_cancel_reason, int users_user_id, int drivers_driver_id, int vehicles_vehicle_id) {
		super();
		this.booking_id = booking_id;
		this.booking_name = booking_name;
		this.booking_create_time = booking_create_time;
		this.booking_time = booking_time;
		this.booking_start_location = booking_start_location;
		this.booking_start_location_cordinate = booking_start_location_cordinate;
		this.booking_end_location = booking_end_location;
		this.booking_endt_location_cordinate = booking_endt_location_cordinate;
		this.bookin_charge = bookin_charge;
		this.booking_driver_get_user = booking_driver_get_user;
		this.booking_driver_get_user_time = booking_driver_get_user_time;
		this.booking_driver_drop_user = booking_driver_drop_user;
		this.booking_driver_drop_user_time = booking_driver_drop_user_time;
		this.booking_user_status = booking_user_status;
		this.booking_driver_status = booking_driver_status;
		this.booking_status = booking_status;
		this.booking_cancel_reason = booking_cancel_reason;
		this.users_user_id = users_user_id;
		this.drivers_driver_id = drivers_driver_id;
		this.vehicles_vehicle_id = vehicles_vehicle_id;
	}

	public Bookings(int booking_id, String booking_name, String booking_create_time, String booking_time,
			String booking_start_location, String booking_start_location_cordinate, String booking_end_location,
			String booking_endt_location_cordinate, double bookin_charge, int booking_driver_get_user,
			String booking_driver_get_user_time, int booking_driver_drop_user, String booking_driver_drop_user_time,
			String booking_user_status, String booking_driver_status, String booking_status,
			String booking_cancel_reason, int users_user_id, int drivers_driver_id, int vehicles_vehicle_id,
			String user_name, String user_tp_number, String driver_user_name, String driver_tp_number,
			String vehicle_number, String vehicle_type) {
		super();
		this.booking_id = booking_id;
		this.booking_name = booking_name;
		this.booking_create_time = booking_create_time;
		this.booking_time = booking_time;
		this.booking_start_location = booking_start_location;
		this.booking_start_location_cordinate = booking_start_location_cordinate;
		this.booking_end_location = booking_end_location;
		this.booking_endt_location_cordinate = booking_endt_location_cordinate;
		this.bookin_charge = bookin_charge;
		this.booking_driver_get_user = booking_driver_get_user;
		this.booking_driver_get_user_time = booking_driver_get_user_time;
		this.booking_driver_drop_user = booking_driver_drop_user;
		this.booking_driver_drop_user_time = booking_driver_drop_user_time;
		this.booking_user_status = booking_user_status;
		this.booking_driver_status = booking_driver_status;
		this.booking_status = booking_status;
		this.booking_cancel_reason = booking_cancel_reason;
		this.users_user_id = users_user_id;
		this.drivers_driver_id = drivers_driver_id;
		this.vehicles_vehicle_id = vehicles_vehicle_id;
		this.user_name = user_name;
		this.user_tp_number = user_tp_number;
		this.driver_user_name = driver_user_name;
		this.driver_tp_number = driver_tp_number;
		this.vehicle_number = vehicle_number;
		this.vehicle_type = vehicle_type;
	}

	public Bookings(int booking_id, String booking_name, String booking_create_time, String booking_time,
			String booking_start_location, String booking_start_location_cordinate, String booking_end_location,
			String booking_endt_location_cordinate, double bookin_charge, int booking_driver_get_user,
			String booking_driver_get_user_time, int booking_driver_drop_user, String booking_driver_drop_user_time,
			String booking_user_status, String booking_driver_status, String booking_status,
			String booking_cancel_reason, int users_user_id, int drivers_driver_id, int vehicles_vehicle_id,
			String user_name, String user_tp_number, int vehicle_types_vehicle_types_id) {
		super();

		this.booking_id = booking_id;
		this.booking_name = booking_name;
		this.booking_create_time = booking_create_time;
		this.booking_time = booking_time;
		this.booking_start_location = booking_start_location;
		this.booking_start_location_cordinate = booking_start_location_cordinate;
		this.booking_end_location = booking_end_location;
		this.booking_endt_location_cordinate = booking_endt_location_cordinate;
		this.bookin_charge = bookin_charge;
		this.booking_driver_get_user = booking_driver_get_user;
		this.booking_driver_get_user_time = booking_driver_get_user_time;
		this.booking_driver_drop_user = booking_driver_drop_user;
		this.booking_driver_drop_user_time = booking_driver_drop_user_time;
		this.booking_user_status = booking_user_status;
		this.booking_driver_status = booking_driver_status;
		this.booking_status = booking_status;
		this.booking_cancel_reason = booking_cancel_reason;
		this.users_user_id = users_user_id;
		this.drivers_driver_id = drivers_driver_id;
		this.vehicles_vehicle_id = vehicles_vehicle_id;
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
	}

	public Bookings(int booking_id, String booking_name, String booking_create_time, String booking_time,
			String booking_start_location, String booking_start_location_cordinate, String booking_end_location,
			String booking_endt_location_cordinate, double bookin_charge, int booking_driver_get_user,
			String booking_driver_get_user_time, int booking_driver_drop_user, String booking_driver_drop_user_time,
			String booking_user_status, String booking_driver_status, String booking_status,
			String booking_cancel_reason, int users_user_id, int drivers_driver_id, int vehicle_types_vehicle_types_id,
			int vehicles_vehicle_id) {
		super();
		this.booking_id = booking_id;
		this.booking_name = booking_name;
		this.booking_create_time = booking_create_time;
		this.booking_time = booking_time;
		this.booking_start_location = booking_start_location;
		this.booking_start_location_cordinate = booking_start_location_cordinate;
		this.booking_end_location = booking_end_location;
		this.booking_endt_location_cordinate = booking_endt_location_cordinate;
		this.bookin_charge = bookin_charge;
		this.booking_driver_get_user = booking_driver_get_user;
		this.booking_driver_get_user_time = booking_driver_get_user_time;
		this.booking_driver_drop_user = booking_driver_drop_user;
		this.booking_driver_drop_user_time = booking_driver_drop_user_time;
		this.booking_user_status = booking_user_status;
		this.booking_driver_status = booking_driver_status;
		this.booking_status = booking_status;
		this.booking_cancel_reason = booking_cancel_reason;
		this.users_user_id = users_user_id;
		this.drivers_driver_id = drivers_driver_id;
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
		this.vehicles_vehicle_id = vehicles_vehicle_id;
	}

	public Bookings(String booking_name, String booking_start_location, String booking_start_location_cordinate,
			String booking_end_location, String booking_endt_location_cordinate, double bookin_charge,
			String booking_status, int users_user_id, int vehicle_types_vehicle_types_id) {
		super();
		this.booking_name = booking_name;
		this.booking_start_location = booking_start_location;
		this.booking_start_location_cordinate = booking_start_location_cordinate;
		this.booking_end_location = booking_end_location;
		this.booking_endt_location_cordinate = booking_endt_location_cordinate;
		this.bookin_charge = bookin_charge;
		this.booking_status = booking_status;
		this.users_user_id = users_user_id;
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
	}

	public Bookings(int booking_id, String booking_cancel_reason) {
		super();
		this.booking_id = booking_id;
		this.booking_cancel_reason = booking_cancel_reason;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public String getBooking_name() {
		return booking_name;
	}

	public void setBooking_name(String booking_name) {
		this.booking_name = booking_name;
	}

	public String getBooking_create_time() {
		return booking_create_time;
	}

	public void setBooking_create_time(String booking_create_time) {
		this.booking_create_time = booking_create_time;
	}

	public String getBooking_time() {
		return booking_time;
	}

	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}

	public String getBooking_start_location() {
		return booking_start_location;
	}

	public void setBooking_start_location(String booking_start_location) {
		this.booking_start_location = booking_start_location;
	}

	public String getBooking_start_location_cordinate() {
		return booking_start_location_cordinate;
	}

	public void setBooking_start_location_cordinate(String booking_start_location_cordinate) {
		this.booking_start_location_cordinate = booking_start_location_cordinate;
	}

	public String getBooking_end_location() {
		return booking_end_location;
	}

	public void setBooking_end_location(String booking_end_location) {
		this.booking_end_location = booking_end_location;
	}

	public String getBooking_endt_location_cordinate() {
		return booking_endt_location_cordinate;
	}

	public void setBooking_endt_location_cordinate(String booking_endt_location_cordinate) {
		this.booking_endt_location_cordinate = booking_endt_location_cordinate;
	}

	public double getBookin_charge() {
		return bookin_charge;
	}

	public void setBookin_charge(double bookin_charge) {
		this.bookin_charge = bookin_charge;
	}

	public int getBooking_driver_get_user() {
		return booking_driver_get_user;
	}

	public void setBooking_driver_get_user(int booking_driver_get_user) {
		this.booking_driver_get_user = booking_driver_get_user;
	}

	public String getBooking_driver_get_user_time() {
		return booking_driver_get_user_time;
	}

	public void setBooking_driver_get_user_time(String booking_driver_get_user_time) {
		this.booking_driver_get_user_time = booking_driver_get_user_time;
	}

	public int getBooking_driver_drop_user() {
		return booking_driver_drop_user;
	}

	public void setBooking_driver_drop_user(int booking_driver_drop_user) {
		this.booking_driver_drop_user = booking_driver_drop_user;
	}

	public String getBooking_driver_drop_user_time() {
		return booking_driver_drop_user_time;
	}

	public void setBooking_driver_drop_user_time(String booking_driver_drop_user_time) {
		this.booking_driver_drop_user_time = booking_driver_drop_user_time;
	}

	public String getBooking_user_status() {
		return booking_user_status;
	}

	public void setBooking_user_status(String booking_user_status) {
		this.booking_user_status = booking_user_status;
	}

	public String getBooking_driver_status() {
		return booking_driver_status;
	}

	public void setBooking_driver_status(String booking_driver_status) {
		this.booking_driver_status = booking_driver_status;
	}

	public String getBooking_status() {
		return booking_status;
	}

	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}

	public String getBooking_cancel_reason() {
		return booking_cancel_reason;
	}

	public void setBooking_cancel_reason(String booking_cancel_reason) {
		this.booking_cancel_reason = booking_cancel_reason;
	}

	public int getUsers_user_id() {
		return users_user_id;
	}

	public void setUsers_user_id(int users_user_id) {
		this.users_user_id = users_user_id;
	}

	public int getDrivers_driver_id() {
		return drivers_driver_id;
	}

	public void setDrivers_driver_id(int drivers_driver_id) {
		this.drivers_driver_id = drivers_driver_id;
	}

	public int getVehicles_vehicle_id() {
		return vehicles_vehicle_id;
	}

	public void setVehicles_vehicle_id(int vehicles_vehicle_id) {
		this.vehicles_vehicle_id = vehicles_vehicle_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_tp_number() {
		return user_tp_number;
	}

	public void setUser_tp_number(String user_tp_number) {
		this.user_tp_number = user_tp_number;
	}

	public String getDriver_user_name() {
		return driver_user_name;
	}

	public void setDriver_user_name(String driver_user_name) {
		this.driver_user_name = driver_user_name;
	}

	public String getDriver_tp_number() {
		return driver_tp_number;
	}

	public void setDriver_tp_number(String driver_tp_number) {
		this.driver_tp_number = driver_tp_number;
	}

	public String getVehicle_number() {
		return vehicle_number;
	}

	public void setVehicle_number(String vehicle_number) {
		this.vehicle_number = vehicle_number;
	}

	public String getVehicle_type() {
		return vehicle_type;
	}

	public void setVehicle_type(String vehicle_type) {
		this.vehicle_type = vehicle_type;
	}

	public int getvehicle_types_vehicle_types_id() {
		return vehicle_types_vehicle_types_id;
	}

	public void setvehicle_types_vehicle_types_id(int vehicle_types_vehicle_types_id) {
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
	}

	public int getVehicle_types_vehicle_types_id() {
		return vehicle_types_vehicle_types_id;
	}

	public void setVehicle_types_vehicle_types_id(int vehicle_types_vehicle_types_id) {
		this.vehicle_types_vehicle_types_id = vehicle_types_vehicle_types_id;
	}

	public double getRev() {
		return rev;
	}

	public void setRev(double rev) {
		this.rev = rev;
	}

	public int getMnth() {
		return mnth;
	}

	public void setMnth(int mnth) {
		this.mnth = mnth;
	}

}
