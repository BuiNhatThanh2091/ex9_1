<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:redirect url="download?action=viewAlbums"/>
<!DOCTYPE html>
<html lang="vi">
<head><meta charset="UTF-8"><title>Download App – Home</title></head>
<body>
  <!-- Chỉ hiện welcome khi cookie firstName có giá trị -->
  <c:if test="${not empty cookie.firstName.value}">
    <h1>Welcome, <c:out value='${cookie.firstName.value}'/></h1>
  </c:if>

  <h2>Register</h2>
  <form action="register" method="post">
    <label>First name</label>
    <input name="firstName" required>
    <label>Last name</label>
    <input name="lastName" required>
    <label>Email</label>
    <input name="email" type="email" required>
    <button type="submit">Save</button>
    <a href="view_cookies.jsp">View cookies</a>
  </form>
</body>
</html>
