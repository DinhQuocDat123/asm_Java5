<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/31/2023
  Time: 12:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<form:form action="/nhan-vien/update-nhan-vien/${nhanVien.id}" method="post" modelAttribute="nhanVien">
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
            <form:label path="gioiTinh"><b>Giới Tính:</b></form:label>
            <form:radiobutton path="gioiTinh" value="Nam" label="Nam"></form:radiobutton>
            <form:radiobutton path="gioiTinh" value="Nữ" label="Nữ"></form:radiobutton>

        </div>
        <div class="col">
            <form:label path="ngaySinh"><b>Ngày Sinh:</b></form:label>
            <form:input path="ngaySinh" class="form-control" type="date"></form:input>
        </div
        <div class="col">
            <form:label path="diaChi"><b>Địa Chỉ:</b></form:label>
            <form:input path="diaChi" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="sdt"><b>SĐT:</b></form:label>
            <form:input path="sdt" class="form-control"></form:input>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <form:label path="matKhau"><b>Mật Khẩu:</b></form:label>
            <form:input path="matKhau" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="cuaHang"><b>Cửa Hàng:</b></form:label>
            <form:select items="${cuaHang}" path="cuaHang" class="form-control" itemLabel="ten" itemValue="id"></form:select>
        </div>
        <div class="col">
            <form:label path="chucVu"><b>Chức Vụ:</b></form:label>
            <form:select items="${chucVu}" path="chucVu" class="form-control"   itemLabel="ten" itemValue="id"></form:select>
        </div>
        <div>
            <button type="submit" class="btn btn-primary">SAVE</button>
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
