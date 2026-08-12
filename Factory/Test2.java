
package Factory;

import Model.Vote;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test2 {

    public static int saveVote(Vote obj) {
        int i = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevote", "root", "");
            PreparedStatement ps = con.prepareStatement("INSERT INTO vote(voterId,id) VALUES (?, ?)");
            ps.setString(1, obj.getVoterId());
            ps.setInt(2, obj.getId());
            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static boolean checkVote(String voterId) {
        boolean status = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevote", "root", "");
            PreparedStatement ps = con.prepareStatement("SELECT voterId FROM vote WHERE voterId = ?");
            ps.setString(1, voterId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int getVoteCount(int id) {
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevote", "root", "");
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM vote WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static int getTotalVotes() {
        int total = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevote", "root", "");
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM vote");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }
}
