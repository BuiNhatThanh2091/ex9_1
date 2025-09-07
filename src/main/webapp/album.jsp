<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>List of albums</title>
  <style>
    :root{--green:#16a34a;--green-dark:#15803d}
    body{font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;margin:2rem}
    h1{color:var(--green-dark)}
    ul{line-height:1.9}
    a{color:var(--green-dark);text-decoration:none}
    a:hover{text-decoration:underline}
  </style>
</head>
<body>
  <h1>List of albums</h1>

  <c:if test="${empty albums}">
    <p>Không có album nào.</p>
  </c:if>

  <c:if test="${not empty albums}">
    <ul>
      <c:forEach var="alb" items="${albums}">
        <li>
          <a href="download?action=viewAlbum&amp;album=${fn:escapeXml(alb)}">${alb}</a>
        </li>
      </c:forEach>
    </ul>
  </c:if>

  <%-- JSTL functions (cho fn:escapeXml). Nếu không dùng thì bỏ fn. --%>
  <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
</body>
</html>
