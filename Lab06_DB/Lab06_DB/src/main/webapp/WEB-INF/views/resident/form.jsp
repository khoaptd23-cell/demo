<%-- 
    Document   : form
    Created on : Jun 14, 2026, 10:13:49 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-4">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${resident.residentID != 0}">
                Edit Resident
            </c:when>
            <c:otherwise>
                Add New Resident
            </c:otherwise>
        </c:choose>
    </h3>

    <form:form modelAttribute="resident" method="post" cssClass="needs-validation">
        <form:hidden path="residentID" />

        <div class="mb-3">
            <form:label path="householdID" cssClass="form-label">Household</form:label>
            <form:select path="householdID" cssClass="form-select" required="true">
                <form:option value="" label="-- Select Household --"/>
                <c:forEach var="h" items="${households}">
                    <form:option value="${h.householdID}">
                        Household #${h.householdID} (Head: ${h.headOfHousehold})
                    </form:option>
                </c:forEach>
            </form:select>
        </div>

        <div class="mb-3">
            <form:label path="fullName" cssClass="form-label">Full Name</form:label>
            <form:input path="fullName" cssClass="form-control" maxlength="100" required="true"/>
        </div>

        <div class="mb-3">
            <form:label path="dateOfBirth" cssClass="form-label">Date of Birth</form:label>
            <form:input path="dateOfBirth" type="date" cssClass="form-control" required="true"/>
        </div>

        <div class="mb-3">
            <form:label path="gender" cssClass="form-label">Gender</form:label>
            <form:select path="gender" cssClass="form-select" required="true">
                <form:option value="" label="-- Select Gender --"/>
                <form:option value="Nam">Nam</form:option>
                <form:option value="Nữ">Nữ</form:option>
            </form:select>
        </div>

        <div class="mb-3">
            <form:label path="relationship" cssClass="form-label">Relationship with Household Head</form:label>
            <form:input path="relationship" cssClass="form-control" placeholder="e.g., Head, Spouse, Child" maxlength="50" required="true"/>
        </div>

        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${resident.residentID != 0}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/residents' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>
