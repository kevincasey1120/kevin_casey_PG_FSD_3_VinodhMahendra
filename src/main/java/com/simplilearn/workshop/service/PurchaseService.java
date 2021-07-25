package com.simplilearn.workshop.service;

/////////////////////////////////////////////////////////////////////////////
//CAL-TECH FULL STACK DEVELOPMENT COURSE -- SPOPRTY SHOES ASSESSMENT ---
//
//DEVELOPER/STUDENT:   Kevin Casey
//ORIGINATION DATE:  20 JULY
//LAST UPDATED  ON:  20 JULY
/////////////////////////////////////////////////////////////////////////////

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simplilearn.workshop.repository.*;
import com.simplilearn.workshop.model.Purchase;

@Service(value = "purchaseService")
public class PurchaseService {
	@Autowired
	private PurchaseRepository purchaseRepository;

	public void insertBookingInfoService(int shoeid, String name, int category,
			double price, String imglink, int quantity, double totalprice,Date date )
	{
		Purchase  orderedShoeModel =new  Purchase(shoeid, category, price, quantity, date, name, imglink, totalprice);
		purchaseRepository.save(orderedShoeModel);
	}



	public List<Purchase> getCompleteTransactionsDataService() {

		List<Purchase> completeOrdersData= (List)purchaseRepository.findAll();
		return completeOrdersData;
	}

	public List<Purchase> getRequiredCompleteTransactionsDataService(int categoryId,Date date)
	{
		List<Purchase> orderedShoeList= (List)purchaseRepository.getRequiredCompleteTransactionsData(categoryId, date);
		return orderedShoeList;
	}

}
