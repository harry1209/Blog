package com.form;

import java.io.Serializable;

public class Client implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private boolean flag;
	private Service serevice;

	public Client() {
	}

	public Client(String username) {
		this.username = username;
		this.flag = true;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public Service getSerevice() {
		return serevice;
	}

	public void setSerevice(Service serevice) {
		this.serevice = serevice;
	}

	@Override
	public String toString() {
		return this.username;
	}
	
		
}
