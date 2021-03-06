package com.softNice.nikah.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.softNice.nikah.beans.generalSettingBean;
import com.softNice.nikah.beans.memberBean;
import com.softNice.nikah.beans.memberStoryBean;
import com.softNice.nikah.beans.permissionBean;
import com.softNice.nikah.beans.roleBean;
import com.softNice.nikah.constent.ErrorMsg;
import com.softNice.nikah.constent.contentPage;
import com.softNice.nikah.maintenance.adminMaintenance;
import com.softNice.nikah.maintenance.memberMaintenance;
import com.softNice.nikah.maintenance.roleMaintenance;
import com.softNice.nikah.maintenance.settingMaintenance;
import com.softNice.nikah.utility.validation;

/**
 * Servlet implementation class memberServlet
 */
public class memberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		if(request.getParameter("key")!=null){
			
			if(request.getParameter("key").equals("logout")){
				request.getSession().invalidate();
				rd=request.getRequestDispatcher("/MemberLogin.jsp");  
				rd.forward(request, response); 
				
			}
			if(request.getParameter("key").equals("register")){
				adminMaintenance.getInstance().getAllCountry(request);
				request.getSession().setAttribute(contentPage.SETTING, getServletContext().getAttribute(contentPage.SETTING));
				rd=request.getRequestDispatcher("/registration.jsp");  
				rd.forward(request, response);
				
			}
			if(request.getParameter("key").equals("uploadPhotos")){	
				
				memberBean bean= new memberBean();
				if(request.getSession().getAttribute(contentPage.USERSOBJ)!=null){
					bean = (memberBean)request.getSession().getAttribute(contentPage.USERSOBJ);
				}
				
				List<String> results = new ArrayList<String>();
				String path = getServletContext().getRealPath("/") + File.separator;
				String mId = bean.getMemberId();
				String finalUrl = path+"galleryImage\\"+mId;
				File[] files = new File(finalUrl).listFiles();
				//If this pathname does not denote a directory, then listFiles() returns null. 
				if (files != null){
					for (File file : files) {
					    if (file.isFile()) {
					        results.add(file.getCanonicalPath());
					    }else if(file.isDirectory()){
					    	File[] infiles = new File(file.getCanonicalPath()).listFiles();
					    	for (File infile : infiles) {
					    		results.add(infile.getCanonicalPath());
					    	}				    	
					    }
					}
				}
				
				request.getSession().setAttribute(contentPage.ImageList,results);
				request.setAttribute(contentPage.CONTENT_PAGE, "/member/memberPhotos.jsp");
				rd=request.getRequestDispatcher("/memberIndex.jsp");  
				rd.forward(request, response); 
			}
			if(request.getParameter("key").equals("deleteImage")){	
				
				String imgDir = getServletContext().getRealPath("/") + File.separator + "galleryImage\\";
				String path = request.getParameter("path");
				String memberId= request.getParameter("memberId");
				String url = imgDir + memberId+ "\\" + path;
				//String url = "D:/Sahil/Project/SoftNice_Hamara_Nikah/SoftNice_Hamara_Nikah/src/main/webapp/galleryImage/03C1397C/IMG-20180119-WA0005.jpg";
				File file = new File(url);
				
				if(file.delete())
		        {
		            System.out.println("File deleted successfully");
		        }
		        else
		        {
		            System.out.println("Failed to delete the file");
		        }
				request.setAttribute(contentPage.CONTENT_PAGE, "/member/memberPhotos.jsp");
				rd=request.getRequestDispatcher("/memberIndex.jsp");  
				rd.forward(request, response); 
			}
			if (request.getParameter("key").equals("memberProfile")){				
				request.setAttribute(contentPage.CONTENT_PAGE, "/member/memberProfile.jsp");
				rd=request.getRequestDispatcher("/memberIndex.jsp");  
				rd.forward(request, response);				
			}
			if (request.getParameter("key").equals("addStory")){
				adminMaintenance.getInstance().getAllCountry(request);
				request.getSession().setAttribute(contentPage.SETTING, getServletContext().getAttribute(contentPage.SETTING));
				rd=request.getRequestDispatcher("/memberStory.jsp");  
				rd.forward(request, response);
			}
			if (request.getParameter("key").equals("viewStory")){				
				
				memberMaintenance.getInstance().getAllStories(request);
				request.getSession().setAttribute(contentPage.STORIES, getServletContext().getAttribute(contentPage.STORIES));
				rd=request.getRequestDispatcher("/viewStories.jsp");  
				rd.forward(request, response);
			}
			
			
			
				
		}else{
			rd=request.getRequestDispatcher("/MemberLogin.jsp");  
			rd.forward(request, response); 
		}
		
	}

	

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		
		if(request.getParameter("key")!=null){
			
			if(request.getParameter("key").equals("register")){
				
				request.getSession().setAttribute(contentPage.SETTING, getServletContext().getAttribute(contentPage.SETTING));
				rd=request.getRequestDispatcher("/registration.jsp");  
				rd.forward(request, response);
				
			}
			if(request.getParameter("key").equals("login")){
				memberBean bean = memberMaintenance.getInstance().authentication(request);
				if(bean!=null){
					
					request.getSession().setAttribute(contentPage.USERSOBJ,bean);
					request.getSession().setAttribute(contentPage.MEMBERS,bean);
					/*request.setAttribute("member",bean);*/
					HashMap<String, permissionBean> map=new HashMap<String, permissionBean>();
					
					
					request.getSession().setAttribute(contentPage.MAPOBJ, map);
					request.getSession().setAttribute(contentPage.PERMISSIONNAME,getServletContext().getAttribute(contentPage.PERMISSIONNAME));
					request.getSession().setAttribute(contentPage.MASTERMAPOBJ, getServletContext().getAttribute(contentPage.MASTERMAPOBJ));
					request.getSession().setAttribute(contentPage.SETTING, getServletContext().getAttribute(contentPage.SETTING));
					
					if(bean.getDetails().size()==0){
						request.setAttribute(contentPage.CONTENT_PAGE, "/memberOtherDetailsHome.jsp");
						
						//System.out.println("empty details page");
					}else{
						request.setAttribute(contentPage.CONTENT_PAGE, "/memberOtherDetailsHome.jsp");
						//request.setAttribute(contentPage.CONTENT_PAGE, "/memberHome.jsp");
					}
					
					
					
					memberMaintenance.getInstance().getAllMemberPlan(request);
					
					HashMap<Integer, String> map2 = new HashMap<Integer, String>();
					if(request.getSession().getAttribute(contentPage.MASTERMAPOBJ)!=null){
						map2 = (HashMap<Integer, String>)  request.getSession().getAttribute(contentPage.MASTERMAPOBJ);
						for(Map.Entry m:map2.entrySet()){
							adminMaintenance.getInstance().getMasterBaseOnId((int)m.getKey(),m.getValue().toString(),request);
							
						}
					}
					adminMaintenance.getInstance().getAllCountry(request);
					
					
					rd=request.getRequestDispatcher("/memberIndex.jsp");  
					rd.forward(request, response); 
					
				}else{
					
					ErrorMsg error=new ErrorMsg(1,"Invalid Username or Password");
					request.setAttribute("error", error);
					rd=request.getRequestDispatcher("/MemberLogin.jsp");  
					rd.forward(request, response); 
				}
				
			}
			
			if(request.getParameter("key").equals("newRegister")){
				adminMaintenance.getInstance().getAllCountry(request);
				ErrorMsg obj=(ErrorMsg) memberMaintenance.getInstance().newRegistration(request);
				request.setAttribute("error", obj);
				if(obj.getErrorCode()!=0){
					rd=request.getRequestDispatcher("/MemberLogin.jsp");  
					rd.forward(request, response); 
				}else{
					rd=request.getRequestDispatcher("/MemberLogin.jsp");  
					rd.forward(request, response); 
				}
				
				
			}
			
			if(request.getParameter("key").equals("addMember")){
				
				ErrorMsg obj=(ErrorMsg) memberMaintenance.getInstance().addMemberOtherDetails(request);
				request.setAttribute("error", obj);
				if(obj.getErrorCode()!=0){
					request.setAttribute(contentPage.CONTENT_PAGE, "/memberOtherDetailsHome.jsp");
				}else{
					request.setAttribute(contentPage.CONTENT_PAGE, "/memberHome.jsp");
				}
				
				rd=request.getRequestDispatcher("/memberIndex.jsp");  
				rd.forward(request, response); 
				
			}
			
			if(request.getParameter("key").equals("addMemberStory")){
				

				memberStoryBean bean= new memberStoryBean();
				ServletContext servletContext = this.getServletConfig().getServletContext();
				 if(ServletFileUpload.isMultipartContent(request)){
			            try {
			                List<FileItem> multiparts = new ServletFileUpload(
			                                         new DiskFileItemFactory()).parseRequest(request);
			              
			                for(FileItem item : multiparts){
			                    if(!item.isFormField()){
			                    	if(new File(item.getName()).getName().length()>0){
			                    		String name = new File(item.getName()).getName();
			                    		
			                    		final String IMAGE_RESOURCE_PATH = "/webapp/temp";
			                    		
			                    		String directoryPath = 
			                    		        getServletContext().getRealPath(IMAGE_RESOURCE_PATH);
			                    		
			                    		File directory = new File(directoryPath);

			                    		if(!directory.exists()) {
			                    		    directory.mkdirs();
			                    		}
			                    		
										 String withFile = directoryPath  + File.separator+ name;
										 File uploadedFile = new File(withFile);
										 if(!uploadedFile.exists())
											 uploadedFile.createNewFile();
										 item.write(uploadedFile);
										 bean.setImgUrl(withFile);
			                    	}
			                        
									 
			                    }
			                    else{
			                    	if(item.getFieldName().equals("txtBrideName")){
			                    		//System.out.println(item.getString());
			                    		bean.setBrideName(item.getString());
			                    	}
			                    	if(item.getFieldName().equals("txtGroomName")){
			                    		bean.setGroomName(item.getString());
			                    	}
			                    	if(item.getFieldName().equals("txtMemberId")){
			                    		bean.setMemberId(item.getString());
			                    	}
			                    	if(item.getFieldName().equals("txtPartnerMemberId")){
			                    		//System.out.println(item.getString());
			                    		bean.setPartnerMemberId(item.getString());
			                    	}
			                    	if(item.getFieldName().equals("txtEngDate")){
			                    		bean.setEngDate(validation.convertStringToDate(item.getString()));			                    		
			                    	}
			                    	if(item.getFieldName().equals("txtMarriageDate")){
			                    		bean.setMarriageDate(validation.convertStringToDate(item.getString()));
			                    	}
			                    	if(item.getFieldName().equals("txtEmail")){			                    		
			                    		bean.setEmail(item.getString());	
			                    	}
			                    	if(item.getFieldName().equals("txtAddress")){
			                    		bean.setAddress(item.getString());
			                    	}
			                    	if(item.getFieldName().equals("country")){
			                    		bean.setCountry(item.getString());
			                    	}
			                    	/*if(item.getFieldName().equals("txtCountryCode")){			                    		
			                    		bean.setAddress(item.getString());
			                    	}*/
			                    	if(item.getFieldName().equals("txtPhone")){
			                    		bean.setPhone(item.getString());
			                    	}
			                    	if(item.getFieldName().equals("txtSussessStory")){
			                    		bean.setSuccessStory(item.getString());
			                    	}
			                    }
			                }
			           
			                ErrorMsg obj=(ErrorMsg) memberMaintenance.getInstance().insertMemberStory(bean,request);
			                request.setAttribute("error", obj);
			                if(obj.getErrorCode()!=0){
			                	rd=request.getRequestDispatcher("/memberStory.jsp");
							}else{
								rd=request.getRequestDispatcher("/MemberLogin.jsp");
							}
							rd.forward(request, response); 
			            } catch (Exception ex) {
			            	ex.printStackTrace();
			            }          
			         
			        }
			
				
//				ErrorMsg obj=(ErrorMsg) memberMaintenance.getInstance().addMemberStory(request);
//				request.setAttribute("error", obj);				
//				rd=request.getRequestDispatcher("/MemberLogin.jsp");  
//				rd.forward(request, response); 
				
			}
			
			
			
			
		}else{
			rd=request.getRequestDispatcher("/MemberLogin.jsp");  
			rd.forward(request, response); 
		}
		
	}

}
