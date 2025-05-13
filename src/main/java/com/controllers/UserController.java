package com.controllers;

import com.model.User;
import com.dao.UserDao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

@Controller
public class UserController {

    @Autowired
    UserDao userDao;
    
    @RequestMapping("/form")
    public String one() {
    	return "form";
    }
    

    @RequestMapping("/registerUserInfo")
    public String three(@ModelAttribute User u) {
    	
    	if(u.getPass().equals(u.getCpass())) {
    	userDao.insert(u);
    	
    	return "redirect:/showuser";
    	}
    	return null;
    }
    
    @RequestMapping("/showuser")
    public String four(Model m) {
    	// We are getting this list from display function of DAO file where display function returns list
    	List<User> l1 = userDao.display();
    	m.addAttribute("temp", l1);
    	
    	return "showUser";
    }
    
 // For Deleting a User
    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") int id) {
        userDao.delete(id);
        return "redirect:/showuser";
    }

    // For Editing (show form pre-filled)
    @RequestMapping("/editUser")
    public String editUser(@RequestParam("id") int id, Model m) {
        User u = userDao.getUserById(id);
        m.addAttribute("user", u);
        return "editForm"; // new form for editing
    }

    // After Editing - Save updated details
    @RequestMapping("/updateUser")
    public String updateUser(@ModelAttribute User u) {
        userDao.update(u);
        return "redirect:/showuser";
    }

}
