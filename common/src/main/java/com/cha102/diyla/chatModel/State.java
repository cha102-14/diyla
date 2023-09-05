package com.cha102.diyla.chatModel;

import java.util.Set;

public class State {
	private String type;
	// the user changing the state
	private String user;
	// total users
	private Set<String> users;
	private String dateTime;

	public State(String type, String user, Set<String> users, String dateTime) {
		super();
		this.type = type;
		this.user = user;
		this.users = users;
		this.dateTime = dateTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Set<String> getUsers() {
		return users;
	}

	public void setUsers(Set<String> users) {
		this.users = users;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
}
