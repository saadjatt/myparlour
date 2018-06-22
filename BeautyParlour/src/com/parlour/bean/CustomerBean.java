package com.parlour.bean;

public class CustomerBean {
	   private Integer customer_id;
	    private String customer_name;
	    private String customer_contact;
	    private String customer_address;
	    private String customer_inserted_date;
	    private int customer_active;
	    private double customer_dept;

	    public String getCustomer_address() {
	        return customer_address;
	    }

	    public CustomerBean(Integer customer_id, String customer_name, String customer_contact, String customer_address, String customer_inserted_date, int customer_active, double customer_dept) {
	        this.customer_id = customer_id;
	        this.customer_name = customer_name;
	        this.customer_contact = customer_contact;
	        this.customer_address = customer_address;
	        this.customer_inserted_date = customer_inserted_date;
	        this.customer_active = customer_active;
	        this.customer_dept = customer_dept;
	    }
	    public CustomerBean() {}

	    public void setCustomer_address(String customer_address) {
	        this.customer_address = customer_address;
	    }

	    public Integer getCustomer_id() {
	        return customer_id;
	    }

	    public void setCustomer_id(Integer customer_id) {
	        this.customer_id = customer_id;
	    }

	    public String getCustomer_name() {
	        return customer_name;
	    }

	    public void setCustomer_name(String customer_name) {
	        this.customer_name = customer_name;
	    }

	    public String getCustomer_contact() {
	        return customer_contact;
	    }

	    public void setCustomer_contact(String customer_contact) {
	        this.customer_contact = customer_contact;
	    }

	    public String getCustomer_inserted_date() {
	        return customer_inserted_date;
	    }

	    public void setCustomer_inserted_date(String customer_inserted_date) {
	        this.customer_inserted_date = customer_inserted_date;
	    }

	    public int getCustomer_active() {
	        return customer_active;
	    }

	    public void setCustomer_active(int customer_active) {
	        this.customer_active = customer_active;
	    }

	    public double getCustomer_dept() {
	        return customer_dept;
	    }

	    public void setCustomer_dept(double customer_dept) {
	        this.customer_dept = customer_dept;
	    }


}
