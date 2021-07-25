package com.simplilearn.workshop.resources;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.simplilearn.workshop.model.Purchase;
import com.simplilearn.workshop.model.Shoe;
import com.simplilearn.workshop.model.User;
import com.simplilearn.workshop.service.PurchaseService;
import com.simplilearn.workshop.service.ShoesService;
import com.simplilearn.workshop.service.UsersService;

@Controller
@RequestMapping("/")
public class ActionsController {

	
	@Autowired
	private ShoesService shoeservice;
	@Autowired
	private PurchaseService orderservice;
	@Autowired
	private UsersService userservice;

	
	//==================================================================
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homeForm() {
		return "index";
	}

	
	
	//==================================================================
	//> 
	@GetMapping("/users")
	public List<User> retrieveAllUsers(){
		return userservice.getUsers();
	}
	
	
	//==================================================================
	//> 
	@RequestMapping(value = "/menshoes", method = RequestMethod.GET)
	public String menShoesForm(ModelMap model) {
		List<Shoe> mensData = shoeservice.getMensShoeData();
		model.put("menshoeData", mensData);

		return "menShoesForm";
	}

	//----------------------------------------------
	//> 
	@RequestMapping(value = "/womenshoes", method = RequestMethod.GET)
	public String womenMethod(ModelMap model) {
		List<Shoe> womensData = shoeservice.getWomensShoeData();
		model.put("womenshoeData", womensData);
  
		return "womenShoesForm";
	}

	
	//----------------------------------------------
	//> 
	@RequestMapping("/boyshoes")
	public String boyMethod(ModelMap model) {

		List<Shoe> boysData = shoeservice.getBoysShoeData();
		model.put("boyshoeData", boysData);
		
		return "boysShoesForm";
	}

	
	//----------------------------------------------
	//> 
	@RequestMapping("/girlshoes")
	public String girlMethod(ModelMap model) {

		List<Shoe> girlsData = shoeservice.getGirlsShoeData();
		model.put("girlshoeData", girlsData);
		
		return "girlsShoesForm";
	}


	
	//==================================================================
	//> 
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signinMethod() {
		return "signinForm";
	}
	
	
	//==================================================================
	//> 
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String sigUpMethod() {
		return "signUpForm";
	}

	
	//==================================================================
	//> 
	@GetMapping("/shoes/{id}")
	@RequestMapping("/selectedShoe")
	public String selectedShoeInfoMethod(ModelMap model, @RequestParam @PathVariable int id) {

		try {

			Shoe selectedShoesData = shoeservice.getshoesDataByIdService(id);

			model.put("selectedShoesData", selectedShoesData);
			return "selectedShoeInfoForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "selectedShoeInfoForm";
		}

	}

	
	//==================================================================
	//> 
	@RequestMapping(value = "/orderinfo", method = RequestMethod.GET)
	public String orderInforMethod(ModelMap model, @RequestParam @PathVariable int id, @RequestParam String name,
			@RequestParam int category, @RequestParam double price, @RequestParam String imglink,
			@RequestParam int quantity) {

	

			Purchase orderedshoemodel = new Purchase();

			double totalPrice = price * quantity;

			orderedshoemodel.setShoeid(id);
			orderedshoemodel.setName(name);
			orderedshoemodel.setCategory(category);
			orderedshoemodel.setPrice(price);
			orderedshoemodel.setImagelink(imglink);
			orderedshoemodel.setQuantity(quantity);
			orderedshoemodel.setTotalprice(totalPrice);

			model.put("orderedshoemodel", orderedshoemodel);

			
			//=================================
			//> record-payment
			try {

				long millis = System.currentTimeMillis();
				Date date = new java.sql.Date(millis);

				orderservice.insertBookingInfoService(id, name, category, price, imglink, quantity, totalPrice, date);

				return "orderplaceForm";
			} catch (Exception e) {
				System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());

			}
			
			return "orderplaceForm";

	}
	
	
	//==================================================================
	//> 
	@GetMapping("/recordPayment")
	// @RequestMapping(value = "/recordPayment", method =
	// RequestMethod.GET)
	public String recordPaymentMethod(ModelMap model, @RequestParam(name = "id") int shoeid,
			@RequestParam String name, @RequestParam int category, @RequestParam double price,
			@RequestParam String imglink, @RequestParam int quantity, @RequestParam double totalprice) {

		try {

			long millis = System.currentTimeMillis();
			Date date = new java.sql.Date(millis);

			orderservice.insertBookingInfoService(shoeid, name, category, price, imglink, quantity, totalprice, date);

			return "orderplaceForm";
		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "orderplaceForm";
		}
	}
	
	
	//==================================================================
	//> 
	@GetMapping("/adminsignin")
	public String adminSigninMethod(ModelMap model, @RequestParam String username, @RequestParam String password) {

		int rollid = 0;
		try {

			User userInfoModel = userservice.isValidAdminUserService(username, password);

			if (userInfoModel == null) {
				model.put("errorMessage", "Invalid Credentials");
				return "signinForm";
			}
			rollid = userInfoModel.getRollid();

			if (rollid == 1) {
				List<Shoe> mensData = shoeservice.getMensShoeData();

				model.put("men_women_kids_ShoeDataname", mensData);
				model.put("username", username.toUpperCase());
				model.put("password", password);
				return "adminForm";

			} else if (rollid == 2) {
				model.put("username", username);
				model.put("password", password);
				return "index";
				
			} else if (rollid == 0) {
				model.put("errorMessage", "Invalid Credentials");
				return "signinForm";

			}
			model.put("errorMessage", "Invalid Credentials");
			return "signinForm";
		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			model.put("errorMessage", "Exception check Log File");
			return "signinForm";
		}
	}
	
	
	//==================================================================
	//> 
	@GetMapping("/getcompletemenshoesforAdmin")
	public String getcompletemenshoesforAdmin(ModelMap model) {

		try {
			List<Shoe> mensData = shoeservice.getMensShoeData();

			model.put("men_women_kids_ShoeDataname", mensData);

			return "adminForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "adminForm";
		}

	}

	
	//==================================================================
	//> 
	@GetMapping("/getcompletewomenshoesforAdmin")
	public String getcompletewomenshoesforAdmin(ModelMap model) {

		try {
			List<Shoe> womensData = shoeservice.getWomensShoeData();

			model.put("men_women_kids_ShoeDataname", womensData);

			return "adminForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "adminForm";
		}
	}
	
	
	//==================================================================
	//> 
	@GetMapping("/getcompleteboyshoesforAdmin")
	public String getcompleteboyshoesforAdmin(ModelMap model) {

		try {
			List<Shoe> boysData = shoeservice.getBoysShoeData();

			model.put("men_women_kids_ShoeDataname", boysData);

			return "adminForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "adminForm";
		}
	}
	
	//==================================================================
	//> 
	@GetMapping("/getcompletegirlshoesforAdmin")
	public String getcompletegirlshoesforAdmin(ModelMap model) {

		try {
			List<Shoe> girlsData = shoeservice.getGirlsShoeData();

			model.put("men_women_kids_ShoeDataname", girlsData);

			return "adminForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "adminForm";
		}
	}
	
	
	
	//==================================================================
	//> 
	@RequestMapping(value = "/changeadminpassword", method = RequestMethod.GET)
	public String changeAdminPasswordForm() {
		return "changeAdminPasswordForm";
	}

	
	//==================================================================
	//> 
	@RequestMapping(value = "/addShoesForm", method = RequestMethod.GET)
	public String addShoesForm() {
		return "addShoesForm";
	}

	
	//==================================================================
	//> 
	@GetMapping("/usersList")
	public String usersListMethod(ModelMap model) {
		List<User> usersList = null;

		try {

			usersList = userservice.getUserDataService();

			if (!usersList.isEmpty()) {

				model.put("usersList", usersList);
			} else {
				System.out.println("No Users Found...");
			}
			return "membersListForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "membersListForm";
		}

	}
	
	
	//==================================================================
	//> 
	@GetMapping("/reports")
	public String reportsMethod(ModelMap model) {

		List<Purchase> orderedShoeList = null;
		try {

			orderedShoeList = orderservice.getCompleteTransactionsDataService();

			if (orderedShoeList != null) {

				double totalSales = 0;
				for (Purchase osl : orderedShoeList) {
					totalSales = totalSales + osl.getTotalprice();
				}

				model.put("orderedShoeList", orderedShoeList);
				model.put("totalSales", totalSales);

			}
			return "reportsForm";
		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "reportsForm";
		}
	}
	
	
	//==================================================================
	//> 
	@GetMapping("/changeadminPassword")
	public String changeadminPasswordMethod(ModelMap model, @RequestParam String currentpassword,
			@RequestParam String newpassword, @RequestParam String confirmpassword) {

		User userInfoModel = null;
		try {

			userInfoModel = userservice.isCorrectPassword_or_NotService(currentpassword);
			if (userInfoModel.getRollid() != 0) {
				boolean isUpdatedAdminPassword = userservice.updateAdminPasswordService(userInfoModel, currentpassword,
						newpassword, confirmpassword);
				if (isUpdatedAdminPassword == true) {
					System.out.println("Password Updated");
					return "signinForm";
				} else {
					System.out.println("Password Not Updated");
				}
			}

			else {
				System.out.println("No Data Found");
			}

			return "changeAdminPasswordForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "changeAdminPasswordForm";
		}
	}
	
	
	
	
	//==================================================================
	//> 
	@GetMapping("/requiredmembers")
	public String requiredMembersMethod(ModelMap model, @RequestParam String firstname, @RequestParam String lastname) {

		List<User> orderedUserList = null;
		
		try {
			if (firstname != null && lastname != null) {
				orderedUserList = userservice.getRequiredCompleteTransactionsDataService(firstname, lastname);
				if (orderedUserList != null) {
					model.put("orderedUserList", orderedUserList);
					return "membersListForm";
				}
			}
			return "membersListForm";
		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "membersListForm";
		}
	}
	
	
	
	
	
	//==================================================================
	//> 
	@GetMapping("/requiredreports")
	public String requiredReportsMethod(ModelMap model, @RequestParam String category, @RequestParam String date) {

		List<Purchase> orderedShoeList = null;
		try {

			int categoryId = 0;
			String categoryName = category;
			if (categoryName.equals("mens"))
				categoryId = 1;
			else if (categoryName.equals("womens"))
				categoryId = 2;
			else if (categoryName.equals("boys"))
				categoryId = 3;
			else if (categoryName.equals("girls"))
				categoryId = 4;
			
			String jspdate = date;

			Date sqldate = Date.valueOf(jspdate);

			if (categoryId != 0) {
				orderedShoeList = orderservice.getRequiredCompleteTransactionsDataService(categoryId, sqldate);
				if (orderedShoeList != null) {
					double totalSales = 0;
					for (Purchase osl : orderedShoeList) {
						totalSales = totalSales + osl.getTotalprice();
					}

					model.put("orderedShoeList", orderedShoeList);
					model.put("totalSales", totalSales);
					return "reportsForm";
				}
			}
			return "reportsForm";
		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "reportsForm";
		}
	}
	
	
	//==================================================================
	//> 
	@RequestMapping("/addnewproduct")
	public String addShoesFormMethod(ModelMap model, @RequestParam String weartype, @RequestParam String prod_name,
			@RequestParam double prod_price, @RequestParam String prod_description, @RequestParam String prod_img) {

		try {

			int category = 0;
			if (weartype.equals("Mens_Wear")) {
				category = 1;
			} else if (weartype.equals("Womens_Wear")) {
				category = 2;
			} else if (weartype.equals("Boys_Wear")) {
				category = 3;
			} else if (weartype.equals("Girls_Wear")) {
				category = 4;
			}

			boolean isInsertedNewProduct = false;
			isInsertedNewProduct = shoeservice.insertNewProductService(category, prod_price, prod_name, prod_description, prod_img);
			if (isInsertedNewProduct == true) {
				if (category == 1) {
					List<Shoe> mensData = shoeservice.getMensShoeData();

					model.put("men_women_kids_ShoeDataname", mensData);
					return "adminForm";
				}

				if (category == 2) {
					List<Shoe> womensData = shoeservice.getWomensShoeData();

					model.put("men_women_kids_ShoeDataname", womensData);
					return "adminForm";
				}
				if (category == 3) {
					List<Shoe> boysData = shoeservice.getBoysShoeData();

					model.put("men_women_kids_ShoeDataname", boysData);
					return "adminForm";
				}
				
				if (category == 4) {
					List<Shoe> girlsData = shoeservice.getGirlsShoeData();

					model.put("men_women_kids_ShoeDataname", girlsData);
					return "adminForm";
				}

			} else {
				System.out.println("Product Not Added");
			}
			return "adminForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "adminForm";
		}
	}
	
	
	//==================================================================
	//> 
	@GetMapping("/signupnewuser")
	public String sigUpNewUserMethod(ModelMap model, @RequestParam String firstname, @RequestParam String lastname,
			@RequestParam String password, @RequestParam String confirmpassword, @RequestParam String roll,
			@RequestParam Long mobileno, @RequestParam String email) {

		boolean isInserted = false;
		try {
			int rollid = 0;

			if (roll.equals("admin")) {
				rollid = 1;
			} else {
				rollid = 2;
			}

			isInserted = true;
			userservice.insertUserDataService(firstname, lastname, password, confirmpassword, rollid, mobileno, email);
			if (isInserted == true) {

				return "signinForm";
			}

			if (isInserted == false) {

				return "testErrorForm";
			}
			return "testErrorForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "testErrorForm";
		}
	}
	
	
	//==================================================================
	//> 
	@DeleteMapping("/shoes/{id}")
	@GetMapping("/deleteProduct")
	public String deleteProductMethod(ModelMap model,  @RequestParam @PathVariable int id) {

		boolean isdeleted = false;
		List<Shoe> shoesDatalist = null;
		Shoe findwhichCategory = null;
		try {

			findwhichCategory = shoeservice.getshoesDataByIdService(id);
			int category = findwhichCategory.getCategory();
			isdeleted = shoeservice.deleteProductwithIdService(id);
			if (isdeleted == true) {
				shoesDatalist = shoeservice.getShoeDatabyCategory(category);

				model.put("men_women_kids_ShoeDataname", shoesDatalist);

			}

			return "adminForm";
		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "adminForm";
		}
	}
	
	
	//==================================================================
	//> 
	@PutMapping("/shoes/{id}")
	@GetMapping("/updateProduct")
	public String updateProductMethod(ModelMap model, @RequestParam @PathVariable int id) {

		Shoe shoesData = null;
		try {
			shoesData = shoeservice.getshoesDataByIdService(id);
			if (shoesData.getId() > 0) {
				model.put("men_women_kids_ShoeDataname", shoesData);
				return "updateProductForm";
			}
			return "adminForm";
		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "adminForm";
		}
	}
	
	
	//==================================================================
	//> 
	@GetMapping("/updatetoNewproduct")
	public String updateProductMethod(ModelMap model, @RequestParam String weartype, @RequestParam String prod_name,
			@RequestParam double prod_price,  @RequestParam String prod_description, @RequestParam String prod_img, @RequestParam int prod_id) {

		boolean isupdated = false;
		List<Shoe> shoesDataList = null;
		try {
			int category = 0;
			if (weartype.equals("Mens_Wear")) {
				category = 1;
			} else if (weartype.equals("Womens_Wear")) {
				category = 2;
			} else if (weartype.equals("Boys_Wear")) {
				category = 3;
			}else if (weartype.equals("Girls_Wear")) {
				category = 4;
			}
			isupdated = shoeservice.updateShoeProductService(category, prod_price, prod_name, prod_description, prod_img, prod_id);
			if (isupdated == true) {
				shoesDataList = shoeservice.getShoeDatabyCategory(category);

				model.put("men_women_kids_ShoeDataname", shoesDataList);
			}
			return "adminForm";

		} catch (Exception e) {
			System.out.println(" [ACTIONS CONTROLLER] WARNING: METHOD ERROR OCCURED ----------"+ e.getMessage());
			return "adminForm";
		}
	}
}
