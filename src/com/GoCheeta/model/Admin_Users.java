package com.GoCheeta.model;

public class Admin_Users {

	protected int admin_user_id;
	protected String admin_user_name;
	protected String admin_user_email;
	protected String admin_user_tp_number;
	protected String admin_user_password;
	protected int admin_user_account_status;
	protected int user_roles_user_role_id;
	protected int branches_branch_id;

	public Admin_Users(int admin_user_id, String admin_user_name, String admin_user_email, String admin_user_tp_number,
			String admin_user_password, int admin_user_account_status, int user_roles_user_role_id,
			int branches_branch_id) {
		super();
		this.admin_user_id = admin_user_id;
		this.admin_user_name = admin_user_name;
		this.admin_user_email = admin_user_email;
		this.admin_user_tp_number = admin_user_tp_number;
		this.admin_user_password = admin_user_password;
		this.admin_user_account_status = admin_user_account_status;
		this.user_roles_user_role_id = user_roles_user_role_id;
		this.branches_branch_id = branches_branch_id;
	}

	public Admin_Users(int admin_user_id, String admin_user_name, String admin_user_email, String admin_user_tp_number,
			int admin_user_account_status, int user_roles_user_role_id, int branches_branch_id) {
		super();
		this.admin_user_id = admin_user_id;
		this.admin_user_name = admin_user_name;
		this.admin_user_email = admin_user_email;
		this.admin_user_tp_number = admin_user_tp_number;
		this.admin_user_account_status = admin_user_account_status;
		this.user_roles_user_role_id = user_roles_user_role_id;
		this.branches_branch_id = branches_branch_id;
	}

	public Admin_Users(String admin_user_name, String admin_user_email, String admin_user_tp_number,
			String admin_user_password, int admin_user_account_status, int user_roles_user_role_id,
			int branches_branch_id) {
		super();
		this.admin_user_name = admin_user_name;
		this.admin_user_email = admin_user_email;
		this.admin_user_tp_number = admin_user_tp_number;
		this.admin_user_password = admin_user_password;
		this.admin_user_account_status = admin_user_account_status;
		this.user_roles_user_role_id = user_roles_user_role_id;
		this.branches_branch_id = branches_branch_id;
	}

	public Admin_Users(String admin_user_name, String admin_user_password) {
		super();
		this.admin_user_name = admin_user_name;
		this.admin_user_password = admin_user_password;
	}

	public int getAdmin_user_id() {
		return admin_user_id;
	}

	public void setAdmin_user_id(int admin_user_id) {
		this.admin_user_id = admin_user_id;
	}

	public String getAdmin_user_name() {
		return admin_user_name;
	}

	public void setAdmin_user_name(String admin_user_name) {
		this.admin_user_name = admin_user_name;
	}

	public String getAdmin_user_email() {
		return admin_user_email;
	}

	public void setAdmin_user_email(String admin_user_email) {
		this.admin_user_email = admin_user_email;
	}

	public String getAdmin_user_tp_number() {
		return admin_user_tp_number;
	}

	public void setAdmin_user_tp_number(String admin_user_tp_number) {
		this.admin_user_tp_number = admin_user_tp_number;
	}

	public String getAdmin_user_password() {
		return admin_user_password;
	}

	public void setAdmin_user_password(String admin_user_password) {
		this.admin_user_password = admin_user_password;
	}

	public int getAdmin_user_account_status() {
		return admin_user_account_status;
	}

	public void setAdmin_user_account_status(int admin_user_account_status) {
		this.admin_user_account_status = admin_user_account_status;
	}

	public int getUser_roles_user_role_id() {
		return user_roles_user_role_id;
	}

	public void setUser_roles_user_role_id(int user_roles_user_role_id) {
		this.user_roles_user_role_id = user_roles_user_role_id;
	}

	public int getBranches_branch_id() {
		return branches_branch_id;
	}

	public void setBranches_branch_id(int branches_branch_id) {
		this.branches_branch_id = branches_branch_id;
	}

}
