package com.simplilearn.workshop.model;

/////////////////////////////////////////////////////////////////////////////
//CAL-TECH FULL STACK DEVELOPMENT COURSE -- SPOPRTY SHOES ASSESSMENT ---
//
//DEVELOPER/STUDENT:   Kevin Casey
//ORIGINATION DATE:  20 JULY
//LAST UPDATED  ON:  20 JULY
/////////////////////////////////////////////////////////////////////////////

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "purchases")
public class Purchase {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "orderid")
	private int orderid;
	
	@Column(name = "shoeid")
	private int shoeid ;
	
	@Column(name = "category")
	private int category;
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "quantity")
	private int quantity ;
	
	@Column(name = "date")
	private Date date;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "imagelink")
	private String imagelink;
	
	@Column(name = "totalprice")
	private double totalprice ;
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getShoeid() {
		return shoeid;
	}
	public void setShoeid(int shoeid) {
		this.shoeid = shoeid;
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
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public Purchase() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Purchase(int shoeid, int category, double price, int quantity, Date date, String name,
			String imagelink, double totalprice) {
		super();
		this.shoeid = shoeid;
		this.category = category;
		this.price = price;
		this.quantity = quantity;
		this.date = date;
		this.name = name;
		this.imagelink = imagelink;
		this.totalprice = totalprice;
	}
	 
	@Override
	public String toString() {
		return "OrderedShoeModel [orderid=" + orderid + ", shoeid=" + shoeid + ", category=" + category + ", price="
				+ price + ", quantity=" + quantity + ", date=" + date + ", name=" + name + ", imagelink=" + imagelink
				+ ", totalprice=" + totalprice + "]";
	}
}
