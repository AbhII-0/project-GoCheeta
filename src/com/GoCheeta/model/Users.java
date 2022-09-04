package com.GoCheeta.model;

public class Users {

	protected int user_id;
	protected String user_name;
	protected String user_email;
	protected String user_tp_number;
	protected String userProfilePic;
	protected String user_password;
	protected int user_account_status;
	protected int user_account_verification;

	public Users(String user_name, String user_email, String user_tp_number, String userProfilePic,
			String user_password) {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_tp_number = user_tp_number;
		this.userProfilePic = userProfilePic;
		this.user_password = user_password;
	}

	public Users(int user_id, String user_name, String user_email, String user_tp_number, String userProfilePic,
			String user_password, int user_account_status, int user_account_verification) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_tp_number = user_tp_number;
		this.userProfilePic = userProfilePic;
		this.user_password = user_password;
		this.user_account_status = user_account_status;
		this.user_account_verification = user_account_verification;
	}

	public Users(int user_id, String user_name, String user_email, String user_tp_number, String userProfilePic,
			int user_account_status, int user_account_verification) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_tp_number = user_tp_number;
		this.userProfilePic = userProfilePic;
		this.user_account_status = user_account_status;
		this.user_account_verification = user_account_verification;
	}

	public Users(String user_name, String user_password) {
		super();
		this.user_name = user_name;
		this.user_password = user_password;
	}

	public Users(int user_id) {
		super();
		this.user_id = user_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_tp_number() {
		return user_tp_number;
	}

	public void setUser_tp_number(String user_tp_number) {
		this.user_tp_number = user_tp_number;
	}

	public String getUserProfilePic() {
		return userProfilePic;
	}

	public void setUserProfilePic(String userProfilePic) {
		this.userProfilePic = userProfilePic;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public int getUser_account_status() {
		return user_account_status;
	}

	public void setUser_account_status(int user_account_status) {
		this.user_account_status = user_account_status;
	}

	public int getUser_account_verification() {
		return user_account_verification;
	}

	public void setUser_account_verification(int user_account_verification) {
		this.user_account_verification = user_account_verification;
	}

}
