<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8"><title>List of albums</title>
  <style>
    :root{--green:#16a34a;--green-dark:#15803d}
    body{font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;margin:2rem}
    h1{color:var(--green-dark)}
    a{color:#1d4ed8;text-decoration:underline}
  </style>
</head>
<body>
  <h1>List of albums</h1>
  <c:forEach var="a" items="${albums}">
    <div>
      <a href="download?action=viewAlbum&album=${fn:escapeXml(a)}">
        <c:out value="${a}"/>
      </a>
    </div>
  </c:forEach>
</body>
</html>
