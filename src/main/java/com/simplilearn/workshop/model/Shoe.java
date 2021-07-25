package com.simplilearn.workshop.model;

/////////////////////////////////////////////////////////////////////////////
//CAL-TECH FULL STACK DEVELOPMENT COURSE -- SPOPRTY SHOES ASSESSMENT ---
//
//DEVELOPER/STUDENT:   Kevin Casey
//ORIGINATION DATE:  20 JULY
//LAST UPDATED  ON:  20 JULY
/////////////////////////////////////////////////////////////////////////////

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "shoes")
public class Shoe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "category")
	private int category;
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "imagelink")
	private String imagelink;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImagelink() {
		return imagelink;
	}
	
	public void setImagelink(String imagelink) {
		this.imagelink = imagelink;
	}
		
	
	public String getdescription() {
		return description;
	}
	public void setdescription(String description) {
		this.description = description;
	}

	
	public Shoe(int id, int category, double price, String name, String description, String imagelink) {
		super();
		this.id = id;
		this.category = category;
		this.price = price;
		this.name = name;
		this.description = description;
		this.imagelink = imagelink;
	}

	
	public Shoe(int category, double price, String name, String description, String imagelink) {
		super();
		this.category = category;
		this.price = price;
		this.name = name;
		this.description = description;
		this.imagelink = imagelink;
	}
	
	@Override
	public String toString() {
		return "Shoe [id=" + id + ", category=" + category + ", price=" + price + ", name=" + name + ", description="
				+ description + ", imagelink=" + imagelink + "]";
	}
	
	public Shoe() {
		super();
	}
	

}
