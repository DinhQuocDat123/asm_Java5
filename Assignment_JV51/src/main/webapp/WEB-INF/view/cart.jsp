<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
            integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
            crossorigin="anonymous"></script>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg " style="background-color: #e3f2fd;">
    <div class="container-fluid">
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/home/hien-thi">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/chi-tiet-sp/hien-thi">Chi tiết sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/san-pham/hien-thi">Sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/chuc-vu/hien-thi">Chức vụ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/cua-hang/hien-thi">Cửa hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/dong-san-pham/hien-thi">Dòng sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/khach-hang/hien-thi">Khách hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/nhan-vien/hien-thi">Nhân viên</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/nha-san-xuat/hien-thi">Nhà sản xuất</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/mau-sac/hien-thi">Màu sắc</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/hoa-don/hien-thi">Hoá Đơn</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/hoa-don-chi-tiet/hien-thi">Hoá Đơn Chi Tiết</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/gio-hang/hien-thi">Giỏ Hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/gio-hang-chi-tiet/hien-thi">Giỏ Hàng Chi Tiết</a>
                </li>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item">
                        <a class="bi-cart-fill me-1" aria-current="page" href="/home/cart">Cart</a>
                    </li>
                </ul>
            </ul>
        </div>
        <%--        <span class="navbar-text"> <b>--%>
        <%--      Đinh Quốc Đạt - PH28505</b>--%>
        <%--    </span>--%>
    </div>
</nav>
<br>
<br>
<br>
<h4 style="text-align: center;">Thông tin giỏ hàng</h4>
<br>
<form method="post" action="/home/thanh-toan">
<table class="table table-bordered border-dark">
    <thead>
    <tr>
        <th>Tên Sản Phẩm</th>
        <th>Màu Sắc</th>
        <th>Dòng Sản Phẩm</th>
        <th>Nhà Sản Xuất</th>
        <th>Số Lượng</th>
        <th>Đơn Giá</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <tr ng-repeat="laptop in laptops">

        <c:forEach items="${list}" var="gioHangChiTiet">
    <tr>
        <td>${gioHangChiTiet.ten}</td>
        <td>${gioHangChiTiet.mau}</td>
        <td>${gioHangChiTiet.dong}</td>
        <td>${gioHangChiTiet.nsx}</td>
        <td>${gioHangChiTiet.soLuong}</td>
        <td>${gioHangChiTiet.giaBan}</td>
        <td>
            <a  class="btn btn-outline-primary" href="/home/delete/${gioHangChiTiet.id}">Xóa sản phẩm</a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
    <td colspan="7">
        <button   class="btn btn-outline-primary" type="submit" >Thanh Toán</button>
    </td>
</table>
</form>
</body>
<footer style="height: 50px; background: black ">
    <p style="text-align: center; color: #e3f2fd" >Đinh Quốc Đạt - PH28505</p>
</footer>
</html>