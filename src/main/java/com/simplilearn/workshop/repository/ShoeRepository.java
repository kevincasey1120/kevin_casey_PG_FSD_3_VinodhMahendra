package com.simplilearn.workshop.repository;

/////////////////////////////////////////////////////////////////////////////
//CAL-TECH FULL STACK DEVELOPMENT COURSE -- SPOPRTY SHOES ASSESSMENT ---
//
//DEVELOPER/STUDENT:   Kevin Casey
//ORIGINATION DATE:  20 JULY
//LAST UPDATED  ON:  20 JULY
/////////////////////////////////////////////////////////////////////////////

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.simplilearn.workshop.model.Shoe;


@Repository
public interface ShoeRepository extends CrudRepository<Shoe, Integer> {

	@Modifying
	@Transactional
	@Query("update Shoe set category=:category, price=:price, name=:name, description=:description, imagelink=:imagelink  where id=:id")
	public int updateShoeProduct(@Param("category") int category, @Param("price") double price,
			@Param("name") String name, @Param("description") String description, @Param("imagelink") String imagelink,
			@Param("id") int id);  
	
	@Modifying
	@Transactional
	@Query("delete from Shoe where id=:id")
	public int deleteProductwithId(@Param("id") int id);
	
	@Query("from Shoe where category=:category")
	public Iterable<Shoe> findByCategory(int category);
	
	@Query("from Shoe where id=:seletedShoeId")
	public  Shoe  getshoesDataById(int seletedShoeId);


}
