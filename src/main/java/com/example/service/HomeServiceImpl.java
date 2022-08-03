package com.example.service;

import com.example.dao.HomeDao;
import com.example.vo.HomeVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HomeServiceImpl implements HomeService{
    @Resource
    private HomeDao homeDao;

    public void insertInfo(HomeVo vo) throws Exception{
        homeDao.insertInfo(vo);
    }

    public List<HomeVo> selectInfo() throws Exception{
        List<HomeVo> list = homeDao.selectInfo();
        return list;
    }

    public HomeVo board_detail_select(HomeVo vo) throws Exception{
        return vo = homeDao.board_detail_select(vo);
    }

    public void board_update(HomeVo vo) throws Exception{
        homeDao.board_update(vo);
    }

    public void board_delete(HomeVo vo) throws Exception{
        homeDao.board_delete(vo);
    }

    public int board_count()throws Exception{
        return homeDao.board_count();
    }

    public List listPage(int displayPost, int postNum) throws Exception {
        return homeDao.board_list(displayPost, postNum);
    }
}
