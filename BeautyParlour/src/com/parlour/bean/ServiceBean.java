package com.parlour.bean;


import java.io.Serializable;

public class ServiceBean implements Serializable {
	   private Integer id;
	    private String name;
	    private double cost;
	    private String date;
	    private Integer active;

	 
		public ServiceBean(Integer id, String name, double cost, String date, int active) {
	        this.id = id;
	        this.name = name;
	        this.cost = cost;
	        this.date = date;
	        this.active = active;
	    }
	    public ServiceBean() {
	     
	    }
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public double getCost() {
			return cost;
		}
		public void setCost(double cost) {
			this.cost = cost;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public Integer getActive() {
			return active;
		}
		public void setActive(Integer active) {
			this.active = active;
		}
	    
	   	 
	    
	    
	    

}
