<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-07-29
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>게시글 상세조회</title>
    <link href="${path}/resources/css/1.css" rel="stylesheet">
    <script>
        function board_list() {
            document.detail_form.action = "/";
            document.getElementById("detail_form").submit();
        }

        function board_update() {
            document.detail_form.action = "/board_update.do";
            document.getElementById("detail_form").submit();
        }

        function board_delete() {
            document.detail_form.action = "/board_delete.do";
            document.getElementById("detail_form").submit();
        }
    </script>
</head>

<body>
<div id="wrap">
    <div class="top">
        <div class="main-title">
            <div class="top-title">
                <h1>상세</h1>
            </div>
        </div>

        <!-- board list area -->
        <div id="main">
            <div class="container">
                <form name="detail_form" id="detail_form" method="post">
                    <div>
                        <div>
                            <table class="board-table">
                                <tr>
                                    <th scope="col" class="th-seq">번호</th>
                                    <td>${post.seq}</td>
                                </tr>
                                <tr>
                                    <th scope="col" class="th-seq">제목</th>
                                    <td><input class="input" style="width: 80%;" type="text" name="title"
                                               value="${post.title}"></td>
                                </tr>
                                <tr>
                                    <th scope="col" class="th-seq">내용</th>
                                    <td><input class="input" style="width: 80%; height: 100px;" type="text"
                                               name="content" value="${post.content}"></td>
                                </tr>
                                <tr>
                                    <th scope="col" class="th-seq">글쓴이</th>
                                    <td>${post.writer}</td>
                                </tr>
                                <tr>
                                    <th scope="col" class="th-seq">작성일</th>
                                    <td>${post.date}</td>
                                </tr>
                            </table>
                        </div>
                        <input class="btn-info" style="margin-right: 5px;" type="button" value="수정"
                               onclick="board_update()">
                        <input class="btn-info" style="margin-right: 5px;" type="button" value="삭제"
                               onclick="board_delete()">
                        <input class="btn-info" style="margin-right: 5px;" type="button" value="목록"
                               onclick="board_list()">
                        <input type="hidden" value="${post.seq}" name="seq">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>