<%-- 
    Document   : list
    Created on : Jun 14, 2026, 10:13:19 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Danh sách thành viên cư dân</h2>
    <a href="${pageContext.request.contextPath}/residents/add" class="btn btn-success">+ Thêm mới</a>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>ID</th>
            <th>Mã hộ dân</th>
            <th>Họ và tên</th>
            <th>Ngày sinh</th>
            <th>Giới tính</th>
            <th>Quan hệ với chủ hộ</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${residents}">
        <tr>
            <td>${r.residentID}</td>
            <td>${r.householdID}</td>
            <td>${r.fullName}</td>
            <td>${r.dateOfBirth}</td>
            <td>${r.gender}</td>
            <td>${r.relationship}</td>
            <td>
                <a href="${pageContext.request.contextPath}/residents/edit/${r.residentID}" 
                   class="btn btn-sm btn-primary">Sửa</a>
                <a href="${pageContext.request.contextPath}/residents/delete/${r.residentID}" 
                   class="btn btn-sm btn-danger" 
                   onclick="return confirm('Bạn chắc chắn muốn xóa thành viên này?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</tbody>
</table>
