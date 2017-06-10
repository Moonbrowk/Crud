package com.crud.controller;

import com.crud.model.User;
import com.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
    public class myController {
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String index(Model model) {
        return "index";
    }

    @RequestMapping("/welcome")
    public String welcome(Model model) {
        return "welcome";
    }


    @RequestMapping(value = "/users")
    public String users(@RequestParam(required = false) Integer page, @RequestParam(required = false) Integer pagesPer, Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listOfUsers", this.userService.getUserList());
        model.addAttribute("selectedPages" , pagesPer);

        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(this.userService.getUserList());
        if (pagesPer != null ) {
            pagedListHolder.setPageSize(pagesPer);

        } else {
            pagedListHolder.setPageSize(5);
        }

        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
            model.addAttribute("page", page);
            model.addAttribute("users", pagedListHolder.getPageList());
        }
        if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            model.addAttribute("page", page);
            model.addAttribute("users", pagedListHolder.getPageList());
        }
        return "users";
    }



    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("user") User user) {
        if (user.getId() == 0) {

            this.userService.addUser(user);
        } else {
            this.userService.updateUser(user);
        }
        return "redirect:/users";
    }

    @RequestMapping(value = "/search/" , method = RequestMethod.POST)
    public String searchByName(@RequestParam(required = false) String search, Model model) {
        if (search != null) {
            model.addAttribute("searchList", userService.searchByName(search));
        }
        return "search";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.userService.deleteUserById(id);
        return "redirect:/users";
    }


    @RequestMapping("/edit/{id}")
    public String editBook(@RequestParam(required = false) Integer page, @RequestParam(required = false) Integer pagesPer,@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listOfUsers", this.userService.getUserList());
        model.addAttribute("selectedPages" , pagesPer);

        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(this.userService.getUserList());
        if (pagesPer != null ) {
            pagedListHolder.setPageSize(pagesPer);

        } else {
            pagedListHolder.setPageSize(5);
        }

        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
            model.addAttribute("page", page);
            model.addAttribute("users", pagedListHolder.getPageList());
        }
        if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            model.addAttribute("page", page);
            model.addAttribute("users", pagedListHolder.getPageList());
        }
        return "users";
    }


    @RequestMapping("userdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userdata";
    }


}