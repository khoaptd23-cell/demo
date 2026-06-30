<%-- 
    Document   : form
    Created on : Jun 14, 2026, 10:16:48 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-4">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${household.householdID != 0}">
                Edit Household
            </c:when>
            <c:otherwise>
                Add New Household
            </c:otherwise>
        </c:choose>
    </h3>

    <form:form modelAttribute="household" method="post" cssClass="needs-validation">
        <form:hidden path="householdID" />

        <div class="mb-3">
            <form:label path="apartmentID" cssClass="form-label">Apartment</form:label>
            <form:select path="apartmentID" cssClass="form-select" required="true">
                <form:option value="" label="-- Select Apartment --"/>
                <c:forEach var="a" items="${apartments}">
                    <form:option value="${a.apartmentID}">
                        Room ${a.apartmentNumber} (Floor ${a.floor})
                    </form:option>
                </c:forEach>
            </form:select>
        </div>

        <div class="mb-3">
            <form:label path="headOfHousehold" cssClass="form-label">Head of Household</form:label>
            <form:input path="headOfHousehold" cssClass="form-control" maxlength="100" required="true"/>
        </div>

        <div class="mb-3">
            <form:label path="contactNumber" cssClass="form-label">Contact Number</form:label>
            <form:input path="contactNumber" cssClass="form-control" pattern="\\d{10,15}" placeholder="e.g., 0123456789"/>
            <div class="form-text">Phone number must be between 10 and 15 continuous digits.</div>
        </div>

        <div class="mb-3">
            <form:label path="email" cssClass="form-label">Email Address</form:label>
            <form:input path="email" type="email" cssClass="form-control" placeholder="example@domain.com"/>
        </div>

        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${household.householdID != 0}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/households' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>
