<%-- 
    Document   : list
    Created on : Jun 14, 2026, 10:12:05 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Danh sách hộ dân</h2>
    <a href="${pageContext.request.contextPath}/households/add" class="btn btn-success">+ Thêm mới</a>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>ID</th>
            <th>ID Căn hộ</th>
            <th>Chủ hộ</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="h" items="${households}">
        <tr>
            <td>${h.householdID}</td>
            <td>${h.apartmentID}</td>
            <td>${h.headOfHousehold}</td>
            <td>${h.contactNumber != null ? h.contactNumber : '---'}</td>
            <td>${h.email != null ? h.email : '---'}</td>
            <td>
                <a href="${pageContext.request.contextPath}/households/edit/${h.householdID}" 
                   class="btn btn-sm btn-primary">Sửa</a>
                <a href="${pageContext.request.contextPath}/households/delete/${h.householdID}" 
                   class="btn btn-sm btn-danger" 
                   onclick="return confirm('Bạn chắc chắn muốn xóa hộ dân này?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</tbody>
</table>