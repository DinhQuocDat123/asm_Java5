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

<h3 style="color: red; text-align: center"><b>Giỏ Hàng Chi Tiết</b></h3>
<hr>
<a href="/home/hien-thi" class="btn btn-outline-primary" tabindex="-1"
   role="button" style="float: right; margin-bottom: 10px">Quay về trang chủ</a>
<form:form action="/gio-hang-chi-tiet/add-gio-hang-chi-tiet" method="post" modelAttribute="gioHangChiTiet">

    <div class="row">
        <div class="col">
            <form:label path="id.gioHang"><b>Giỏ Hàng:</b></form:label>
            <form:select path="id.gioHang" items="${gioHang}" itemLabel="ma"
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
        <div class="row">

            <div class="col">
                <form:label path="donGiaKhiGiam"><b>Đơn giá khi giảm:</b></form:label>
                <form:input path="donGiaKhiGiam" class="form-control"></form:input>
            </div>
        </div>

        <div>
            <button type="submit" class="btn btn-primary">Save</button>
        </div>

    </div>
</form:form>
<form action="">
    <table class="table table-bordered border-dark">
        <tr style="text-align: center">
            <th scope="col">Mã</th>
            <th scope="col">Tên Sản Phẩm</th>
            <th scope="col">Số Lượng</th>
            <th scope="col">Đơn Giá</th>
            <th scope="col">Đơn Giá Khi Giảm</th>
            <th scope="col">Action</th>
        </tr>
        <c:forEach items="${list}" var="ghct">
            <tr>
                <td>${ghct.id.gioHang.ma}</td>
                <td>${ghct.id.chiTietSanPham.sanPham.ten}</td>
                <td>${ghct.soLuong}</td>
                <td>${ghct.donGia}</td>
                <td>${ghct.donGiaKhiGiam}</td>
                <td>
                    <a href="/gio-hang-chi-tiet/detail-gio-hang-chi-tiet/${ghct.id.gioHang.id}/${ghct.id.chiTietSanPham.id}"
                       class="btn btn-outline-primary" tabindex="-1"
                       role="button">Detail</a>
                    <a href="/gio-hang-chi-tiet/remove-gio-hang-chi-tiet/${ghct.id.gioHang.id}/${ghct.id.chiTietSanPham.id}"
                       class="btn btn-outline-primary" tabindex="-1"
                       role="button">Delete</a>
                    <a href="/gio-hang-chi-tiet/view-update-gio-hang-chi-tiet/${ghct.id.gioHang.id}/${ghct.id.chiTietSanPham.id}"
                       class="btn btn-outline-primary"
                       tabindex="-1" role="button">Update</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/gio-hang-chi-tiet/hien-thi?pageNum=0">First</a></li>
        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="${pageContext.request.contextPath}/gio-hang-chi-tiet/hien-thi?pageNum=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>
        <li class="page-item"><a class="page-link" href="/gio-hang-chi-tiet/hien-thi?pageNum=${total-1}">Last</a></li>
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