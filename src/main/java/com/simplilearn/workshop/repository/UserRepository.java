package com.simplilearn.workshop.repository;

/////////////////////////////////////////////////////////////////////////////
//CAL-TECH FULL STACK DEVELOPMENT COURSE -- SPOPRTY SHOES ASSESSMENT ---
//
//DEVELOPER/STUDENT:   Kevin Casey
//ORIGINATION DATE:  20 JULY
//LAST UPDATED  ON:  20 JULY
/////////////////////////////////////////////////////////////////////////////

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.simplilearn.workshop.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {


	 @Modifying
	 @Transactional
	 @Query("update User  set  password = :password where rollid=1 and firstname=:username")
	 public int updateAdminPassword(@Param("password") String password, @Param("username") String username);
	 
	 @Query("from User where password=:password")
	    public  User  isCorrectPassword_or_Not(String password);
  	 
	 @Query("from User where firstname=:username and lastname=:lastname")
     public  List<User> getRequiredCompleteTransactionsData(String username, String lastname );
	 
	 @Query("from User where firstname=:username and password=:password")
     public User  isValidAdminUser(String username, String password );
	
	 @Query("from User where rollid=:rollid")
	    public Iterable<User> getUserDatabyRollid(int rollid);
	 
}
