package com.magicshop.controllers;

import com.magicshop.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
public class HomePageController {

    private final UserService userService;

    @Autowired
    public HomePageController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/")
    public String showHomePage(Model model, Principal principal) {
        if (principal == null) {
            return "home";
        }
        int idUser = userService.findByEmail(principal.getName()).getUserId();
        model.addAttribute("idUser", idUser);
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



   @RequestMapping("/personal-room")
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


    @RequestMapping(value = "/all-goods")
    public String showGoodsListForAdmin() {
        return "allGoods";
    }

    @RequestMapping(value = "/all-users")
    public String showUsersListForAdmin() {return "users";}

    @RequestMapping(value = "/my-orders")
    public String showShopListForUser(Model model, Principal principal) {
        if(principal == null) {
            return "login";
        }
        int idUser = userService.findByEmail(principal.getName()).getUserId();
        model.addAttribute("idUser", idUser);
        return "myOrders";
    }

}

