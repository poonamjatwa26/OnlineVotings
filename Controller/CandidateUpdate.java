package Controller;

import Factory.Test1;
import Model.Candidate;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/CandidateUpdate")
@MultipartConfig
public class CandidateUpdate extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String party = request.getParameter("party");
        String address = request.getParameter("address");

        String oldPhoto = request.getParameter("oldphoto");
        String oldSymbol = request.getParameter("oldsymbol");

        Part photoPart = request.getPart("photo");
        Part symbolPart = request.getPart("symbol");

        String photo = oldPhoto;
        String symbol = oldSymbol;

        String fileName = photoPart.getSubmittedFileName();

        if (fileName == null || fileName.trim().isEmpty()) {

            fileName = oldPhoto;

        } else {

            String uploadPath
                    = "C:/Users/poona/OneDrive/Documents/NetBeansProjects/OnlineVotings/web/Images/" + fileName;

            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = photoPart.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);

            fos.write(data);
            fos.close();
            is.close();

            photo = fileName;
        }

        String symbolFileName = symbolPart.getSubmittedFileName();

        if (symbolFileName == null || symbolFileName.trim().isEmpty()) {

            symbolFileName = oldSymbol;

        } else {

            String uploadPath1
                    = "C:/Users/poona/OneDrive/Documents/NetBeansProjects/OnlineVotings/web/Images/" + symbolFileName;

            FileOutputStream fos1 = new FileOutputStream(uploadPath1);
            InputStream is1 = symbolPart.getInputStream();

            byte[] data1 = new byte[is1.available()];
            is1.read(data1);

            fos1.write(data1);
            fos1.close();
            is1.close();

            symbol = symbolFileName;
        }

        Candidate ob = new Candidate();

        ob.setId(Integer.parseInt(id));
        ob.setName(name);
        ob.setAge(Integer.parseInt(age));
        ob.setGender(gender);
        ob.setMobile(mobile);
        ob.setEmail(email);
        ob.setParty(party);
        ob.setAddress(address);
        ob.setPhoto(photo);
        ob.setSymbol(symbol);

        int i = Test1.update(ob);

        if (i == 0) {

            out.println("<html>");
            out.println("<head>");
            out.println("<style>");
            out.println("body{"
                    + "background:linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);"
                    + "font-family:Arial;"
                    + "text-align:center;"
                    + "padding-top:70px;"
                    + "min-height:100vh;"
                    + "}");
            out.println(".card{"
                    + "background:white;"
                    + "width:320px;"
                    + "margin:auto;"
                    + "padding:22px;"
                    + "border-radius:16px;"
                    + "box-shadow:0 8px 25px rgba(0,0,0,.20);"
                    + "}");
            out.println("h2{color:#0d6efd;font-size:20px;}");
            out.println("p{color:#555;font-size:14px;}");
            out.println("a{"
                    + "background:linear-gradient(90deg,#0d6efd,#0b5ed7);"
                    + "color:white;"
                    + "padding:9px 20px;"
                    + "text-decoration:none;"
                    + "border-radius:20px;"
                    + "display:inline-block;"
                    + "font-size:14px;"
                    + "font-weight:bold;"
                    + "}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<div class='card'>");
            out.println("<h2>Candidate Updated Successfully!</h2>");
            out.println("<p>Your candidate details have been updated successfully.</p>");
            out.println("<a href='CandidateList.jsp'>View Candidates</a>");
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");

        } else {

            out.println("<html>");
            out.println("<head>");
            out.println("<style>");
            out.println("body{"
                    + "background:linear-gradient(135deg,#E3F2FD,#BBDEFB,#90CAF9);"
                    + "font-family:Arial;"
                    + "text-align:center;"
                    + "padding-top:70px;"
                    + "min-height:100vh;"
                    + "}");
            out.println(".card{"
                    + "background:white;"
                    + "width:320px;"
                    + "margin:auto;"
                    + "padding:22px;"
                    + "border-radius:16px;"
                    + "box-shadow:0 8px 25px rgba(0,0,0,.20);"
                    + "}");
            out.println("h2{color:#0d6efd;font-size:20px;}");
            out.println("p{color:#555;font-size:14px;}");
            out.println("a{"
                    + "background:#0d6efd;"
                    + "color:white;"
                    + "padding:9px 20px;"
                    + "text-decoration:none;"
                    + "border-radius:20px;"
                    + "display:inline-block;"
                    + "font-size:14px;"
                    + "font-weight:bold;"
                    + "}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<div class='card'>");
            out.println("<h2>Candidate Not Updated!</h2>");
            out.println("<p>No changes were made.</p>");
            out.println("<a href='CandidateList.jsp'>View Candidates</a>");
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");
        }
    }
}
