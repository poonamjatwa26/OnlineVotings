package Controller;

import Factory.Test1;
import Factory.Test2;
import Model.Vote;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VoteCandidate")
public class VoteCandidate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String voterId =(String) session.getAttribute("voterId");
        String candidateId =request.getParameter("id");
        if (voterId == null || voterId.trim().isEmpty()) {

            response.sendRedirect("login.jsp");
            return;
        }

        if (candidateId == null ||
                candidateId.trim().isEmpty()) {

            response.sendRedirect(
                    "StartVoting.jsp?msg=invalid"
            );
            return;
        }

        try {
            int cid = Integer.parseInt(candidateId);
            boolean alreadyVoted =
                    Test2.checkVote(voterId);
            if (alreadyVoted) {
                response.sendRedirect(
                        "StartVoting.jsp?msg=alreadyVoted"
                );

                return;
            }
            Vote vote = new Vote();

            vote.setVoterId(voterId);
            vote.setId(cid);
            int i = Test2.saveVote(vote);
            if (i > 0) {
                response.sendRedirect(
                        "StartVoting.jsp?msg=success"
                );
            } else {
                response.sendRedirect(
                        "StartVoting.jsp?msg=error"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(
                    "StartVoting.jsp?msg=error"
            );
        }
    }
}