<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../dynamic/header.jspf"%>

<!-- Page Content-->
<div class="container px-4 px-lg-5">
    <!-- Call to Action-->
    <div class="card-header2"  style="color: red; text-align: center">Gratulację! Zostałeś zapisany na wydarzenie.</div>
    <div class="card text-white bg-secondary my-5 py-4 text-center">
        <div class="card-body"><a class="btn btn-primary" href='<c:url value="/addEvent"/>'>DODAJ NOWE WYDARZENIE!</a></div>
    </div>
    <!-- Heading Row-->
    <c:forEach items="${eventModel}" var="event">
        <div class="row gx-4 gx-lg-5 align-items-center my-5">
            <a class="btn btn-primary" href='<c:url value="/editEvent/${event.id}"/>'>Edytuj</a>

            <div class="col-lg-6"><img src="data:image/*;base64,${event.picture}" width="550" height="350" float="right"/></div>

            <div class="col-lg-6">
                <h1 class="font-weight-light">${event.title}</h1>
                <p>${event.description}</p>
                <p>Data wydarzenia: ${event.eventDate}</p>
                <p>Ilość dostępnych miejsc: ${event.numberOfSlots}</p>
                <security:authorize access="hasAnyRole('ADMIN')">
                    <a class="btn btn-primary" href='<c:url value="/editEvent/${event.id}"/>'>Edytuj</a>
                    <a class="btn btn-danger" href='<c:url value="/deleteEvent/${event.id}"/>'>Usuń</a>
                </security:authorize>
                <security:authorize access="hasAnyRole('USER')">
                    <a class="btn btn-success" href=''>Zapisz się</a>
                    <a class="btn btn-secondary" href=''>Skomentuj</a>
                </security:authorize>
            </div>
        </div>
    </c:forEach>
</div>

<%--        <!-- Footer-->--%>
<%@include file="../dynamic/footer.jspf"%>

<%--        <!-- Bootstrap core JS-->--%>
<%--        <!-- Core theme JS-->--%>
<%@include file="../dynamic/javaScript.jspf"%>

