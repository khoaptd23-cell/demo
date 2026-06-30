<%-- 
    Document   : form
    Created on : Jun 14, 2026, 10:17:13 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-4">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${fee.feeID != 0}">
                Edit Fee Details
            </c:when>
            <c:otherwise>
                Add New Fee Charge
            </c:otherwise>
        </c:choose>
    </h3>

    <form:form modelAttribute="fee" method="post" cssClass="needs-validation">
        <form:hidden path="feeID" />

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
            <form:label path="feeType" cssClass="form-label">Fee Type</form:label>
            <form:input path="feeType" cssClass="form-control" placeholder="e.g., Management Fee, Water Bill" required="true"/>
        </div>

        <div class="mb-3">
            <form:label path="amount" cssClass="form-label">Amount</form:label>
            <form:input path="amount" type="number" step="0.01" min="0.01" cssClass="form-control" placeholder="0.00" required="true"/>
        </div>

        <div class="mb-3">
            <form:label path="dueDate" cssClass="form-label">Due Date</form:label>
            <form:input path="dueDate" type="date" cssClass="form-control" required="true"/>
        </div>

        <div class="mb-3">
            <form:hidden path="status" value="Unpaid" />
        </div>

        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${fee.feeID != 0}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/fees' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>
