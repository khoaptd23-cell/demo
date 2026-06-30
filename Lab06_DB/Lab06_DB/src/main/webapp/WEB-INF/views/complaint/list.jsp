<%-- 
    Document   : list
    Created on : Jun 14, 2026, 10:10:36 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Danh sách khiếu nại</h2>
    <a href="${pageContext.request.contextPath}/complaints/add" class="btn btn-success">+ Thêm mới</a>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>ID</th>
            <th>Mã hộ dân</th>
            <th>Nội dung khiếu nại</th>
            <th>Ngày gửi</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="c" items="${complaints}">
            <tr>
                <td>${c.complaintID}</td>
                <td>${c.householdID}</td>
                <td>${c.description}</td>
                <td>${c.submissionDate}</td>
                <td>
                    <c:choose>
                        <c:when test="${c.status == 'Pending'}">
                            <span class="badge bg-secondary">Chờ xử lý</span>
                        </c:when>
                        <c:when test="${c.status == 'In Progress'}">
                            <span class="badge bg-warning text-dark">Đang xử lý</span>
                        </c:when>
                        <c:when test="${c.status == 'Resolved'}">
                            <span class="badge bg-success">Đã giải quyết</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-info text-dark">${c.status}</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/complaints/edit/${c.complaintID}" 
                       class="btn btn-sm btn-primary">Sửa</a>
                    <a href="${pageContext.request.contextPath}/complaints/delete/${c.complaintID}" 
                       class="btn btn-sm btn-danger" 
                       onclick="return confirm('Bạn chắc chắn muốn xóa khiếu nại này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
