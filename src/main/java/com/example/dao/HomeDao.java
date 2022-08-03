package com.example.dao;

import com.example.vo.HomeVo;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository("homeDao")
public class HomeDao extends CommonDao {
    public void insertInfo(HomeVo vo) throws Exception {
        getSqlSession().insert("mapper.insertInfo",vo);
    }

    public List<HomeVo> selectInfo() throws Exception{
        List<HomeVo> list = getSqlSession().selectList("mapper.selectInfo");
        return list;
    }

    public HomeVo board_detail_select(HomeVo vo) {
        return vo = getSqlSession().selectOne("mapper.board_detail_select",vo);
    }

    public void board_update(HomeVo vo) {
        getSqlSession().update("mapper.board_update",vo);
    }

    public void board_delete(HomeVo vo) {
        getSqlSession().delete("mapper.board_delete",vo);
    }

    public int board_count() {
        return getSqlSession().selectOne("mapper.board_count");
    }

    public List<HomeVo> board_list(int displayPost, int postNum) throws Exception{
        HashMap<String,Integer> data = new HashMap<String, Integer>();

        data.put("displayPost", displayPost);
        data.put("postNum",postNum);

        return getSqlSession().selectList("mapper.board_list",data);
    }
}