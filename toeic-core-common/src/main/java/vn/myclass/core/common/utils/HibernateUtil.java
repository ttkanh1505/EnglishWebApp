package vn.myclass.core.common.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil{
    private static  final SessionFactory sessionFactory = buildSessionFactory();
    private static SessionFactory buildSessionFactory(){
        try {

            // create SessionFactory from hibernate.cfg.xml
            return new Configuration().configure().buildSessionFactory();

        }catch (Throwable ex)
        {
            System.err.print("Error" + ex);
            throw new ExceptionInInitializerError(ex);
           }

    }
    public static SessionFactory getSessionFactory()
    {

        return sessionFactory;
    }

}
