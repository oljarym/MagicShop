package com.magicshop.controllers;

import com.magicshop.model.Goods;
import com.magicshop.services.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping(value = "/goods/")
public class GoodsRestController {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Goods>> getAllGoods() {
        List<Goods> goodsList = goodsService.findAll();

        if (goodsList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(goodsList, HttpStatus.OK);
    }

    @RequestMapping(value = "id/{goodsId}", method = RequestMethod.GET)
    public ResponseEntity<Goods> getGoodsById(@PathVariable int goodsId) {
        Goods goods = goodsService.findById(goodsId);
        if (goods == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(goods, HttpStatus.OK);
    }

    @RequestMapping(value = "name/{name}", method = RequestMethod.GET)
    public ResponseEntity<Goods> getGoodsByName(@PathVariable String name) {
        Goods goods = goodsService.findByName(name);
        if (goods == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(goods, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> addNewGoods(@RequestBody Goods goods) {
        goodsService.add(goods);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @RequestMapping(value = "goodsId/{goodsId}", method = RequestMethod.PUT)
    public ResponseEntity<Void> updateGoods(@RequestBody Goods goods, @PathVariable int goodsId) {
        if (goods == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        goodsService.update(goods, goodsId);
        return new ResponseEntity<>(HttpStatus.ACCEPTED);
    }

    @RequestMapping(value = "goodsId/{goodsId}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteGoods(@RequestBody Goods goods, @PathVariable int goodsId) {
        if (goods == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        goodsService.delete(goods);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }




}
