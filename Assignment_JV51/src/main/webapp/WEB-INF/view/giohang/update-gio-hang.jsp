<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/31/2023
  Time: 12:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<form:form action="/gio-hang/update-gio-hang/${gioHang.id}" method="post" modelAttribute="gioHang">
    <div class="row">
        <div class="col">
            <form:label path="khachHang"><b>Khách Hàng:</b></form:label>
            <form:select items="${khachHang}" itemLabel="ten" itemValue="id" path="khachHang"
                         class="form-control"></form:select>
        </div>
        <div class="col">
            <form:label path="nhanVien"><b>Nhân Viên:</b></form:label>
            <form:select items="${nhanVien}" itemLabel="ten" itemValue="id" path="nhanVien"
                         class="form-control"></form:select>
        </div>
        <div class="col">
            <form:label path="ma"><b>Mã:</b></form:label>
            <form:input path="ma" class="form-control"></form:input>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <form:label path="ngayTao"><b>Ngày Tạo:</b></form:label>
            <form:input path="ngayTao" class="form-control" type="date"></form:input>
        </div>
        <div class="col">
            <form:label path="ngayThanhToan"><b>Ngày Thanh Toán:</b></form:label>
            <form:input path="ngayThanhToan" class="form-control" type="date"></form:input>
        </div>
<%--        <div class="col">--%>
<%--            <form:label path="ngayShip"><b>Ngày Ship:</b></form:label>--%>
<%--            <form:input path="ngayShip" class="form-control" type="date"></form:input>--%>
<%--        </div>--%>
<%--        <div class="col">--%>
<%--            <form:label path="ngayNhan"><b>Ngày Nhận:</b></form:label>--%>
<%--            <form:input path="ngayNhan" class="form-control" type="date"></form:input>--%>
<%--        </div>--%>
        <div class="row">

            <div class="col">
                <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                <form:input path="tinhTrang" class="form-control"></form:input>
            </div>
            <div class="col">
                <form:label path="tenNguoiNhan"><b>Tên Người Nhận:</b></form:label>
                <form:input path="tenNguoiNhan" class="form-control"></form:input>
            </div>
            <div class="col">
                <form:label path="diaChi"><b>Địa Chỉ:</b></form:label>
                <form:input path="diaChi" class="form-control"></form:input>
            </div>
            <div class="col">
                <form:label path="sdt"><b>SĐT:</b></form:label>
                <form:input path="sdt" class="form-control"></form:input>
            </div>
        </div>
        <div>
            <button type="submit" class="btn btn-primary" >Save</button>
        </div>

    </div>
</form:form>
</body>
<script src="../../js/check.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
</html>
