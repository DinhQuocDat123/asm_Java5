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
<form:form action="/chi-tiet-sp/update-chi-tiet-sp/${chiTiet.id}" method="post" modelAttribute="chiTiet">
<div class="row">
        <%--    <div class="col">--%>
        <%--        <form:label path="ten"><b>Tên:</b></form:label>--%>
        <%--        <form:input path="ten" class="form-control"></form:input>--%>
        <%--    </div>--%>
    <div class="col">
        <form:label path="sanPham"><b>Sản Phẩm:</b></form:label>
        <form:select items="${sanPham}" itemLabel="ten" itemValue="id" path="sanPham" class="form-control">${sanPham.ten}</form:select>
    </div>
    <div class="col">
        <form:label path="nhaSanXuat"><b>Nhà Sản Xuất:</b></form:label>
        <form:select items="${nhaSanXuat}" itemLabel="ten" itemValue="id" path="nhaSanXuat" class="form-control">${nhaSanXuat.ten}</form:select>
    </div>
</div>
<div class="row">
    <div class="col">
        <form:label path="mauSac"><b>Màu Sắc:</b></form:label>
        <form:select items="${mauSac}" itemLabel="ten" itemValue="id" path="mauSac" class="form-control">${mauSac.ten}</form:select>
    </div>
    <div class="col">
        <form:label path="dongSanPham"><b>Dòng Sản Phẩm:</b></form:label>
        <form:select items="${dongSanPham}" itemLabel="ten" itemValue="id" path="dongSanPham" class="form-control">${dongSanPham.ten}</form:select>
    </div>
    <div class="col">
        <form:label path="namBaoHanh"><b>Năm BH:</b></form:label>
        <form:input path="namBaoHanh" class="form-control"></form:input>
    </div>
    <div>
        <div class="row">
            <div class="col">
                <form:label path="moTa"><b>Mô Tả:</b></form:label>
                <form:input path="moTa" class="form-control"></form:input>
            </div>
            <div class="col">
                <form:label path="soLuongTon"><b>Số Lượng Tồn:</b></form:label>
                <form:input path="soLuongTon" class="form-control"></form:input>
            </div>
            <div class="col">
                <form:label path="giaNhap"><b>Giá Nhập:</b></form:label>
                <form:input path="giaNhap" class="form-control"></form:input>
            </div>
            <div class="col">
                <form:label path="giaBan"><b>Giá Bán:</b></form:label>
                <form:input path="giaBan" class="form-control"></form:input>
            </div>
            <div>
                <button type="submit" class="btn btn-primary" >SAVE</button>
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
