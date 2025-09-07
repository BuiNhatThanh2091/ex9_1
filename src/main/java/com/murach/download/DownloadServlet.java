package com.murach.download;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class DownloadServlet extends HttpServlet {

    private final Map<String, List<String>> data = new LinkedHashMap<>();

    @Override
    public void init() {
        data.put("86 (the band) - True Life Songs and Pictures",
                List.of("Trust", "The Flight of the Mouse"));
        data.put("Paddlefoot - The First CD",
                List.of("64 Corvair", "Whiskey Before Breakfast"));
        data.put("Paddlefoot - The Second CD",
                List.of("The Mirror", "Dirt Track Date"));
        data.put("Joe Rut - Genuine Wood Grained Finish",
                List.of("Miller Time", "Holes In My Shoes"));
    }

    @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException { route(req, resp); }

    @Override protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException { route(req, resp); }

    private void route(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = Optional.ofNullable(request.getParameter("action")).orElse("viewAlbums");

        switch (action) {
            case "viewAlbums": {
                request.setAttribute("albums", data.keySet());
                forward(request, response, "/albums.jsp");
                break;
            }
            case "viewAlbum": {
                String album = request.getParameter("album");
                if (!data.containsKey(album)) { response.sendRedirect("download?action=viewAlbums"); return; }
                request.setAttribute("album", album);
                request.setAttribute("songs", data.get(album));
                forward(request, response, "/album.jsp");
                break;
            }
            case "showRegister": {
                request.setAttribute("album", request.getParameter("album"));
                request.setAttribute("song",  request.getParameter("song"));
                forward(request, response, "/register.jsp");
                break;
            }
            case "completeRegistration": {
                String first = trim(request.getParameter("firstName"));
                String last  = trim(request.getParameter("lastName"));
                String email = trim(request.getParameter("email"));
                String album = request.getParameter("album");
                String song  = request.getParameter("song");

                Map<String,String> errors = new HashMap<>();
                if (first.isEmpty()) errors.put("firstName", "Bạn chưa nhập First name.");
                if (last.isEmpty())  errors.put("lastName",  "Bạn chưa nhập Last name.");
                if (email.isEmpty()) errors.put("email",     "Bạn chưa nhập Email.");
                else if (!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$"))
                    errors.put("email", "Email chưa đúng định dạng.");

                if (!errors.isEmpty()) {
                    request.setAttribute("errors", errors);
                    request.setAttribute("album", album);
                    request.setAttribute("song", song);
                    forward(request,response,"/register.jsp");
                    return;
                }

                addCookie(response, "firstName", first);
                addCookie(response, "lastName",  last);
                addCookie(response, "email",     email);

                request.setAttribute("userFirst", first);
                request.setAttribute("userLast",  last);
                request.setAttribute("userEmail", email);
                request.setAttribute("album", album);
                request.setAttribute("song",  song);
                request.setAttribute("currentDate", new java.util.Date());

                forward(request, response, "/thanks.jsp");
                break;
            }
            default:
                response.sendRedirect("download?action=viewAlbums");
        }
    }

    private void addCookie(HttpServletResponse resp, String name, String val) {
        Cookie c = new Cookie(name, val);
        c.setPath("/");
        c.setMaxAge(7 * 24 * 60 * 60);
        resp.addCookie(c);
    }
    private static String trim(String s){ return s == null ? "" : s.trim(); }

    private void forward(HttpServletRequest req, HttpServletResponse resp, String view)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher(view).forward(req, resp);
    }
}
