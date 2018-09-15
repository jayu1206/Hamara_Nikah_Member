package com.softNice.nikah.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.softNice.nikah.beans.memberBean;
import com.softNice.nikah.constent.contentPage;
import com.softNice.nikah.maintenance.memberMaintenance;

/**
 * Servlet implementation class contentMemberServlet
 */
public class contentMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contentMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String key=request.getParameter("key");
		RequestDispatcher rd = null;
		if(key!=null){
				if(key.equals("requesInterestedList")){
					 memberBean bean=new memberBean();
						if(request.getSession().getAttribute(contentPage.USERSOBJ)!=null){
							bean = (memberBean)request.getSession().getAttribute(contentPage.USERSOBJ);
						}
					
					memberMaintenance.getInstance().getRequestInterestedMembersList(request,bean.getId());
					//request.setAttribute(contentPage.CONTENT_PAGE, "");
					rd=request.getRequestDispatcher("/member/interestedList.jsp");  
					rd.forward(request, response); 
					
				}
			
			
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String key = request.getParameter("key");
		
		if(key!=null){
			if(key.equals("message")){
				
				System.out.println("member id : "+request.getParameter("memberId"));
				
			}
			
		}
	}

}
