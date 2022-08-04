<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-08-04
  Time: 오전 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link href="${path}/resources/css/1.css" rel="stylesheet">
    <script>
        function board_insert() {
            document.location = "/board_insert.do"
        }

        function board_detail_select(seq) {
            document.searchform.action = "/board_detail_select.do?seq=" + seq;
            document.searchform.submit()
        }

        function cntPer() {
            var sel = document.getElementById('cntPerPage').value;
            location.href = "board_search?nowPage=${page.nowPage}&cntPerPage=" + sel + "${page.searchType_keyword}";
        }

        function searchBtn() {
            let searchType = document.getElementsByName("searchType")[0].value;
            let keyword =  document.getElementsByName("keyword")[0].value;
            location.href = "board_search?nowPage=${page.nowPage}&cntPerPage=${page.cntPerPage}&searchType=" + searchType + "&keyword=" + keyword;
        }
    </script>
</head>
<body>
<div id="wrap">
    <div class="top">
        <div class="main-title">
            <div class="top-title">
                <h1>게시판</h1>
            </div>
        </div>

        <!-- board list area -->
        <div id="main">
            <form method="post" name="searchform" id="id_searchform">
                <div class="container">
                    <table class="board-table">
                        <div style="margin-bottom: 5px; float: right;">
                            <select id="cntPerPage" name="sel" onchange="cntPer()">
                                <option value="5"
                                        <c:if test="${page.cntPerPage== 5}">selected</c:if>>5개씩
                                </option>
                                <option value="10"
                                        <c:if test="${page.cntPerPage == 10}">selected</c:if>>10개씩
                                </option>
                                <option value="15"
                                        <c:if test="${page.cntPerPage == 15}">selected</c:if>>15개씩
                                </option>
                                <option value="20"
                                        <c:if test="${page.cntPerPage == 20}">selected</c:if>>20개씩
                                </option>
                            </select>
                        </div> <!-- 옵션선택 끝 -->
                        <thead>
                        <tr>
                            <th scope="col" class="th-seq">번호</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-writer">작성자</th>
                            <th scope="col" class="th-date">등록일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${list}" varStatus="status">
                            <tr>
                                <td>${list.seq}</td>
                                <td><a onclick="board_detail_select(${list.seq})">${list.title}</a></td>
                                <td>${list.writer}</td>
                                <td>${list.date}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div style="">
                        <c:if test="${page.prev}">
                            <span>[ <a href="/board_search?nowPage=${page.startPage - 1}&cntPerPage=${page.cntPerPage}${page.searchType_keyword}">이전</a> ]</span>
                        </c:if>
                        <c:forEach begin="${page.startPage}" end="${page.lastPage}" var="nowPage">
                            <span>
                                <c:if test="${select != nowPage}">
                                    <a href="/board_search?nowPage=${nowPage}&cntPerPage=${page.cntPerPage}${page.searchType_keyword}">${nowPage}</a>
                                </c:if>
                                <c:if test="${select == nowPage}">
                                    <b>${nowPage}</b>
                                </c:if>
                            </span>
                        </c:forEach>
                        <c:if test="${page.next}">
                            <span>[ <a href="/board_search?nowPage=${page.lastPage + 1}&cntPerPage=${page.cntPerPage}${page.searchType_keyword}">다음</a> ]</span>
                        </c:if>
                        <div>
                            <select name="searchType">
                                <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
                                <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
                                <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
                                <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
                            </select>

                            <input type="text" name="keyword" value="${page.keyword}"/>

                            <button type="button" onclick="searchBtn()">검색</button>
                        </div>
                    </div>
                    <input class="btn-info" type="button" value="글 등록" onclick="board_insert()">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>