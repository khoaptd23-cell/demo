<%-- 
    Document   : list
    Created on : Jun 14, 2026, 10:12:38 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Danh sách chỗ đỗ xe</h2>
    <a href="${pageContext.request.contextPath}/parking/add" class="btn btn-success">+ Thêm mới</a>
</div>

<table class="table table-bordered table-hover">
    <thead class="table-primary">
        <tr>
            <th>ID</th>
            <th>Mã hộ dân</th>
            <th>Số chỗ đỗ</th>
            <th>Loại xe</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="p" items="${parkings}">
            <tr>
                <td>${p.parkingID}</td>
                <td>
                    <c:choose>
                        <%-- Đã loại bỏ thuộc tính var="hasHousehold" gây lỗi ở đây --%>
                        <c:when test="${p.householdID != null && p.householdID > 0}">
                            ${p.householdID}
                        </c:when>
                        <c:otherwise>
                            <span class="text-muted">Chưa bàn giao</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${p.parkingNumber}</td>
                <td>
                    <c:choose>
                        <c:when test="${p.vehicleType == 'Car'}">Ô tô</c:when>
                        <c:when test="${p.vehicleType == 'Motorbike'}">Xe máy</c:when>
                        <c:otherwise>${p.vehicleType}</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${p.status == 'Occupied'}">
                            <span class="badge bg-danger">Đang sử dụng</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-success">Còn trống</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/parking/edit/${p.parkingID}" 
                       class="btn btn-sm btn-primary">Sửa</a>
                    <a href="${pageContext.request.contextPath}/parking/delete/${p.parkingID}" 
                       class="btn btn-sm btn-danger" 
                       onclick="return confirm('Bạn chắc chắn muốn xóa chỗ đỗ xe này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
