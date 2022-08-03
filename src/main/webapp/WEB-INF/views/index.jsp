<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-07-29
  Time: 오후 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Title</title>
    <link href="${path}/resources/css/1.css" rel="stylesheet">
    <script>
        function board_insert() {
            document.location="/board_insert.do"
        }
        function board_detail_select(seq) {
            document.searchform.action = "/board_detail_select.do?seq="+seq;
            document.searchform.submit()
        }
        function selChange() {
            var sel = document.getElementById('cntPerPage').value;
            location.href="boardList?nowPage=${paging.nowPage}&cntPerPage="+sel;
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
                        <select id="cntPerPage" name="sel" onchange="selChange()">
                            <option value="5"
                                    <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
                            <option value="10"
                                    <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
                            <option value="15"
                                    <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
                            <option value="20"
                                    <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
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
                    <c:forEach var = "board_list" items="${board_list}" varStatus = "status">
                        <tr>
                            <td>${board_list.seq}</td>
                            <td><a onclick="board_detail_select(${board_list.seq})">${board_list.title}</a></td>
                            <td>${board_list.writer}</td>
                            <td>${board_list.date}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <input class="btn-info" type="button" value="글 등록" onclick="board_insert()">
                <!--<button class="btn-info" type="button" form = "id_searchform" onclick="board_insert()">글 드응록</button> -->
            </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>