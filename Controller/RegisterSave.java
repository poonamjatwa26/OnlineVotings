package Controller;

import Factory.Test;
import Model.Register;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class RegisterSave extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        Register obj = new Register();
        try {
            String name = req.getParameter("name");
            String dob = req.getParameter("dob");
            String mobile = req.getParameter("mobile");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String voterId = req.getParameter("voterId");
            Part part = req.getPart("photo");
            String address = req.getParameter("address");

            if (name == null || name.trim().isEmpty()
                    || dob == null || dob.trim().isEmpty()
                    || mobile == null || mobile.trim().isEmpty()
                    || email == null || email.trim().isEmpty()
                    || password == null || password.trim().isEmpty()
                    || voterId == null || voterId.trim().isEmpty()
                    || address == null || address.trim().isEmpty()
                    || part == null || part.getSize() == 0) {

                HttpSession session = req.getSession();
                session.setAttribute("message", "Not Registered");
                res.sendRedirect("Register.jsp");
                return;
            }

            obj.setName(name);
            obj.setDob(dob);
            obj.setMobile(mobile);
            obj.setEmail(email);
            obj.setPassword(password);
            obj.setVoterId(voterId);
            obj.setPhoto(part.getSubmittedFileName());
            obj.setAddress(address);

            String uploadPath = "C:/Users/poona/OneDrive/Documents/NetBeansProjects/OnlineVotings/web/Images/" + part.getSubmittedFileName();

            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = part.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

            int i = Test.save(obj);
            HttpSession session = req.getSession();
            if (i == 0) {
                session.setAttribute("message", "Registered Successfully");
            } else {
                session.setAttribute("message", "Not Registered");
            }
            res.sendRedirect("Register.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
