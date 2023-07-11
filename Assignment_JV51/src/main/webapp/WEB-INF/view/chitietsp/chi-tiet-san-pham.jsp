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

<h3 style="color: red; text-align: center"><b>Chi Tiết Sản Phẩm</b></h3>
<hr>



<a href="/home/hien-thi" class="btn btn-outline-primary" tabindex="-1"
   role="button" style="float: right; margin-bottom: 10px">Quay về trang chủ</a>
<form:form action="/chi-tiet-sp/add-chi-tiet-sp" method="post" modelAttribute="chiTiet">
<div class="row">
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
                <button type="submit" class="btn btn-primary" onclick="return checkAdd()">ADD</button>
            </div>
        </div>
        </form:form>
        <form action="">
            <table class="table table-bordered border-dark">
                <tr style="text-align: center">
                    <th scope="col">ID</th>
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
                <c:forEach items="${list}" var="ctsp">
                    <tr>
                        <td>${ctsp.id}</td>
                        <td>${ctsp.sanPham.ten}</td>
                        <td>${ctsp.nhaSanXuat.ten}</td>
                        <td>${ctsp.mauSac.ten}</td>
                        <td>${ctsp.dongSanPham.ten}</td>
                        <td>${ctsp.namBaoHanh}</td>
                        <td>${ctsp.moTa}</td>
                        <td>${ctsp.soLuongTon}</td>
                        <td>${ctsp.giaNhap}</td>
                        <td>${ctsp.giaBan}</td>
                        <td>
                            <a href="/chi-tiet-sp/detail-chi-tiet-sp/${ctsp.id}"
                               class="btn btn-outline-primary" tabindex="-1"
                               role="button">Detail</a>
                            <a href="/chi-tiet-sp/remove-chi-tiet-sp/${ctsp.id}"
                               class="btn btn-outline-primary" tabindex="-1"
                               role="button" onclick="return checkRemove() ">Delete</a>
                            <a href="/chi-tiet-sp/view-update-chi-tiet-san-pham/${ctsp.id}"
                               class="btn btn-outline-primary"
                               tabindex="-1" role="button">Update</a>
<%--                           <a href="/cart/add?ctspId=${ctsp.id}" class="btn btn-primary">Add giỏ hàng session</a>--%>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
<%--        <a href="/cart/view" class="btn btn-primary"> Xem giỏ hàng session</a>--%>
        <nav aria-label="Page navigation example">
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