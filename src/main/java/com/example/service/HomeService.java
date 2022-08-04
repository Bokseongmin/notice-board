package com.example.service;

import com.example.vo.HomeVo;

import java.util.List;

public interface HomeService {
    public void insertInfo(HomeVo vo) throws Exception; //등록

    public List<HomeVo> selectInfo() throws Exception; // 조회

    public HomeVo board_detail_select(HomeVo vo) throws Exception;

    void board_update(HomeVo vo)throws Exception;

    void board_delete(HomeVo vo)throws Exception;

    int board_count()throws Exception;

    public List listPage(int displayPost, int postNum) throws Exception;

    public List<HomeVo> listPageSearch(
            int displayPost, int postNum, String searchType, String keyword) throws Exception;
    public int search_count(String searchType, String keyword) throws Exception;
}
