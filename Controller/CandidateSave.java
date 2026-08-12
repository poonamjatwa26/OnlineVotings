package Controller;

import Factory.Test;
import Factory.Test1;
import Model.Candidate;
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
public class CandidateSave extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        Candidate obj = new Candidate();
        try {
            String name = req.getParameter("name");
            String age = req.getParameter("age");
            String gender = req.getParameter("gender");
            String mobile = req.getParameter("mobile");
            String email = req.getParameter("email");
            String party = req.getParameter("party");
            Part symbol = req.getPart("symbol");
            Part part = req.getPart("photo");
            String address = req.getParameter("address");

            if (name == null || name.trim().isEmpty()
                    || req.getParameter("age") == null || req.getParameter("age").trim().isEmpty()
                    || gender == null || gender.trim().isEmpty()
                    || mobile == null || mobile.trim().isEmpty()
                    || email == null || email.trim().isEmpty()
                    || party == null || party.trim().isEmpty()
                    || address == null || address.trim().isEmpty()
                    || symbol == null || symbol.getSize() == 0
                    || part == null || part.getSize() == 0) {

                HttpSession session = req.getSession();
                session.setAttribute("message", "Candidate Not Added");
                res.sendRedirect("Candidate.jsp");
                return;
            }

            obj.setName(name);
            int age1 = Integer.parseInt(age);
            obj.setAge(age1);
            obj.setGender(gender);
            obj.setMobile(mobile);
            obj.setEmail(email);
            obj.setParty(party);
            obj.setSymbol(symbol.getSubmittedFileName());
            obj.setPhoto(part.getSubmittedFileName());
            obj.setAddress(address);

            String uploadPath = "C:/Users/poona/OneDrive/Documents/NetBeansProjects/OnlineVotings/web/Images/" + part.getSubmittedFileName();

            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = part.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

            String uploadPath1 = "C:/Users/poona/OneDrive/Documents/NetBeansProjects/OnlineVotings/web/Images/" + symbol.getSubmittedFileName();

            FileOutputStream fos1 = new FileOutputStream(uploadPath1);
            InputStream is1 = symbol.getInputStream();
            byte[] data1 = new byte[is1.available()];
            is1.read(data1);
            fos1.write(data1);
            fos1.close();

            int i = Test1.save(obj);
            HttpSession session = req.getSession();
            if (i == 0) {
                session.setAttribute("message", "Candidate Added Successfully");
            } else {
                session.setAttribute("message", "Candidate Not Added");
            }
            res.sendRedirect("Candidate.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
