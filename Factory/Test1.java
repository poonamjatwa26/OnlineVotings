package Factory;

import Model.Candidate;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Test1 {

    public static int save(Candidate obj) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        s.save(obj);
        t.commit();
        s.close();
        return i;
    }

    public static List<Candidate> read() {
        Session s = Factory.getSessionFactory().openSession();
        try {
            List<Candidate> list = s.createQuery("from Candidate").list();
            return list;
        } finally {
            s.close();
        }
    }
    
     public static Candidate edit(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
       Candidate ob = (Candidate) s.get(Candidate.class, id);
        t.commit();
        s.close();
        return ob;
    }

    public static int update(Candidate obj) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        s.update(obj);
        t.commit();
        s.close();
        return i;
    }
    
     public static int delete(int id) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Candidate ob = (Candidate) s.get(Candidate.class, id);
        s.delete(ob);
        t.commit();
        s.close();
        return i;
    }
}
