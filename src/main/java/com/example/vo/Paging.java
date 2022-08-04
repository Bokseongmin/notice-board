package com.example.vo;

public class Paging {
    // 현재 페이지, 게시물 총 갯수, 페이지당 글 갯수, 페이징 번호, 보여줄 게시물, 보여줄 페이징 갯수
    private int nowPage, cntPost, cntPerPage, pageNum, displayPost, pageNumCnt, startPage, lastPage;
    private String searchType, keyword, searchType_keyword;

    // 이전, 다음
    private boolean prev, next;

    public int getnowPage() {
        return nowPage;
    }
    public void setnowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getcntPost() {
        return cntPost;
    }
    public void setcntPost(int cntPost) {
        this.cntPost = cntPost;
        Calc();
    }

    public int getcntPerPage() {
        return cntPerPage;
    }
    public void setcntPerPage(int cntPerPage) {
        this.cntPerPage = cntPerPage;
    }

    public int getPageNum() {
        return pageNum;
    }

    public int getDisplayPost() {
        return displayPost;
    }

    public int getpageNumCnt() {
        return pageNumCnt;
    }
    public void setpageNumCnt(int pageNumCnt) {
        this.pageNumCnt = pageNumCnt;
    }

    public int getlastPage() {
        return lastPage;
    }

    public int getstartPage() {
        return startPage;
    }

    public boolean getPrev() {
        return prev;
    }

    public boolean getNext() {
        return next;
    }

    private void Calc() {

        // 마지막 번호
        lastPage = (int)(Math.ceil((double)nowPage / (double)pageNumCnt) * pageNumCnt);

        // 시작 번호
        startPage = lastPage - (pageNumCnt - 1);

        // 마지막 페이지 계산
        int tmp = (int)(Math.ceil((double)cntPost / (double)cntPerPage));

        if(lastPage > tmp) {
            lastPage = tmp;
        }

        prev = startPage == 1 ? false : true;
        next = lastPage * pageNumCnt >= cntPost ? false : true;

        displayPost = (nowPage - 1) * cntPerPage;
    }

    public String getsearchType_keyword() {
        if(searchType.equals("") || keyword.equals("")) {
            return "";
        } else {
            return "&searchType=" + searchType + "&keyword=" + keyword;
        }
    }

    public String getsearchType() {
        return searchType;
    }

    public void setsearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getkeyword() {
        return keyword;
    }

    public void setkeyword(String keyword) {
        this.keyword = keyword;
    }
}
