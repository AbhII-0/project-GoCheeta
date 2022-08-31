package com.GoCheeta.model;

public class Drivers {

	protected int driver_id;
	protected String driver_user_name;
	protected String driver_email;
	protected String driver_tp_number;
	protected String driverProfilePic;
	protected String driver_password;
	protected int driver_account_status;
	protected int driver_account_verification;
	protected String driver_status;
	protected String driver_license_number;
	protected int branches_branch_id;
	protected String branch_loaction;

	public Drivers(String driver_user_name, String driver_email, String driver_tp_number, String driverProfilePic,
			String driver_password, int driver_account_status, int driver_account_verification, String driver_status,
			String driver_license_number, int branches_branch_id) {
		super();
		this.driver_user_name = driver_user_name;
		this.driver_email = driver_email;
		this.driver_tp_number = driver_tp_number;
		this.driverProfilePic = driverProfilePic;
		this.driver_password = driver_password;
		this.driver_account_status = driver_account_status;
		this.driver_account_verification = driver_account_verification;
		this.driver_status = driver_status;
		this.driver_license_number = driver_license_number;
		this.branches_branch_id = branches_branch_id;
	}

	public Drivers(int driver_id, String driver_user_name, String driver_email, String driver_tp_number,
			String driverProfilePic, String driver_password, int driver_account_status, int driver_account_verification,
			String driver_license_number, int branches_branch_id) {
		super();
		this.driver_id = driver_id;
		this.driver_user_name = driver_user_name;
		this.driver_email = driver_email;
		this.driver_tp_number = driver_tp_number;
		this.driverProfilePic = driverProfilePic;
		this.driver_password = driver_password;
		this.driver_account_status = driver_account_status;
		this.driver_account_verification = driver_account_verification;
		this.driver_license_number = driver_license_number;
		this.branches_branch_id = branches_branch_id;
	}

	public Drivers(int driver_id, String driver_user_name, String driver_email, String driver_tp_number,
			String driverProfilePic, int driver_account_status, int driver_account_verification,
			String driver_license_number, int branches_branch_id) {
		super();
		this.driver_id = driver_id;
		this.driver_user_name = driver_user_name;
		this.driver_email = driver_email;
		this.driver_tp_number = driver_tp_number;
		this.driverProfilePic = driverProfilePic;
		this.driver_account_status = driver_account_status;
		this.driver_account_verification = driver_account_verification;
		this.driver_license_number = driver_license_number;
		this.branches_branch_id = branches_branch_id;
	}

	public Drivers(int driver_id, String driver_user_name, String driver_email, String driver_tp_number,
			String driverProfilePic, int driver_account_status, int driver_account_verification, String driver_status,
			String driver_license_number, int branches_branch_id, String branch_loaction) {
		super();
		this.driver_id = driver_id;
		this.driver_user_name = driver_user_name;
		this.driver_email = driver_email;
		this.driver_tp_number = driver_tp_number;
		this.driverProfilePic = driverProfilePic;
		this.driver_account_status = driver_account_status;
		this.driver_account_verification = driver_account_verification;
		this.driver_status = driver_status;
		this.driver_license_number = driver_license_number;
		this.branches_branch_id = branches_branch_id;
		this.branch_loaction = branch_loaction;
	}

	public int getDriver_id() {
		return driver_id;
	}

	public void setDriver_id(int driver_id) {
		this.driver_id = driver_id;
	}

	public String getDriver_user_name() {
		return driver_user_name;
	}

	public void setDriver_user_name(String driver_user_name) {
		this.driver_user_name = driver_user_name;
	}

	public String getDriver_email() {
		return driver_email;
	}

	public void setDriver_email(String driver_email) {
		this.driver_email = driver_email;
	}

	public String getDriver_tp_number() {
		return driver_tp_number;
	}

	public void setDriver_tp_number(String driver_tp_number) {
		this.driver_tp_number = driver_tp_number;
	}

	public String getDriverProfilePic() {
		return driverProfilePic;
	}

	public void setDriverProfilePic(String driverProfilePic) {
		this.driverProfilePic = driverProfilePic;
	}

	public String getDriver_password() {
		return driver_password;
	}

	public void setDriver_password(String driver_password) {
		this.driver_password = driver_password;
	}

	public int getDriver_account_status() {
		return driver_account_status;
	}

	public void setDriver_account_status(int driver_account_status) {
		this.driver_account_status = driver_account_status;
	}

	public int getDriver_account_verification() {
		return driver_account_verification;
	}

	public void setDriver_account_verification(int driver_account_verification) {
		this.driver_account_verification = driver_account_verification;
	}

	public String getDriver_status() {
		return driver_status;
	}

	public void setDriver_status(String driver_status) {
		this.driver_status = driver_status;
	}

	public String getDriver_license_number() {
		return driver_license_number;
	}

	public void setDriver_license_number(String driver_license_number) {
		this.driver_license_number = driver_license_number;
	}

	public int getBranches_branch_id() {
		return branches_branch_id;
	}

	public void setBranches_branch_id(int branches_branch_id) {
		this.branches_branch_id = branches_branch_id;
	}

	public String getBranch_loaction() {
		return branch_loaction;
	}

	public void setBranch_loaction(String branch_loaction) {
		this.branch_loaction = branch_loaction;
	}

}
