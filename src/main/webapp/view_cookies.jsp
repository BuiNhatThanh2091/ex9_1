<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><meta charset="UTF-8"><title>Cookies</title></head>
<body style="font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;margin:2rem">
  <h1>Cookies</h1>
  <ul>
    <c:forEach var="e" items="${cookie}">
      <li><b><c:out value="${e.key}"/>:</b> <c:out value="${e.value.value}"/></li>
    </c:forEach>
  </ul>
  <p><a href="download?action=viewAlbums">Back</a></p>
</body>
</html>
