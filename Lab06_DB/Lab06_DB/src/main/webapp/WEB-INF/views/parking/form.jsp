<%-- 
    Document   : form
    Created on : Jun 14, 2026, 10:16:05 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container mt-4">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${parking.parkingID != 0}">
                Edit Parking Spot
            </c:when>
            <c:otherwise>
                Add New Parking Spot
            </c:otherwise>
        </c:choose>
    </h3>

    <form:form modelAttribute="parking" method="post" cssClass="needs-validation">
        <form:hidden path="parkingID" />

        <div class="mb-3">
            <form:label path="parkingNumber" cssClass="form-label">Parking Number</form:label>
            <form:input path="parkingNumber" cssClass="form-control" maxlength="10" required="true"/>
        </div>

        <div class="mb-3">
            <form:label path="vehicleType" cssClass="form-label">Vehicle Type</form:label>
            <form:select path="vehicleType" cssClass="form-select" required="true">
                <form:option value="Car">Car</form:option>
                <form:option value="Motorbike">Motorbike</form:option>
            </form:select>
        </div>

        <div class="mb-3">
            <form:hidden path="status" value="Occupied" />
        </div>

        <div class="mb-3">
            <form:label path="householdID" cssClass="form-label">Assigned Household (Optional)</form:label>
            <form:select path="householdID" cssClass="form-select">
                <form:option value="" label="-- Unassigned / None --"/>
                <c:forEach var="h" items="${households}">
                    <form:option value="${h.householdID}">
                        Household #${h.householdID} (Head: ${h.headOfHousehold})
                    </form:option>
                </c:forEach>
            </form:select>
        </div>

        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${parking.parkingID != 0}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/parking' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>
