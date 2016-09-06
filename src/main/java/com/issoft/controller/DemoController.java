package com.issoft.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @author AlexeyMarchenko
 */

@RestController
public class DemoController {

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String demo(){
        return String.valueOf("now is  " + new Date());
    }
}
