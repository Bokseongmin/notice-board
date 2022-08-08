package com.example.service;

import com.example.dao.ReplyDao;
import com.example.vo.ReplyVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService{

    @Resource
    private ReplyDao replyDao;

    // 댓글 조회
    public List<ReplyVo> list(int b_seq) throws Exception{
        return replyDao.list(b_seq);
    }

    // 댓글 조회
    public void write(ReplyVo vo) throws Exception{
        replyDao.write(vo);
    }

    // 댓글 수정
    public void modify(ReplyVo vo) throws Exception{
        replyDao.modify(vo);
    }

    // 댓글 삭제
    public void delete(ReplyVo vo) throws Exception{
        replyDao.delete(vo);
    }
}
