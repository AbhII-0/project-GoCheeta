package com.GoCheeta.model;

public class Branches {

	protected int branch_id;
	protected String branch_name;
	protected String branch_loaction;
	protected String brancheCordinate;
	protected int branche_status;

	public Branches(int branch_id, String branch_name, String branch_loaction, String brancheCordinate,
			int branche_status) {
		super();
		this.branch_id = branch_id;
		this.branch_name = branch_name;
		this.branch_loaction = branch_loaction;
		this.brancheCordinate = brancheCordinate;
		this.branche_status = branche_status;
	}

	public Branches(String branch_name, String branch_loaction, String brancheCordinate, int branche_status) {
		super();
		this.branch_name = branch_name;
		this.branch_loaction = branch_loaction;
		this.brancheCordinate = brancheCordinate;
		this.branche_status = branche_status;
	}

	public int getBranch_id() {
		return branch_id;
	}

	public void setBranch_id(int branch_id) {
		this.branch_id = branch_id;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public String getBranch_loaction() {
		return branch_loaction;
	}

	public void setBranch_loaction(String branch_loaction) {
		this.branch_loaction = branch_loaction;
	}

	public String getBrancheCordinate() {
		return brancheCordinate;
	}

	public void setBrancheCordinate(String brancheCordinate) {
		this.brancheCordinate = brancheCordinate;
	}

	public int getBranche_status() {
		return branche_status;
	}

	public void setBranche_status(int branche_status) {
		this.branche_status = branche_status;
	}

}
