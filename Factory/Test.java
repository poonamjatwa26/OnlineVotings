package Factory;

import Model.Register;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Test {

    public static int save(Register obj) throws ClassNotFoundException, SQLException {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        s.save(obj);
        t.commit();
        s.close();
        return i;
    }
    
     public static List<Register> read(){
    
       Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List li = s.createQuery("from Register").list();
        t.commit();
        s.close();
        return li;
    }
     
      public static Register edit(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Register ob = (Register) s.get(Register.class, id);
        t.commit();
        s.close();
        return ob;
    }

    public static int update(Register obj) {
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
        Register ob = (Register) s.get(Register.class, id);
        s.delete(ob);
        t.commit();
        s.close();
        return i;
    }
}
