package com.magicshop.controllers;

import com.magicshop.model.Order;

import com.magicshop.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;



@RestController
@RequestMapping(value = "/orders/")
public class OrderRestController {



    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/{id}/", method = RequestMethod.GET)
    public ResponseEntity<Order> findById(@PathVariable int id) {
        Order order = orderService.findById(id);
        if (order == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(order, HttpStatus.OK);
    }

  /*  @RequestMapping(value = "/{userId}/", method = RequestMethod.GET)
    public ResponseEntity<List<Order>> findByUser(@RequestBody User user) {

        List<Order> orderList = orderService.findByUser(user.getUserId());
        if (orderList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(orderList, HttpStatus.OK);
    } */

  @RequestMapping( method = RequestMethod.POST)
    public ResponseEntity<Void> createOrder(@RequestBody Order order) {
        orderService.addOrder(order);
      return new ResponseEntity<>(HttpStatus.CREATED);
  }





}
