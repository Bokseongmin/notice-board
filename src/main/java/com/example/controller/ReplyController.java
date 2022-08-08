package com.example.controller;

import com.example.service.ReplyService;
import com.example.vo.ReplyVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

    @Resource
    private ReplyService replyService;

    // 댓글 작성
    @RequestMapping(value = "/write", method = {RequestMethod.GET, RequestMethod.POST})
    public String post_write(ReplyVo vo) throws Exception {

        replyService.write(vo);

        return "redirect:/board_view?b_seq=" + vo.getB_seq();
    }
}
