<%--
  Created by IntelliJ IDEA.
  User: duddn
  Date: 2022-07-29
  Time: 오후 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>게시판 글 등록</title>
    <link href="${path}/resources/css/1.css" rel="stylesheet">
    <script>
        function insert() {
            document.board_insert.action = "/insertInfo.do";
            document.board_insert.submit();
        }
    </script>
</head>

<body>
<div id="wrap">
    <div class="top">
        <div class="main-title">
            <div class="top-title">
                <h1>글 작성</h1>
            </div>
        </div>

        <!-- board list area -->
        <div id="main">
            <div class="container">
                <form name="board_insert" method="post">
                    <table class="board-table">
                        <tr>
                            <th scope="col" class="th-seq">제목</th>
                            <td><input style="width: 600px;" type="text" name="title"></td>
                        </tr>
                        <tr>
                            <th scope="col" class="th-seq">작성자</th>
                            <td><input style="width: 600px;" type="text" name="writer"></td>
                        </tr>
                        <tr>
                            <th scope="col" class="th-seq">내용</th>
                            <td><textarea style="width: 600px; height: 100px;" name="content"></textarea></td>
                        </tr>
                    </table>
                </form>
                <input class="btn-info" type="button" value="글 등록" onclick="insert()">
            </div>
        </div>
    </div>
</div>
</body>

</html>