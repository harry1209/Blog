package com.form;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Service implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Client> list;

	public Service() {
		list = new ArrayList<Client>();
	}

	public List<Client> getList() {
		return list;
	}

	public void setList(List<Client> list) {
		this.list = list;
	}

	public void addUser(Client client) {
		this.list.add(client);
	}

	public void delUser(Client client) {
		this.list.remove(client);
	}

	public void pingBi(String username) {
		for (Client c : list) {
			if (c.getUsername().equals("usetname")) {
				c.setFlag(false);
			}
		}
	}

}
