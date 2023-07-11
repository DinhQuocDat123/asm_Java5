<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
   <style>
    .black-btn {
    opacity: 0.5; /* giảm độ trong suốt của phần tử */
    pointer-events: none;

    }
    </style>
</head>
<body>
<P STYLE="text-align: center;font-size: 50px">BÁN HÀNG TẠI QUẦY</P>
<br>
<P>Danh sách sản phẩm hóa dơn : ${mhd.ma} -Tình trạng :${mhd.tt()} </P>
<a href="/ban-hang-tai-quay/thanh-toan/${mhd.id}">Thanh Toán</a>

<h5>Danh Sách Sản Phẩm</h5>
<table class="table table-bordered border-dark">
    <tr style="text-align: center">
        <th scope="col">STT</th>
        <th scope="col">Tên</th>
        <th scope="col">Nhà sản xuất</th>
        <th scope="col">Màu sắc</th>
        <th scope="col">Dòng sản phẩm</th>
        <th scope="col">Năm BH</th>
        <th scope="col">Mô tả</th>
        <th scope="col">Số lượng tồn</th>
        <th scope="col">Giá nhập</th>
        <th scope="col">Giá bán</th>
        <th scope="col">Action</th>
    </tr>
    <c:forEach items="${dulieuctsp}" var="ctsp" varStatus="stt">
        <tr>
            <td>${stt.index}</td>
            <td>${ctsp.sanPham.ten}</td>
            <td>${ctsp.nhaSanXuat.ten}</td>
            <td>${ctsp.mauSac.ten}</td>
            <td>${ctsp.dongSanPham.ten}</td>
            <td>${ctsp.namBaoHanh}</td>
            <td>${ctsp.moTa}</td>
            <td>${ctsp.soLuongTon}</td>
            <td>${ctsp.giaNhap}</td>
            <td>${ctsp.giaBan}</td>

            <form action="/ban-hang-tai-quay/themspgh" method="post">
                <td>
                    <input type="number" value="" id="onhap" name="slmua">
                </td>
                <td>
                    <input type="text" value="${idhd}" name="idhd" style="display: none">
                    <input type="text" value="${ctsp.id}" name="idctsp" style="display: none">
                    <input type="text" value="${ctsp.giaBan}" name="dongia" style="display: none">
                    <button class="btn btn-outline-primary" type="submit"> Thêm vào giỏ hàng</button>
                </td>
            </form>
        </tr>
    </c:forEach>
</table>

<h5>Bán Hàng</h5>
<table class="table table-bordered border-dark">
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Mã Hoá Đơn</th>
        <th scope="col">Sản Phẩm</th>
        <th scope="col">Đơn Giá</th>
        <th scope="col">Số Lượng</th>
        <th scope="col">Tổng Tiền</th>
        <th scope="col">Action</th>
    </tr>

    <c:forEach items="${dulieuhdct}" var="ht" varStatus="stt">
        <tr>
        <td>${stt.index}</td>
        <th>${ht.id.hoaDon.ma}</th>
        <th>${ht.id.chiTietSanPham.sanPham.ten}</th>
        <th>${ht.donGia} VND</th>
        <th><input type="number" value="${ht.soLuong}" name="sdcd"></th>
        <th>${ht.donGia*ht.soLuong} VNĐ</th>
        <th>
        <form action="/ban-hang-tai-quay/updatectsp" method="post">
                <input type="text" value="${ht.id.hoaDon.id}" name="idhd" style="display: none">
                <input type="text" value="${ht.id.chiTietSanPham.id}" name="idctsp" style="display: none">
       <button class="btn btn-outline-primary" type="submit">Update</button>
        </form>
        <form action="/ban-hang-tai-quay/removectsp" method="post">
            <input type="text" value="${ht.id.hoaDon.id}" name="idhd" style="display: none">
            <input type="text" value="${ht.id.chiTietSanPham.id}" name="idctsp" style="display: none">
           <button class="btn btn-outline-primary" type="submit">Delete</button>
        </form>
        </th>
        </tr>
    </c:forEach>
</table>

<%--<nav aria-label="Page navigation example">--%>
<%--    <ul class="pagination justify-content-center pagination-lg">--%>
<%--        <li class="page-item"><a class="page-link" href="/chi-tiet-sp/hien-thi?pageNum=0">First</a></li>--%>
<%--        <c:forEach begin="1" end="${total}" varStatus="status">--%>
<%--            <li class="page-item">--%>
<%--                <a href="/chi-tiet-sp/hien-thi?pageNum=${status.index -1}"--%>
<%--                   class="page-link">${status.index}</a>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
<%--        <li class="page-item"><a class="page-link" href="/chi-tiet-sp/hien-thi?pageNum=${total-1}">Last</a></li>--%>
<%--    </ul>--%>
<%--</nav>--%>
<script>
    var tt=${mhd.tinhTrang};
    if( tt != 0){
        var buttons = document.getElementsByTagName('button');
        for (var i = 0; i < buttons.length; i++) {
            buttons[i].classList.add('black-btn');
        }
    }
</script>

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