package com.magicshop.controllers;

import com.magicshop.model.Order;

import com.magicshop.model.UserOrders;
import com.magicshop.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping(value = "/orders/")
public class OrderRestController {

    private final OrderService orderService;

    @Autowired
    public OrderRestController(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping(value = "/{id}/", method = RequestMethod.GET)
    public ResponseEntity<Order> findById(@PathVariable int id) {
        Order order = orderService.findById(id);
        if (order == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(order, HttpStatus.OK);
    }

    @RequestMapping( method = RequestMethod.POST)
      public ResponseEntity<Void> createOrder(@RequestBody Order order) {
          if (order == null) {
              return new ResponseEntity<>(HttpStatus.NO_CONTENT);
          }
          orderService.addOrder(order);
          return new ResponseEntity<>(HttpStatus.CREATED);
    }


    @RequestMapping(value = "userId/{userId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<UserOrders>> findAllUserOrders(@PathVariable int userId) {
        List<UserOrders> userOrders = orderService.findAllUserOrders(userId);
        if (userOrders == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(userOrders, HttpStatus.OK);
    }

}
