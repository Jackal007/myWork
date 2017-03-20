package com.xmu.bean;

import com.mysql.jdbc.DatabaseMetaData;

public class Record {
	public int getRecord_id() {
		return record_id;
	}

	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getRoom_status() {
		return room_status;
	}

	public void setRoom_status(String room_status) {
		this.room_status = room_status;
	}

	public DatabaseMetaData getTime() {
		return time;
	}

	public void setTime(DatabaseMetaData time) {
		this.time = time;
	}

	public int getTime_spacing() {
		return time_spacing;
	}

	public void setTime_spacing(int time_spacing) {
		this.time_spacing = time_spacing;
	}

	public String getApply_reason() {
		return apply_reason;
	}

	public void setApply_reason(String apply_reason) {
		this.apply_reason = apply_reason;
	}

	public String getApply_name() {
		return apply_name;
	}

	public void setApply_name(String apply_name) {
		this.apply_name = apply_name;
	}

	public String getApply_unit() {
		return apply_unit;
	}

	public void setApply_unit(String apply_unit) {
		this.apply_unit = apply_unit;
	}

	public String getApply_email() {
		return apply_email;
	}

	public void setApply_email(String apply_email) {
		this.apply_email = apply_email;
	}

	public String getApplyunit_views() {
		return applyunit_views;
	}

	public void setApplyunit_views(String applyunit_views) {
		this.applyunit_views = applyunit_views;
	}

	public String getAdmin_views() {
		return admin_views;
	}

	public void setAdmin_views(String admin_views) {
		this.admin_views = admin_views;
	}

	public int getBelongunits_id() {
		return belongunits_id;
	}

	public void setBelongunits_id(int belongunits_id) {
		this.belongunits_id = belongunits_id;
	}

	private int record_id;
	private int room_id;
	private String room_status;
	private DatabaseMetaData time;
	private int time_spacing;
	private String apply_reason;
	private String apply_name;
	private String apply_unit;
	private String apply_email;
	private String applyunit_views;
	private String admin_views;
	private int belongunits_id;

}
