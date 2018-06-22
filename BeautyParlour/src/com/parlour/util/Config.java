package com.parlour.util;


import org.hibernate.HibernateException; 
import org.hibernate.Session; 
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
public class Config {
	private static SessionFactory factory;
	private static Session session;
	
static {
	try {
        factory = new Configuration().configure("com/parlour/configuration/hibernate.cfg.xml").buildSessionFactory();
     } catch (Throwable ex) { 
        System.err.println("Failed to create sessionFactory object." + ex);
        throw new ExceptionInInitializerError(ex); 
     }
	
}

public static Session openSession(){
 session = factory.openSession();
 return session;
	
}
public static void closedSession(){
	 session.close();
	
}
public static void closedFactory(){
	 factory.close();
	
}

}
