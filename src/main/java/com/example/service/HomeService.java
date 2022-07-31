package com.example.service;

import com.example.vo.HomeVo;

import java.util.List;

public interface HomeService {
    public void insertInfo(HomeVo vo) throws Exception; //등록

    public List<HomeVo> selectInfo() throws Exception; // 조회

    public HomeVo board_detail_select(HomeVo vo) throws Exception;

    void board_update(HomeVo vo)throws Exception;

    void board_delete(HomeVo vo)throws Exception;
}
