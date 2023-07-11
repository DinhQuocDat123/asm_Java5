<%--
  Created by IntelliJ IDEA.
  User: hangnt
  Date: 14/03/2023
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h3 style="color: red; text-align: center"><b>Cửa Hàng</b></h3>
<hr>
<a href="/home/hien-thi" class="btn btn-outline-primary" tabindex="-1"
   role="button" style="float: right; margin-bottom: 10px">Quay về trang chủ</a><br>
<form:form action="/cua-hang/add-cua-hang" method="post" modelAttribute="cuaHang">
    <div class="row">
        <div class="col">
            <form:label path="ma"><b>Mã:</b></form:label>
            <form:input path="ma" class="form-control"></form:input>
        </div>

        <div class="col">
            <form:label path="ten"><b>Tên:</b></form:label>
            <form:input path="ten" class="form-control"></form:input>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <form:label path="diaChi"><b>Địa Chỉ:</b></form:label>
            <form:input path="diaChi" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="thanhPho"><b>Thành Phố:</b></form:label>
            <form:input path="thanhPho" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="quocGia"><b>Quốc Gia:</b></form:label>
            <form:input path="quocGia" class="form-control"></form:input>
        </div>
        <div>
            <button type="submit" class="btn btn-primary" onclick="return checkAdd()">ADD</button>
        </div>
    </div>
</form:form>
<form action="">
    <table class="table table-bordered border-dark">
        <tr style="text-align: center">
            <th scope="col">ID</th>
            <th scope="col">Mã</th>
            <th scope="col">Tên</th>
        </tr>
        <c:forEach items="${list}" var="ch">
            <tr>
                <td>${ch.id}</td>
                <td>${ch.ma}</td>
                <td>${ch.ten}</td>
                <td>${ch.diaChi}</td>
                <td>${ch.thanhPho}</td>
                <td>${ch.quocGia}</td>
                <td>
                    <a href="/cua-hang/detail-cua-hang/${ch.id}" class="btn btn-outline-primary" tabindex="-1"
                       role="button">Detail</a>
                    <a href="/cua-hang/remove-cua-hang/${ch.id}" class="btn btn-outline-primary" tabindex="-1"
                       role="button" onclick="return checkRemove() ">Delete</a>
                    <a href="/cua-hang/view-update-cua-hang/${ch.id}" class="btn btn-outline-primary" tabindex="-1"
                       role="button">Update</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/cua-hang/hien-thi?pageNum=0">First</a></li>
        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="${pageContext.request.contextPath}/cua-hang/hien-thi?pageNum=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>
        <li class="page-item"><a class="page-link" href="/cua-hang/hien-thi?pageNum=${total-1}">Last</a></li>
    </ul>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
</body>
</html>