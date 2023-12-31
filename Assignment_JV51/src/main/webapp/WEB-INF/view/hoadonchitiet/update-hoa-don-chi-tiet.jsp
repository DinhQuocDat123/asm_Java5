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
<form:form action="/hoa-don-chi-tiet/update-hoa-don-chi-tiet/${hoaDonChiTiet.id.hoaDon.id}/${hoaDonChiTiet.id.chiTietSanPham.id}" method="post" modelAttribute="hoaDonChiTiet">

    <div class="row">
        <div class="col">
            <form:label path="id.hoaDon"><b>Hoá Đơn:</b></form:label>
            <form:select path="id.hoaDon" items="${hoaDon}" itemLabel="ma"
                         itemValue="id"/>
        </div>
        <div class="col">
            <form:label path="id.chiTietSanPham"><b>Sản Phẩm:</b></form:label>
            <form:select path="id.chiTietSanPham" items="${chiTietSanPham}" itemLabel="sanPham.ten"
                         itemValue="id"/>
        </div>
        <div class="col">
            <form:label path="soLuong"><b>Số Lượng:</b></form:label>
            <form:input path="soLuong" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="donGia"><b>Đơn Giá:</b></form:label>
            <form:input path="donGia" class="form-control"></form:input>
        </div>

        <div>
            <button type="submit" class="btn btn-primary">Save</button>
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
