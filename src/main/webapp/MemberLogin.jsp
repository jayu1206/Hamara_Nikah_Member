<!DOCTYPE html>
<%@page import="com.softNice.nikah.beans.memberBean"%>
<%@page import="com.softNice.nikah.beans.masterBean"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page isELIgnored="true" %>
<%@page import="com.softNice.nikah.maintenance.adminMaintenance"%>
<%@page import="com.softNice.nikah.beans.countryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.softNice.nikah.beans.generalSettingBean"%>
<%@page import="com.softNice.nikah.beans.settingBean"%>
<%@page import="com.softNice.nikah.constent.contentPage"%>
<%@page import="com.softNice.nikah.constent.ErrorMsg"%>
<%@page import="com.softNice.nikah.beans.memberStoryBean"%>
<html lang="en">
    <head>
        <!-- HTML Variables -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

        <link rel="apple-touch-icon" sizes="76x76" href="memberCSS/images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="memberCSS/images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="memberCSS/images/favicon/favicon-16x16.png">
        <link rel="manifest" href="memberCSS/images/favicon/site.webmanifest">
        <meta name="application-name" content="BBRadio">
        <!--Theme CSS-->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900" rel="stylesheet">       
        <link rel="stylesheet" href="memberCSS/plugin/bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="memberCSS/plugin/owl-carousel/owl.carousel.css" type="text/css"/>
        <link rel="stylesheet" href="memberCSS/font/font-awesome.css" type="text/css"/>
        <link href="memberCSS/css/style.css" rel="stylesheet" type="text/css"/>
        
        <script language="JavaScript" type="text/javascript">
window.history.forward(1);
</script>
       

<!-- 		
 		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" /> 
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" /> 
		 <link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />
		  -->
		  
        <script type='text/javascript' src='dwr/engine.js'></script>
		<script type='text/javascript' src='dwr/interface/softNiceUtilityData.js'></script>
		<script type='text/javascript' src='dwr/util.js'></script>
		<script src='js/softnice.js?v=" + Date.now() + "' type="text/javascript" charset="utf-8"></script>
		

	
		
        <!-- SEO -->
        <meta name="description" content="" />
        <title>Hamara Nikah</title>
    </head>
    
     <%
    
  /*   if(request.getSession().getAttribute(contentPage.MEMBERS)!=null){
    	response.sendRedirect("/memberDashboard.jsp");
    	
    } */
    
     /*  request.getSession().setAttribute(contentPage.MASTERMAPOBJ, getServletContext().getAttribute(contentPage.MASTERMAPOBJ));
     HashMap<Integer, String> map2 = new HashMap<Integer, String>();
		if(request.getSession().getAttribute(contentPage.MASTERMAPOBJ)!=null){
			map2 = (HashMap<Integer, String>)  request.getSession().getAttribute(contentPage.MASTERMAPOBJ);
			for(Map.Entry m:map2.entrySet()){
				adminMaintenance.getInstance().getMasterBaseOnId((int)m.getKey(),m.getValue().toString(),request);
				
			}
		} */ 
		
		
    			adminMaintenance.getInstance().getAllCountry(request);
    
				String firstName="",lastName="",gender="",dob="",email="",psw="",maritalStatus="";
				int country=0,state=0,city=0;
	
				 String str="";
				
				
				
				/* boolean sessionUserFlag= false;
				if(request.getSession().getAttribute(contentPage.MEMBERS)!=null){
					
					sessionUserFlag = true;
					
					RequestDispatcher rd = request.getRequestDispatcher("/memberDashboard.jsp");
					rd.forward(request, response);
					
					
				} */
				
				
				settingBean settingbean= null;
				generalSettingBean mailbean= new generalSettingBean();
				if(getServletContext().getAttribute(contentPage.SETTING)!=null){
					settingbean = (settingBean) getServletContext().getAttribute(contentPage.SETTING);
					
					ObjectMapper mapperObj = new ObjectMapper();
					if(settingbean.getValue()!=null){
						mailbean = new Gson().fromJson(settingbean.getValue(),generalSettingBean.class);
					}
					
				}
				
				ArrayList<countryBean> countryList=new ArrayList<countryBean>();
				if(request.getAttribute(contentPage.COUNTRYOBJ)!=null){
					countryList = (ArrayList<countryBean>)request.getAttribute(contentPage.COUNTRYOBJ);
				}
				
				if(request.getAttribute(contentPage.ERROR)!=null){ 
					
					 firstName=request.getParameter("txtFirstName")==null?"":request.getParameter("txtFirstName");
					 lastName=request.getParameter("txtLastName")==null?"":request.getParameter("txtLastName");
					 dob=request.getParameter("txtDob")==null?"":request.getParameter("txtDob");
					 gender=request.getParameter("gender")==null?"":request.getParameter("gender");
					 country=request.getParameter("country")!=null?Integer.parseInt(request.getParameter("country")):0;
					 state=request.getParameter("state")!=null?Integer.parseInt(request.getParameter("state")):0;
					 city=request.getParameter("city")!=null?Integer.parseInt(request.getParameter("city")):0;
					 email=request.getParameter("txtEmail")==null?"":request.getParameter("txtEmail");
					 psw=request.getParameter("txtPsw")==null?"":request.getParameter("txtPsw");
					 maritalStatus = request.getParameter("maritalStatus")==null?"":request.getParameter("maritalStatus");
					 
					
					str=((ErrorMsg)request.getAttribute(contentPage.ERROR)).getError();
					if(str.equals("User created sucessfully")){
					
						firstName="" ;lastName="";gender="";dob="";email="";psw="";maritalStatus="";
						country=0;state=0;city=0;
					}
						
						
					
				}
				
				ArrayList<memberStoryBean> storyList=new ArrayList<memberStoryBean>();				
			
				if(getServletContext().getAttribute(contentPage.STORIES)!=null){
					storyList = (ArrayList<memberStoryBean>) getServletContext().getAttribute(contentPage.STORIES);
					
				}
		%>
		
		
		
    <body>
        <!-- Header Starts  -->
        <header class="header">
            <div class="container">
                <div class="top-header">
                    <div class="top-left float-left">
                        <a href="tel:01987654321"><i class="fa fa-phone"></i><span>01-987654321</span></a>
                        <a href="mailto:info@hamaranikah.com"><i class="fa fa-envelope"></i><span>info@hamaranikah.com</span> </a>
                    </div>
                    <div class="top-left float-right">
                        <a href="javascript:;">About</a>
                        <a href="javascript:;"><i class="fa fa-question-circle"></i>Help</a>
                    </div>
                </div>
            </div>
            <div class="main-header">
                <div class="container">
                    <div class="row">
                       <div class="col-lg-5">
                            <a href="javascript:;" class="logo">
                                <img src="memberCSS/images/logo.png" alt="logo"/>
                            </a>
                        </div> 
                        
                    	<%
								  str="";  //Invalid Username or Password
								if(request.getAttribute(contentPage.ERROR)!=null){ 
									str=((ErrorMsg)request.getAttribute(contentPage.ERROR)).getError();
									if(!str.equals("Invalid Username or Password")){
										str ="";
									}
								} 
											
						%>
														
					
                       
                       
                        <div class="col-lg-7">
                            <div class="login-form">
                                <form action="memberServlet" method="post" name="memberForm1" id="memberForm1" class="float-none float-lg-right" >
                                <input type="hidden" id="key" name="key" value="" />
                                    <div class="form-group">
                                        <!-- <input type="email" class="form-control" placeholder="Email"/> -->
                                        <input type="email" class="form-control" placeholder="Email"  id="txtUserName" name="txtUserName"  />
                                        <div style="color: white; padding-top: 5px;">	<%=str %>  </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="Password"  id="txtPsw" name="txtPsw"  />
                                        <a href="javascript:;">Forgot your Password?</a>
                                       
                                    </div>
                                    <input type="submit" class="btn" value="login" id="btnSubmit"  name="btnSubmit" />
                                </form>
                            </div>
                        </div>
                  
                       
                    </div>
                </div>
            </div>
        </header>
       
        <section class="registration-form-section">
            <div class="container">
                <div class="row">
                    <div class="offset-lg-6 col-lg-6">
                        <div class="registration-form">
                        
                            <h2>Perfect Place for your Perfect Matchs</h2>
                            <form action="memberServlet?key=newRegister" method="post" name="memberForm2" id="memberForm2">
                          
                            
                                <h1>Registration FREE</h1>
                                 <div class="form-group">
                                    <label class="form-label">First Name</label>
                                    <input type="text" id="txtFirstName" name="txtFirstName" class="form-control" value="<%=firstName %>" placeholder="First Name" />
                                </div> 
                                
                               <div class="form-group">
                                    <label class="form-label">Last Name</label>
                                    <input type="text" id="txtLastName" name="txtLastName" class="form-control" value="<%=lastName %>" placeholder="Last Name" />
                                </div>
                                
                                  <div class="radio-block">
                                    <label class="form-label">I am looking for</label>
                                    <label class="radio inline"> 
                                        <%if(gender.equalsIgnoreCase("male")){ %>
												<input name="gender" id="male" type="radio"  value="male" checked="checked"  />
											<%}else{ %>
												<input name="gender" id="male" type="radio"  value="male"  />
											<%} %>
                                        <span>Bride </span> 
                                    </label>
                                    <label class="radio inline"> 
                                        <%if(gender.equalsIgnoreCase("female")){ %>
												<input name="gender" id="female" type="radio"  value="female" checked="checked"  />
											<%}else{ %>
												<input name="gender" id="female" type="radio"  value="female" />
											<%} %>
                                        <span>Groom</span> 
                                    </label>
                                </div>
                                
                              <%--    <div class="form-group">
                                    <label class="form-label">Date of birth</label>
                                    <input class="input-medium date-picker"  id="txtDob" name="txtDob" value="<%=dob %>" type="text" data-date-format="dd-mm-yyyy" placeholder="dd-mm-yyyy"  readonly="readonly" />
									<i class="ace-icon fa fa-calendar"></i>
                                </div> --%>
                                
                                  <div class="form-group">
                                    <label class="form-label">Country</label>
                                    <select class="form-control" id="country" name="country" onchange="getState(this.value,0);">
												<option value="0">Country</option>
													<%for(countryBean countrybean : countryList){ 
															if(country == countrybean.getId()){
													%>
															<option selected="selected" value="<%=countrybean.getId() %>" ><%=countrybean.getName() %></option>
													<%}else{ %>
															<option value="<%=countrybean.getId() %>" ><%=countrybean.getName() %></option>
													<%}} %>
													
										</select>
                                </div>
                                
                                
                                 <div class="form-group">
                                    <label class="form-label">State</label>
                                   <select class="form-control"  id="state" name="state" onchange="getCity(this.value,0);">
											<option value="0">State</option>
									</select>
                                </div>
                                
                                <div class="form-group">
                                    <label class="form-label">City</label>
                                  <select class="form-control" id="city" name="city" >
											<option value="0">City</option>
								  </select>
                                </div>
                                
                               <div class="form-group">
                                    <label class="form-label">Email</label>
                                    <input type="text" id="txtEmail" name="txtEmail" value="<%=email %>" class="form-control" placeholder="Email" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Marital Status</label>
                                    <select class="form-control" id="maritalStatus" name="maritalStatus" >
                                    <option   value="0">Marital Status</option>
                                    <%if(maritalStatus.equalsIgnoreCase("Single")){ %>
                                    		<option value="Single" selected="selected">Single</option>
                                    <%}else{ %>
                                   			 <option value="Single">Single</option>
                                    <%} %>
                                    
                                     <%if(maritalStatus.equalsIgnoreCase("Married")){ %>
                                    		<option value="Married" selected="selected">Married</option>
                                    <%}else{ %>
                                   			<option value="Married">Married</option>
                                    <%} %>
                                    
                                    <%if(maritalStatus.equalsIgnoreCase("Widowed")){ %>
                                    		  <option value="Widowed" selected="selected">Widowed</option>
                                    <%}else{ %>
                                   			  <option value="Widowed">Widowed</option>
                                    <%} %>
                                   	    
                                    <%if(maritalStatus.equalsIgnoreCase("Divorced")){ %>
                                    		  <option value="Divorced" selected="selected">Divorced</option>
                                    <%}else{ %>
                                   			  <option value="Divorced">Divorced</option>
                                    <%} %>
                                        
                                      
                                        
                                    </select>
                                </div>
                                
                               
                            
                                <div class="form-group">
                                    <label class="form-label">Password</label>
                                    <input type="password" class="form-control" id="txtPsw" name="txtPsw" value="<%=psw %>"/>
                                </div>
								 <!-- <div class="form-group">
                                    <label class="form-label">Password</label>
                                    <input type="password" class="form-control"/>
                                </div>
								 <div class="form-group">
                                    <label class="form-label">Password</label>
                                    <input type="password" class="form-control"/>
                                </div> -->
                                <div class="form-group">
                                    <input type="submit"  id="btnRegister" name="btnRegister" class="btn btn-register" value="Register now"/>
                                </div>
                                
                                	<div align="center" style="color: red">
														<%
														  str="";  //Invalid Username or Password
															if(request.getAttribute(contentPage.ERROR)!=null){ 
																str=((ErrorMsg)request.getAttribute(contentPage.ERROR)).getError();
																if(str.equals("Invalid Username or Password")){
																	str ="";
																}
															} 
														
														
														
														%>
														
														<label><%=str %> </label>
									
								</div>
								
                            </form>
                           
                        </div>
                    </div>
                </div>
            </div>
        </section>
      
        <section class="find-partner-section">
            <div class="container">
                <h2>Find the one who completes you</h2>
                <form action="ContentServlet?key=searchMember" method="post"  class="partner-form" name="memberForm3" id="memberForm3">
                    <div class="radio-block">
                        <label class="radio inline"> 
                            <input type="radio" name="gender"  value="female" checked="checked">
                            <span>Bride </span> 
                        </label>
                        <label class="radio inline"> 
                            <input type="radio" name="gender" value="male">
                            <span>Groom</span> 
                        </label>
                    </div>
                    <div class="age-block">
                        <div class="form-detail">
                            <label>Age</label>
                            <select id="ageFrom" name="ageFrom" >
                                <option selected="">18</option>
                                <option>19</option>
                                <option>20</option> 
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                            </select>
                        </div>
                        <div class="form-detail">
                            <label>To</label>
                            <select id="ageTo" name="ageTo" >
                                <option selected="">18</option>
                                <option>19</option>
                                <option>20</option> 
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                            </select>
                        </div>
                       <%--  <%
																
								ArrayList<masterBean> list = null;
									if(request.getSession().getAttribute(contentPage.MotherTounge)!=null){
										list = (ArrayList<masterBean>) request.getSession().getAttribute(contentPage.MotherTounge);
									}
															
							%> --%>
                        <div class="form-detail">
                            <label id="mother-tounge">Mother Tounge</label>
                        <%--     <select>
                            	<option value="0">Select</option>
                                <%for(masterBean mstbean : list){%>
									<option value="<%=mstbean.getId() %>"  ><%=mstbean.getValue() %></option>
							<% }%>
                            </select> --%>
                        </div>
                        <div class="form-detail">
                            <label id="sect">Country</label>
                            <select>
                            	<option value="0">Select</option>
                                <%for(countryBean countrybean : countryList){ %>
										<option value="<%=countrybean.getId() %>" ><%=countrybean.getName() %></option>
								<%}%>

                            </select>
                        </div>                       
                    </div>
                    <div class="radio-block">
                    		<input type="submit" class="btn btn-white" value="search"/>
                     </div>
                </form>
            </div>
        </section>
       
  
         		<section class="our-services-section">
	            <h1>Your partner search just got better with <span>Hamara nikah</span></h1>
	            <div class="container">
	                <div class="row">
	                    <div class="col-md-4">
	                        <div class="our-service-block">
	                            <div class="our-service-img">
	                                <i class="fa fa-edit"></i>
	                            </div>
	                            <div class="services-content">
	                                <h3>Sign up</h3>
	                                <p>Register for free and put up your profile</p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-md-4">
	                        <div class="our-service-block">
	                            <div class="our-service-img">
	                                <i class="fa fa-group"></i>
	                            </div>
	                            <div class="services-content">
	                                <h3>Connect</h3>
	                                <p>Select & Connect with Matches you like.</p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-md-4">
	                        <div class="our-service-block">
	                            <div class="our-service-img">
	                                <i class="fa fa-comments-o"></i>
	                            </div>
	                            <div class="services-content">
	                                <h3>Interact</h3>
	                                <p>Become a Premium Member & Start a conversation  </p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
       
        <!--  Success Stories -->
	    <section class="success-story-section">
	            <h1>Success Stories</h1>
	            <div class="container">               
	                <div class="success-story-slider owl-carousel">
	                
	
					<%
						for (memberStoryBean storyBean : storyList) {
							String path[] = storyBean.getImgUrl().toString().split("temp");
							String finalPath = path[1];															
							String fileName = finalPath.substring(finalPath.lastIndexOf("\\")+1);
			        %>
			        
					<div class="success-story-block">
	                        <div class="story-image">
	                             <img src="<%="file:/"+storyBean.getImgUrl() %>" alt=""/>
	                            <%--  <img src=<%="http://localhost:8085/SoftNice_Hamara_Nikah/webapp/temp/"+fileName%> alt="Image not available"/> --%>
	                            
	                        </div>
	                        <div class="success-story-content">
	                            <p><%=storyBean.getSuccessStory() %></p>
	                            <h4>- <%=storyBean.getBrideName() %> & <%=storyBean.getGroomName() %></h4>
	                        </div>                         
	                    </div>
	                 <%
							}
					 %>
	
	                    <!-- <div class="success-story-block">
	                        <div class="story-image">
	                            <img src="memberCSS/images/story2.png" alt=""/>
	                        </div>
	                        <div class="success-story-content">
	                            <p>Thank you Muslim Matrimony for helping me find perfect match.</p>
	                            <h4>- Shahana & Sajin</h4>
	                        </div>                         
	                    </div>
	                    <div class="success-story-block">
	                        <div class="story-image">
	                            <img src="memberCSS/images/story1.png" alt=""/>
	                        </div>
	                        <div class="success-story-content">
	                            <p>Thank you Muslim Matrimony for helping me find perfect match.</p>
	                            <h4>- Shahana & Sajin</h4>
	                        </div>                         
	                    </div> -->
	                </div>
	            </div>
	        </section>
	        
	        <!-- Recently Joined Section Starts  -->
	        <section class="recently-joined-section">
	            <div class="container">
	                <h2>Recently Joined....</h2>
	                <div class="row" >
	                    <div class="col-md-6 col-lg-4">
	                        <div class="joined-block">
	                            <div class="joined-member-image">
	                                <img src="memberCSS/images/join1.png" alt=""/>
	                                <h4>Loremm Ipsum</h4>
	                            </div>
	                            <div class="joined-member-info">
	                                <h3>Lorem Ipsum</h3>
	                                <p>Age:26</p>
	                                <p>City:Vadodara</p>
	                                <a href="javascrupt:;" class="btn">contact me</a>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-md-6 col-lg-4">
	                        <div class="joined-block">
	                            <div class="joined-member-image">
	                                <img src="memberCSS/images/join2.png" alt=""/>
	                                <h4>Loremm Ipsum</h4>
	                            </div>
	                            <div class="joined-member-info">
	                                <h3>Lorem Ipsum</h3>
	                                <p>Age:26</p>
	                                <p>City:Vadodara</p>
	                                <a href="javascrupt:;" class="btn">contact me</a>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-md-6 col-lg-4">
	                        <div class="joined-block">
	                            <div class="joined-member-image">
	                                <img src="memberCSS/images/join3.png" alt=""/>
	                                <h4>Loremm Ipsum</h4>
	                            </div>
	                            <div class="joined-member-info">
	                                <h3>Lorem Ipsum</h3>
	                                <p>Age:26</p>
	                                <p>City:Vadodara</p>
	                                <a href="javascrupt:;" class="btn">contact me</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
         
       
       
       
       
       
       
       
       
       
       
       
       
       
       
        <!-- Story Block Starts  -->
        <section class="story-section">
            <div class="container">
                <div class="get-start-block">
                    <h3>Your story is waiting to open!</h3>
                    <a href="javascript:;" class="btn transpertant-btn">get started</a>
                </div>
            </div>
        </section>
        <!-- Footer Starts  -->
        <footer>
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <div class="footer-block">
                                <h3>About Hamara Nikah</h3>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="footer-block">
                                <h3>GENERAL LINK</h3>
                                <a href="javascript:;">Career</a>
                                <a href="javascript:;">Privacy & Policy</a>                                
                                <a href="javascript:;">Terms & Condition</a>
                                <a href="javascript:;">Case Studies</a>
                                <a href="javascript:;">FAQs</a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="footer-block">
                                <h3>LATEST POST</h3>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum h</p>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum h</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="footer-block">
                                <h3>FOLLOW US!</h3>
                                <a href="javascript:;">Linkedin</a>
                                <a href="javascript:;">Facebook</a>
                                <a href="javascript:;">Twitter</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p><i class="fa fa-copyright"></i> - All Rights With <a href="javascript:;">Hamra Nikah</a></p>
            </div>
        </footer>
        
        
<!-- 		 	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		 <script src="assets/js/bootstrap.min.js"></script> 

		ace scripts
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script> -->
		
		
        <script type="text/javascript" src="memberCSS/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="memberCSS/plugin/bootstrap/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="memberCSS/plugin/owl-carousel/owl.carousel.min.js"></script>
        <script type="text/javascript" src="memberCSS/js/default.js"></script>
        
 		
		 <!--  <script src="assets/js/jquery-1.11.3.min.js"></script>   -->
  	<!-- 	<script src="assets/js/bootstrap-datepicker.min.js"></script>
 		<script src="assets/js/jquery.hotkeys.index.min.js"></script>
		<script src="assets/js/select2.min.js"></script> 
        
        
         -->
        
        <script>
      //  $.noConflict();
$(document).ready(function($){
		
	 getState('<%=country %>','<%=state %>');
	 getCity('<%=state %>','<%=city %>')
		
		
	        
	       /*  $("#txtDob").datetimepicker({
	            format: 'L',
	            ignoreReadonly: true
	          }); 
 */
	 
	    $('#btnSubmit').click(function(){ 
	    		$("#key").val("login");
	        	$("#memberForm1").submit();
	    });
	    

	});

</script>


        
        
    </body>
</html>
