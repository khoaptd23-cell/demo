<%-- 
    Document   : form
    Created on : Jun 14, 2026, 10:15:40 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-4">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${complaint.complaintID != 0}">
                Edit Complaint
            </c:when>
            <c:otherwise>
                Add New Complaint
            </c:otherwise>
        </c:choose>
    </h3>

    <form:form modelAttribute="complaint" method="post" cssClass="needs-validation">
        <form:hidden path="complaintID" />

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
            <form:label path="submissionDate" cssClass="form-label">Submission Date</form:label>
            <form:input path="submissionDate" type="date" cssClass="form-control" required="true"/>
        </div>

        <div class="mb-3">
            <form:hidden path="status" value="Pending" />
        </div>

        <div class="mb-3">
            <form:label path="description" cssClass="form-label">Description</form:label>
            <form:textarea path="description" cssClass="form-control" rows="4" minlength="10" maxlength="1000" required="true"/>
            <div class="form-text">Description must be between 10 and 1000 characters.</div>
        </div>

        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${complaint.complaintID != 0}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/complaints' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>
