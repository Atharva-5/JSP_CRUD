package com.controllers;

import com.model.User;
import com.dao.UserDao;
import java.util.List;
import javax.servlet.http.HttpSession;

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
    

    @PostMapping("/checklogin")
    public String checklogin(@ModelAttribute User u, HttpSession session) {
        User validUser = userDao.checkLogin(u.getName(), u.getPass());

        if (validUser != null) {
            session.setAttribute("key", validUser);
            return "redirect:/showuser";
        } else {
            return "redirect:/login";
        }
    }
    
    @PostMapping("/checkuser")
    public String checkuser(@ModelAttribute User u) {
        if (!u.getPass().equals(u.getCpass())) {
            return "redirect:/form?error=passMismatch";
        }

        if (userDao.checkUser(u.getName()) != null) {
            return "redirect:/form?error=username";
        }

        userDao.insert(u);
        return "redirect:/showuser";
    }

    
    @RequestMapping("/login")
    public String two() {
    	return "login";
    }
    
    @GetMapping("/forgotpass")
    public String forgotPage() {
        return "forgotpass";  // returns forgotpass.jsp
    }

    
    @PostMapping("/forgotpass")
    public String resetPassword(@RequestParam String name,
                                @RequestParam String pass,
                                @RequestParam String cpass) {
        if (!pass.equals(cpass)) {
            return "redirect:/forgotpass?error=mismatch";
        }

        // Fetch user by name
        User user = userDao.getUserByName(name);

        if (user != null) {
            user.setPass(pass);
            user.setCpass(cpass);
            userDao.update(user);
            return "redirect:/login?reset=success";
        }

        return "redirect:/forgotpass?error=notfound";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession s1) {
    	s1.invalidate();
    	return "redirect:/login";
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
    public String four(Model m,HttpSession s1) {
    	// We are getting this list from display function of DAO file where display function returns list
    	List<User> l1 = userDao.display();
    	m.addAttribute("temp", l1);
    	if(s1.getAttribute("key") == null) {
    		return "redirect:/login";
    	}
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
