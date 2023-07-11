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
<h3 style="color: red; text-align: center" ><b>Khách hàng</b></h3>
<hr>
<a href="/home/hien-thi" class="btn btn-outline-primary" tabindex="-1"
   role="button" style="float: right; margin-bottom: 10px" >Quay về trang chủ</a>
<form:form action="/khach-hang/add-khach-hang" method="post" modelAttribute="khachHang">
    <div class="row">
        <div class="col">
            <form:label path="ma"><b>Mã:</b></form:label>
            <form:input path="ma" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="ho"><b>Họ:</b></form:label>
            <form:input path="ho" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="tenDem"><b>Tên Đệm:</b></form:label>
            <form:input path="tenDem" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="ten"><b>Tên:</b></form:label>
            <form:input path="ten" class="form-control"></form:input>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <form:label path="ngaySinh"><b>Ngày Sinh:</b></form:label>
            <form:input path="ngaySinh"  class="form-control" type="date"></form:input>
        </div>
        <div class="col">
            <form:label path="sdt"><b>SĐT:</b></form:label>
            <form:input path="sdt" class="form-control"></form:input>
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
        <div class="col">
            <form:label path="matKhau"><b>Mật Khẩu:</b></form:label>
            <form:input path="matKhau" class="form-control"></form:input>
        </div>
        <div>
            <button type="submit" class="btn btn-primary">ADD</button>
        </div>
    </div>
</form:form>
<form action="" >
    <table class="table table-bordered border-dark" >
        <tr style="text-align: center">
            <th scope="col">ID</th>
            <th scope="col">Mã</th>
            <th scope="col">Họ</th>
            <th scope="col">Tên Đệm</th>
            <th scope="col">Tên</th>
            <th scope="col">Ngày Sinh</th>
            <th scope="col">SĐT</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">Thành Phố</th>
            <th scope="col">Quốc Gia</th>
            <th scope="col">Mật khẩu</th>
            <th scope="col">Action</th>
        </tr>
        <c:forEach items="${list}" var="kh">
            <tr>
                <td>${kh.id}</td>
                <td>${kh.ma}</td>
                <td>${kh.ho}</td>
                <td>${kh.tenDem}</td>
                <td>${kh.ten}</td>
                <td>${kh.ngaySinh}</td>
                <td>${kh.sdt}</td>
                <td>${kh.diaChi}</td>
                <td>${kh.thanhPho}</td>
                <td>${kh.quocGia}</td>
                <td>${kh.matKhau}</td>
                <td>
                    <a href="/khach-hang/detail-khach-hang/${kh.id}" class="btn btn-outline-primary" tabindex="-1" role="button" >Detail</a>
                    <a href="/khach-hang/remove-khach-hang/${kh.id}" class="btn btn-outline-primary" tabindex="-1" role="button" onclick="return checkRemove() ">Delete</a>
                    <a href="/khach-hang/view-update-khach-hang/${kh.id}" class="btn btn-outline-primary" tabindex="-1" role="button" >Update</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/khach-hang/hien-thi?pageNum=0">First</a></li>
        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="${pageContext.request.contextPath}/khach-hang/hien-thi?pageNum=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>
        <li class="page-item"><a class="page-link" href="/khach-hang/hien-thi?pageNum=${total-1}">Last</a></li>
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