<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    </div>
</nav>

<Section class="py-1">
    <div class="pd-wrap">
        <div class="container">
            <form action="/home/add-detail/${chiTiet.id}" method="post">
                <div>
                    <h2><b> Thông tin sản phẩm</b></h2>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-3">
                        <div class="item">
                            <img src="https://picsum.photos/200/300"/>
                        </div>
                        <br>

                        <div class="row">
                            <div class="col-md-12">
                                <label><b style="color: red">Giá : ${chiTiet.giaBan}$ </b></label>
<%--                                <div class="product-price-discount"><span--%>
<%--                                        style="text-decoration: black;color: #ff0000"><span--%>
<%--                                        class="woocommerce-Price-currencySymbol">$</span></bdi></span></del></span>--%>
<%--                                </div>--%>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-outline-primary">Thêm Vào Giỏ Hàng</button></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="product-dtl">
                            <div class="product-info">
                                <div class="product-name"><b>Sản phẩm:</b><i> ${chiTiet.sanPham.ten}</i></div>
                                <hr>
                            </div>
                            <div>
                                <div class="product-name" ><b><h5>Thông tin chi tiết</h5></b></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-4">
                                    <label><b>Màu Sắc : </b></label>
                                    <p style="color: red">${chiTiet.mauSac.ten}</p>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
                                    <label><b>Dòng Sản Phẩm : </b></label>
                                    <p style="color: red">${chiTiet.dongSanPham.ten}</p>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
                                    <label><b>Hãng : </b></label>
                                    <p style="color: red">${chiTiet.nhaSanXuat.ten}</p>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <label><b>Mô Tả Sản Phẩm : </b></label>
                                    <br>
                                    <textarea disabled>${chiTiet.moTa}</textarea>
                                </div>
                            </div>
                            <br>
                            <p class="product-count">
                            <div class="row">
                                <div class="col-md-12">
                                    <label><b>Số Lượng : </b></label>
                                </div>
                                <br>
                                <div style="display: flex" class="col-md-10">
<%--                                    <div id="qtyminus" class="col-md-1"><input type="button" value="-"></div>--%>
                                    <div class="col-md-3"><input type="number" name="soLuong" value="1" id="qty"></div>
<%--                                    <div id="qtyplus" class="col-md-5"><input type="button" value="+"></div>--%>
                                </div>
                            </div>
                            <br>

                        </div>
                    </div>
                </div>
            </form>
        </div>
        <br>
    </div>
    </div>
</Section>
</body>
<footer style="height: 50px; background: black ">
    <p style="text-align: center; color: #e3f2fd" >Đinh Quốc Đạt - PH28505</p>
</footer>
<script>
    $("#qtyminus").on("click", function () {
        var now = $("#qty").val();
        if ($.isNumeric(now)) {
            if (parseInt(now) - 1 > 0) {
                now--;
            }
            $("#qty").val(now);
        }
    })
    $("#qtyplus").on("click", function () {
        var now = $("#qty").val();
        if ($.isNumeric(now)) {
            $("#qty").val(parseInt(now) + 1);
        }
    });
</script>
</html>