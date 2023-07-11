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
<h3 style="color: red; text-align: center" ><b>Nhân Viên</b></h3>
<hr>

<a href="/home/hien-thi" class="btn btn-outline-primary" tabindex="-1"
   role="button" style="float: right; margin-bottom: 10px" >Quay về trang chủ</a>
<form:form action="/nhan-vien/add-nhan-vien" method="post" modelAttribute="nhanVien">
    <div class="row">
        <div class="col">
            <form:label path="ma"><b>Mã:</b></form:label>
            <form:input path="ma" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="ho"><b>Họ:</b></form:label>
            <form:input path="ho" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="tenDem"><b>Tên Đệm:</b></form:label>
            <form:input path="tenDem" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="ten"><b>Tên:</b></form:label>
            <form:input path="ten" class="form-control"></form:input>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <form:label path="gioiTinh"><b>Giới Tính:</b></form:label>
                <form:radiobutton path="gioiTinh" value="Nam" label="Nam"></form:radiobutton>
                <form:radiobutton path="gioiTinh" value="Nữ" label="Nữ"></form:radiobutton>

        </div>
        <div class="col">
            <form:label path="ngaySinh"><b>Ngày Sinh:</b></form:label>
            <form:input path="ngaySinh" class="form-control" type="date"></form:input>
        </div
        <div class="col">
            <form:label path="diaChi"><b>Địa Chỉ:</b></form:label>
            <form:input path="diaChi" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="sdt"><b>SĐT:</b></form:label>
            <form:input path="sdt" class="form-control"></form:input>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <form:label path="matKhau"><b>Mật Khẩu:</b></form:label>
            <form:input path="matKhau" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="cuaHang"><b>Cửa Hàng:</b></form:label>
            <form:select items="${cuaHang}" path="cuaHang" class="form-control" itemLabel="ten" itemValue="id"></form:select>
        </div>
        <div class="col">
            <form:label path="chucVu"><b>Chức Vụ:</b></form:label>
            <form:select items="${chucVu}" path="chucVu" class="form-control"   itemLabel="ten" itemValue="id"></form:select>
        </div>
        <div>
            <button type="submit" class="btn btn-primary">ADD</button>
        </div>
    </div>
</form:form>
<form action="">
    <table class="table table-bordered border-dark">
        <tr style="text-align: center">
            <th scope="col">ID</th>
            <th scope="col">Mã</th>
            <th scope="col">Họ</th>
            <th scope="col">Tên Đệm</th>
            <th scope="col">Tên</th>
            <th scope="col">Giới Tính</th>
            <th scope="col">Ngày Sinh</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">SĐT</th>
            <th scope="col">Mật khẩu</th>
            <th scope="col">Cửa hàng</th>
            <th scope="col">Chức vụ</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Action</th>
        </tr>
        <c:forEach items="${list}" var="nv">
            <tr>
                <td>${nv.id}</td>
                <td>${nv.ma}</td>
                <td>${nv.ho}</td>
                <td>${nv.tenDem}</td>
                <td>${nv.ten}</td>
                <td>${nv.gioiTinh}</td>
                <td>${nv.ngaySinh}</td>
                <td>${nv.diaChi}</td>
                <td>${nv.sdt}</td>
                <td>${nv.matKhau}</td>
                <td>${nv.chucVu.ten}</td>
                <td>${nv.cuaHang.ten}</td>
                <td>${nv.trangThai}</td>
                <td>
                    <a href="/nhan-vien/detail-nhan-vien/${nv.id}" class="btn btn-outline-primary" tabindex="-1"
                       role="button">Detail</a>
                    <a href="/nhan-vien/remove-nhan-vien/${nv.id}" class="btn btn-outline-primary" tabindex="-1"
                       role="button" >Delete</a>
                    <a href="/nhan-vien/view-update-nhan-vien/${nv.id}" class="btn btn-outline-primary"
                       tabindex="-1" role="button">Update</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/nhan-vien/hien-thi?pageNum=0">First</a></li>
        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="${pageContext.request.contextPath}/nhan-vien/hien-thi?pageNum=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>
        <li class="page-item"><a class="page-link" href="/nhan-vien/hien-thi?pageNum=${total-1}">Last</a></li>
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