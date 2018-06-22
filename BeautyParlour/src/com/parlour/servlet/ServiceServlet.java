package com.parlour.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.google.gson.Gson;
import com.parlour.bean.ServiceBean;
import com.parlour.util.Config;
import com.parlour.util.CurrentDate;

/**
 * Servlet implementation class ServiceServlet
 */
@WebServlet("/ServiceServlet")
public class ServiceServlet extends HttpServlet {
	PrintWriter pw;
	SessionFactory factory;
	Session session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceServlet() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		pw= response.getWriter();
		
		 
		String method=request.getParameter("method");
		if (method.equals("addService")){
			String name = request.getParameter("name");
			double cost = Double.parseDouble(request.getParameter("cost"));
			 session = Config.openSession();
		      Transaction tx = null;
			 try {
		         tx = session.beginTransaction();
		         ServiceBean bean = new ServiceBean();
					bean.setName(name);
					bean.setCost(cost);
					bean.setDate(CurrentDate.dateNow());
					bean.setActive(1);
				
					session.save(bean);
		         
		         tx.commit();
		      } catch (HibernateException e) {
		         if (tx!=null){ 
		        	 tx.rollback();
		         	e.printStackTrace();
		         		}
		         	
		      } finally {
		         Config.closedSession();
		     
		      }
				
		}
		
		else if(method.equals("getAllRecrods"))
		{
			
			 
			session = Config.openSession();
			Transaction tr=session.beginTransaction();
			
			 List<ServiceBean> services = session.createQuery("FROM ServiceBean where active=1").list();
				Gson gson=new Gson();
			 pw.write(gson.toJson(services));
			
			 tr.commit();
			// Config.closedSession();
		//System.out.println(gson.toJson(list));
			
		}
		
		 if(method.equals("getSingleRecord")){
			int id = Integer.parseInt(request.getParameter("id"));
			
			//DBmanager
			 session=Config.openSession();
			session.beginTransaction();
			
			             
			
			 ServiceBean sb = (ServiceBean) session.get(ServiceBean.class, id);
			 ArrayList<ServiceBean>list = new ArrayList<ServiceBean>();
			 list.add(sb);
			 
			
			 Gson gson=new Gson();
		
			 pw.write(gson.toJson(list));
			 
			 session.getTransaction().commit();
			 
			 session.close();	 
			
			
		}
		else if(method.equals("updateRecord")){
			int id = Integer.parseInt(request.getParameter("upid"));
			String name = request.getParameter("name");
			double cost = Double.parseDouble(request.getParameter("cost"));
			 session = Config.openSession();
		      Transaction tx = null;
			 
		         tx = session.beginTransaction();
		         ServiceBean bean = new ServiceBean();
		         	bean.setId(id);
					bean.setName(name);
					bean.setCost(cost);
					bean.setDate(CurrentDate.dateNow());
					bean.setActive(1);
				
					session.update(bean);
		         
		         tx.commit();
		     	
						
		}
		 
		else if(method.equals("deleteRecord")){
			int id = Integer.parseInt(request.getParameter("delid"));
			String name = request.getParameter("name");
			double cost = Double.parseDouble(request.getParameter("cost"));
			 session = Config.openSession();
		      Transaction tx = null;
			 
		         tx = session.beginTransaction();
		         ServiceBean bean = new ServiceBean();
		         	bean.setId(id);
					bean.setName(name);
					bean.setCost(cost);
					bean.setDate(CurrentDate.dateNow());
					bean.setActive(0);
				
					session.update(bean);
		         
		         tx.commit();
	      
			
		} 
	}
	
}
