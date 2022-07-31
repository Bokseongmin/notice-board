package com.example.controller;

import com.example.service.HomeService;
import com.example.vo.HomeVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;
import java.util.Locale;

@Controller
public class HomeController {

    @Resource
    private HomeService homeService;

    @RequestMapping(value = "/",method = {RequestMethod.GET,RequestMethod.POST})
    public String index(Locale locale, Model model) throws Exception{
        List<HomeVo> list = homeService.selectInfo();
        model.addAttribute("board_list",list);
        return "index";
    }

    @RequestMapping(value = "/board_insert.do",method = {RequestMethod.GET,RequestMethod.POST})
    public String board_insert(Locale locale, Model model) {
        return "board_insert";
    }

    @RequestMapping(value = "/insertInfo.do", method = {RequestMethod.GET,RequestMethod.POST})
    public String insertInfo(Locale locale, Model model, HomeVo vo) throws Exception {
        homeService.insertInfo(vo);
        return "redirect:/";
    }

    @RequestMapping(value = "/board_detail_select.do", method = {RequestMethod.GET,RequestMethod.POST})
    public String board_detail_select(Locale locale, Model model, HomeVo vo) throws Exception {
        vo = homeService.board_detail_select(vo);
        model.addAttribute("post",vo);
        return "board_detail";
    }

    @RequestMapping(value = "/board_update.do", method = {RequestMethod.GET,RequestMethod.POST})
    public String board_update(Locale locale, Model model, HomeVo vo) throws Exception {
        homeService.board_update(vo);
        model.addAttribute("post",vo);
        return "forward:/board_detail_select.do";
    }

    @RequestMapping(value = "/board_delete.do", method = {RequestMethod.GET,RequestMethod.POST})
    public String board_delete(Locale locale, Model model, HomeVo vo) throws Exception {
        homeService.board_delete(vo);
        return "forward:/";
    }
}