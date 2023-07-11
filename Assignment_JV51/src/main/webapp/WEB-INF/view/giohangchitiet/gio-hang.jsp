<%--
  Created by IntelliJ IDEA.
  User: nguyenvv4
  Date: 22/01/2023
  Time: 11:31
  To change this template use File | Settings | File Templates.
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<table class="table container">
    <thead>
    <tr>
        <td>ID CTSP</td>
        <td>Tên sản phẩm</td>
        <td>Màu sắc</td>
        <td>Số lượng</td>
        <td>Giá bán</td>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${gioHangChiTiet}" var="gh">
        <tr>
            <td>${gh.idCtsp}</td>
            <td>${gh.tenSanPham}</td>
            <td>${gh.tenMau}</td>
            <td>${gh.soLuong}</td>
            <td>${gh.giaBan}</td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
</html>
