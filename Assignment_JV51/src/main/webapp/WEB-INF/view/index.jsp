<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
<hr>
<c:forEach items="${list}" var="chiTiet">
<div class="card" style="width: 18rem;float: left; margin-left: 80px; margin-bottom: 20px">
    <img class="card-img-top" src="https://picsum.photos/160/180" alt="Card image cap">
    <div class="card-body">
        <h5 class="card-title">${chiTiet.sanPham.ten}</h5>
        <p class="card-text" style="color: red">${chiTiet.giaBan} $</p>
        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
            <form action="index.html">
                <a href="/home/detail-chi-tiet-sp/${chiTiet.id}" class="btn btn-outline-dark mt-auto" style="border: 1px solid #000; width: 40%; float: left;"
                        name="ten" id="ten" type="submit" value="{{laptop.id}}"><i
                        class="bi bi-eye"></i></a>

            </form>
            <a class="btn btn-outline-dark mt-auto" href="/home/add?id=${chiTiet.id}"
               style="border: 1px solid #000; width: 40%;  float: right;"><i class="bi bi-cart-fill"></i></a>
        </div>
    </div>
</div>
</c:forEach>
<section aria-label="Page navigation example" style="margin-top: 1000px">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/chi-tiet-sp/hien-thi?pageNum=0">First</a></li>
        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="/chi-tiet-sp/hien-thi?pageNum=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>
        <li class="page-item"><a class="page-link" href="/chi-tiet-sp/hien-thi?pageNum=${total-1}">Last</a></li>
    </ul>
</section>
<footer style="height: 50px; background: black ">
<p style="text-align: center; color: #e3f2fd" >Đinh Quốc Đạt - PH28505</p>
</footer>
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