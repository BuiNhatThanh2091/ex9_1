<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <style>
    :root{--green:#16a34a;--green-dark:#15803d;--red:#dc2626}
    body{font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;margin:2rem}
    h1{color:var(--green-dark)}
    form{max-width:520px;padding:1.1rem;border:1px solid #e5e7eb;border-radius:12px;background:#f9fafb}
    .field{margin-bottom:1rem}
    label{display:block;font-weight:600;color:var(--green-dark);margin-bottom:.35rem}
    input{width:100%;padding:.6rem .8rem;border:1px solid #cbd5e1;border-radius:8px}
    input:focus{border-color:var(--green);box-shadow:0 0 0 3px #16a34a22;outline:none}
    .error{color:var(--red);font-size:.9rem;margin-top:.25rem}
    .actions{display:flex;gap:.6rem;align-items:center}
    .btn{background:var(--green);color:#fff;border:0;padding:.55rem .9rem;border-radius:8px;cursor:pointer}
    .btn:hover{background:var(--green-dark)}
  </style>
</head>
<body>
  <h1>Register</h1>
  <form action="download" method="post" novalidate>
    <input type="hidden" name="action" value="completeRegistration">
    <input type="hidden" name="album"  value="${album}">
    <input type="hidden" name="song"   value="${song}">

    <div class="field">
      <label for="firstName">First name</label>
      <input id="firstName" name="firstName" value="${param.firstName}" required>
      <c:if test="${not empty errors.firstName}"><div class="error">${errors.firstName}</div></c:if>
    </div>

    <div class="field">
      <label for="lastName">Last name</label>
      <input id="lastName" name="lastName" value="${param.lastName}" required>
      <c:if test="${not empty errors.lastName}"><div class="error">${errors.lastName}</div></c:if>
    </div>

    <div class="field">
      <label for="email">Email</label>
      <input id="email" name="email" type="email" value="${param.email}" required>
      <c:if test="${not empty errors.email}"><div class="error">${errors.email}</div></c:if>
    </div>

    <div class="actions">
      <button class="btn" type="submit">Save</button>
      <a href="view_cookies.jsp">View cookies</a>
    </div>
  </form>
</body>
</html>
