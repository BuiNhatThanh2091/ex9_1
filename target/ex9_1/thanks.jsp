<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thanks</title>
  <style>
    :root{--green:#16a34a;--green-dark:#15803d}
    body{font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;margin:2rem}
    h1{color:var(--green-dark)}
  </style>
</head>
<body>
  <h1>Thanks for joining</h1>

  <p><b>Email:</b> <c:out value="${userEmail}"/></p>
  <p><b>First Name:</b> <c:out value="${userFirst}"/></p>
  <p><b>Last Name:</b> <c:out value="${userLast}"/></p>

  <h3>Download:</h3>
  <p><b>Album:</b> <c:out value="${album}"/></p>
  <p><b>Song:</b>  <c:out value="${song}"/></p>

  <p><b>Date:</b> ${currentDate}</p>

  <p><a href="download?action=viewAlbums">Back to albums</a></p>
</body>
</html>
