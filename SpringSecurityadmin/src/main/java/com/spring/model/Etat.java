package com.spring.model;

public enum Etat {

	ACTIVE("Active"),
	INACTIVE("Inactive"),
	DELETED("Deleted"),
	LOCKED("Locked");
	
	private String etat;
	
	private Etat(final String state){
		this.etat = state;
	}
	
	public String getState(){
		return this.etat;
	}

	@Override
	public String toString(){
		return this.etat;
	}


	public String getName(){
		return this.name();
	}


}
