package com.example.dao;

import com.example.vo.ReplyVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("replyDao")
public class ReplyDao extends CommonDao{
    // 댓글 조회
    public List<ReplyVo> list(int b_seq) throws Exception{
        return getSqlSession().selectList("mapper_reply.reply_list", b_seq);
    }

    // 댓글 조회
    public void write(ReplyVo vo) throws Exception{
        getSqlSession().insert("mapper_reply.reply_write", vo);
    }

    // 댓글 수정
    public void modify(ReplyVo vo) throws Exception{
        getSqlSession().update("mapper_reply.reply_modify", vo);
    }

    // 댓글 삭제
    public void delete(ReplyVo vo) throws Exception{
        getSqlSession().delete("mapper_reply.reply_delete", vo);
    }
}
