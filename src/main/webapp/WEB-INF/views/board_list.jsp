<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-07-29
  Time: 오후 1:39
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
            document.searchform.action = "/board_view?b_seq=" + seq;
            document.searchform.submit()
        }

        function cntPer() {
            var sel = document.getElementById('cntPerPage').value;
            location.href = "board_list?nowPage=${page.nowPage}&cntPerPage=" + sel;
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
                            <span>[ <a href="/board_list?nowPage=${page.startPage - 1}&cntPerPage=${page.cntPerPage}">이전</a> ]</span>
                        </c:if>
                        <c:forEach begin="${page.startPage}" end="${page.lastPage}" var="nowPage">
                            <span>
                                <c:if test="${select != nowPage}">
                                    <a href="/board_list?nowPage=${nowPage}&cntPerPage=${page.cntPerPage}">${nowPage}</a>
                                </c:if>
                                <c:if test="${select == nowPage}">
                                    <b>${nowPage}</b>
                                </c:if>
                            </span>
                        </c:forEach>
                        <c:if test="${page.next}">
                            <span>[ <a href="/board_list?nowPage=${page.lastPage + 1}&cntPerPage=${page.cntPerPage}">다음</a> ]</span>
                        </c:if>
                    </div>
                    <input class="btn-info" type="button" value="글 등록" onclick="board_insert()">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>