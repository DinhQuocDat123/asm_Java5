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

<h3 style="color: red; text-align: center"><b>Hoá Đơn</b></h3>
<hr>


<a href="/home/hien-thi" class="btn btn-outline-primary" tabindex="-1"
   role="button" style="float: right; margin-bottom: 10px">Quay về trang chủ</a>
<form:form action="/hoa-don/add-hoa-don" method="post" modelAttribute="hoaDon">
    <div class="row">
        <div class="col">
            <form:label path="khachHang"><b>Khách Hàng:</b></form:label>
            <form:select path="khachHang" items="${khachHang}" itemLabel="ten" itemValue="id"
                         class="form-control"/>
        </div>
        <div class="col">
            <form:label path="nhanVien"><b>Nhân Viên:</b></form:label>
            <form:select path="nhanVien" items="${nhanVien}" itemLabel="ten" itemValue="id"
                         class="form-control"/>
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
        <div class="col">
            <form:label path="ngayShip"><b>Ngày Ship:</b></form:label>
            <form:input path="ngayShip" class="form-control" type="date"></form:input>
        </div>
        <div class="col">
            <form:label path="ngayNhan"><b>Ngày Nhận:</b></form:label>
            <form:input path="ngayNhan" class="form-control" type="date"></form:input>
        </div>
        <div class="row">

            <div class="col">
                <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                <form:radiobutton path="tinhTrang" value="0" label="Chờ Thanh Toán"/>
                <form:radiobutton path="tinhTrang" value="1" label="Đã Thanh Toán"/>
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

<form action="">
    <table class="table table-bordered border-dark">
        <tr style="text-align: center">
            <th scope="col">ID</th>
            <th scope="col">Khách Hàng</th>
            <th scope="col">Nhân Viên</th>
            <th scope="col">Mã</th>
            <th scope="col">Ngày Tạo</th>
            <th scope="col">Ngày Thanh Toán</th>
            <th scope="col">Ngày Ship</th>
            <th scope="col">Ngày Nhận</th>
            <th scope="col">Tình Trạng</th>
            <th scope="col">Tên Người Nhận</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">SĐT</th>
            <th scope="col">Action</th>
        </tr>
        <c:forEach items="${list}" var="hd">
            <tr>
                <td>${hd.id}</td>
                <td>${hd.khachHang.ten}</td>
                <td>${hd.nhanVien.ten}</td>
                <td>${hd.ma}</td>
                <td>${hd.ngayTao}</td>
                <td>${hd.ngayThanhToan}</td>
                <td>${hd.ngayShip}</td>
                <td>${hd.ngayNhan}</td>
                <td>
                    <c:if test="${hd.tinhTrang ==0}">Chờ Xác Nhận</c:if>
                    <c:if test="${hd.tinhTrang ==1}">Đã Thanh Toán</c:if>
                </td>
                <td>${hd.tenNguoiNhan}</td>
                <td>${hd.diaChi}</td>
                <td>${hd.sdt}</td>
                <td colspan="3">
                    <a href="/hoa-don/trang-thai-0/${hd.id}" class="btn btn-success "
                       tabindex="-1"
                       role="button">Chờ Xác Nhận</a>
                    <a href="/hoa-don/trang-thai-1/${hd.id}" class="btn btn-success "
                       tabindex="-1"
                       role="button">Đã Xác Nhận</a>
                </td>
                <td>
                    <a href="/hoa-don/detail-hoa-don/${hd.id}"
                       class="btn btn-outline-primary" tabindex="-1"
                       role="button">Detail</a>
                    <a href="/hoa-don/remove-hoa-don/${hd.id}"
                       class="btn btn-outline-primary" tabindex="-1"
                       role="button" onclick="return checkRemove() ">Delete</a>
                    <a href="/hoa-don/view-update-hoa-don/${hd.id}"
                       class="btn btn-outline-primary"
                       tabindex="-1" role="button">Update</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/hoa-don/hien-thi?pageNum=0">First</a></li>
        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="${pageContext.request.contextPath}/hoa-don/hien-thi?pageNum=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>
        <li class="page-item"><a class="page-link" href="/hoa-don/hien-thi?pageNum=${total-1}">Last</a></li>
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