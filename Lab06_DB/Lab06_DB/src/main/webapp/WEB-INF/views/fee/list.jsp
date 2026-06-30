<%-- 
    Document   : list
    Created on : Jun 14, 2026, 10:11:24 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Danh sách khoản phí</h2>
    <a href="${pageContext.request.contextPath}/fees/add" class="btn btn-success">+ Thêm mới</a>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>ID</th>
            <th>Mã hộ dân</th>
            <th>Loại phí</th>
            <th>Số tiền (VNĐ)</th>
            <th>Hạn nộp</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="f" items="${fees}">
            <tr>
                <td>${f.feeID}</td>
                <td>${f.householdID}</td>
                <td>${f.feeType}</td>
                <td>
                    <fmt:formatNumber value="${f.amount}" type="number" maxFractionDigits="2"/>
                </td>
                <td>${f.dueDate}</td>
                <td>
                    <c:choose>
                        <c:when test="${f.status == 'Paid'}">
                            <span class="badge bg-success">Đã nộp</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-danger">Chưa nộp</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/fees/edit/${f.feeID}" 
                       class="btn btn-sm btn-primary">Sửa</a>
                    <a href="${pageContext.request.contextPath}/fees/delete/${f.feeID}" 
                       class="btn btn-sm btn-danger" 
                       onclick="return confirm('Bạn chắc chắn muốn xóa khoản phí này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
