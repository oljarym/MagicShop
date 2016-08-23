package com.magicshop.controllers;

import com.magicshop.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
public class HomePageController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/")
    public String showHomePage() {
        return "home";
    }

    @RequestMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @RequestMapping("/register")
    public String showRegisterPage() {
        return "register";
    }



   @RequestMapping("/personalRoom")
    public String showPersonalRoomPage(Model model, Principal principal ) {
        if(principal == null) {
            return "login";
        }
        int idUser = userService.findByEmail(principal.getName()).getUserId();
        String userEmail = principal.getName();
        model.addAttribute("idUser", idUser);
        model.addAttribute("userEmail", userEmail);
        return "personalRoom";
    }


    @RequestMapping(value = "/allGoods")
    public String showGoodsListForAdmin() {
        return "allGoods";
    }

    @RequestMapping(value = "/allUsers")
    public String showUsersListForAdmin() {return "users";}

    @RequestMapping(value = "/myOrders")
    public String showShopListForUser(Model model, Principal principal) {
        if(principal == null) {
            return "login";
        }
        int idUser = userService.findByEmail(principal.getName()).getUserId();
        String userEmail = principal.getName();
        model.addAttribute("idUser", idUser);
        model.addAttribute("userEmail", userEmail);
        return "myOrders";
    }

}

