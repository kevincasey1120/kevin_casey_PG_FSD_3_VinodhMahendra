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

import com.simplilearn.workshop.repository.PurchaseRepository;
import com.simplilearn.workshop.repository.UserRepository;
import com.simplilearn.workshop.model.Purchase;
import com.simplilearn.workshop.model.Shoe;
import com.simplilearn.workshop.model.User;

@Service(value = "usersService")
public class UsersService {

	@Autowired
	private UserRepository userRepository;

	

	public List<User> getUsers() {
		return userRepository.findAll();
	}
	
	
	public User isValidAdminUserService(String username, String password) {

		User userInfoModel = userRepository.isValidAdminUser(username, password);

		return userInfoModel;

	}
	
	public List<User> getUserDataService() {
		
		 List<User> usersList= (List)userRepository.getUserDatabyRollid(2);
	        
	       return usersList;
	    }
	
	
	
	public  User  isCorrectPassword_or_NotService(String password) {
		
		  User  usersList=  userRepository.isCorrectPassword_or_Not(password);
	        
	       return usersList;
	    }
	
 	
	public  boolean  updateAdminPasswordService(User userInfoModel, String currentpassword,
			String newpassword, String confirmpassword) {
		int count=0;
		boolean isUpdated=false;
		    count=  userRepository.updateAdminPassword(confirmpassword,userInfoModel.getFirstname());
		     
	        if(count>0)
	        {
	        	isUpdated=true;
	        }
	       return isUpdated;
	    }
	
	public void insertUserDataService(String firstname, String lastname, String password, String confirmpassword, int rollid, Long mobileno, String email)
	{
		User   u =new User(firstname, lastname, confirmpassword, rollid, mobileno, email);
		userRepository.save(u);
	}
	
	
	 public List<User> getRequiredCompleteTransactionsDataService(String firstname,String lastname)
	 {
		 List<User> orderedUserList= (List)userRepository.getRequiredCompleteTransactionsData(firstname, lastname);
	     return orderedUserList;
		 
	 }
}
