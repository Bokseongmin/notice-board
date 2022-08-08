package com.example.service;

import com.example.vo.ReplyVo;

import java.util.List;

public interface ReplyService {
    // 댓글 조회
    public List<ReplyVo> list(int bno) throws Exception;

    // 댓글 조회
    public void write(ReplyVo vo) throws Exception;

    // 댓글 수정
    public void modify(ReplyVo vo) throws Exception;

    // 댓글 삭제
    public void delete(ReplyVo vo) throws Exception;
}
