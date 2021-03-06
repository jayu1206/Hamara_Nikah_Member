<!DOCTYPE html>
<%@page import="com.softNice.nikah.maintenance.adminMaintenance"%>
<%@page import="com.softNice.nikah.beans.countryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.softNice.nikah.beans.generalSettingBean"%>
<%@page import="com.softNice.nikah.beans.settingBean"%>
<%@page import="com.softNice.nikah.constent.contentPage"%>
<%@page import="com.softNice.nikah.constent.ErrorMsg"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        
        <script src="assets/js/jquery-1.11.3.min.js"></script>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />


		
		
		
        <!-- SEO -->
        <meta name="description" content="" />
        <title>Login Page - Hamara Nikah</title>
    </head>
    
    <%
    
    
    
    
    			adminMaintenance.getInstance().getAllCountry(request);
    
				String firstName="",lastName="",gender="",dob="",email="",psw="",maritalStatus="";
				int country=0,state=0,city=0;
	
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
					
					 firstName=request.getParameter("txtFirstName");
					 lastName=request.getParameter("txtLastName");
					 dob=request.getParameter("txtDob")==null?"":request.getParameter("txtDob");
					 gender=request.getParameter("gender")==null?"":request.getParameter("gender");
					 country=request.getParameter("country")!=null?Integer.parseInt(request.getParameter("country")):0;
					 state=request.getParameter("state")!=null?Integer.parseInt(request.getParameter("state")):0;
					 city=request.getParameter("city")!=null?Integer.parseInt(request.getParameter("city")):0;
					 email=request.getParameter("txtEmail");
					 psw=request.getParameter("txtPsw");
					 maritalStatus = request.getParameter("maritalStatus");
					
				}
		%>
		
		
    <body>
        <!-- Header Starts  -->
        <header class="header">
            <div class="container">
                <div class="top-header" style="padding: 0 0;">
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
                       
	                        <div class="col-lg-7">
	                            <div class="login-form">
	                                 <form action="memberServlet" method="post" name="memberForm1" id="memberForm1" >
	                                    <div class="form-group">
	                                        <input type="email" class="form-control" placeholder="Email"  id="txtUserName" name="txtUserName"  />
	                                    </div>
	                                    <input type="hidden" id="key" name="key" value="" />
	                                    <div class="form-group">
	                                        <input type="password" class="form-control" placeholder="Password"  id="txtPsw" name="txtPsw"  />
	                                        <a href="javascript:;">Forgot your Password?</a>
	                                    </div>
	                                    <input type="submit" class="btn" value="login"  id="btnSubmit"  name="btnSubmit" />
	                                   
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
                                
                                 <div class="form-group">
                                    <label class="form-label">Date of birth</label>
                                    <input class="input-medium date-picker"  id="txtDob" name="txtDob" value="<%=dob %>" type="text" data-date-format="dd-mm-yyyy" placeholder="dd-mm-yyyy"  readonly="readonly" />
									<i class="ace-icon fa fa-calendar"></i>
                                </div>
                                
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
                                    <%if(maritalStatus.equalsIgnoreCase("Single")){ %>
                                    <%} %>
                                   	    <option   value="0">Marital Status</option>
                                        <option value="Single">Single</option>
                                        <option value="Married">Married</option>
                                        <option value="Widowed">Widowed</option>
                                        <option value="Divorced">Divorced</option>
                                    </select>
                                </div>
                             <!--    <div class="form-group">
                                    <label class="form-label">Mother Tounge</label>
                                    <select class="form-control">
                                        <option selected="">English</option>
                                        <option>English</option>
                                        <option>English</option><option>English</option>
                                        <option>English</option>
                                    </select>
                                </div> -->
                               <!--  <div class="form-group">
                                    <label class="form-label">Country</label>
                                    <select class="form-control">
                                        <option selected="">Country</option>
                                        <option>Country</option>
                                        <option>Country</option><option>Country</option>
                                        <option>Country</option>
                                    </select>
                                </div> -->
                                <!-- <div class="form-group">
                                    <label class="form-label">Country</label>
                                    <div class="mobile-no">
                                        <input type="text" id="code" class="form-control"/>
                                        <input type="text" id="number"  class="form-control"/>
                                    </div>
                                </div> -->
                                <div class="form-group">
                                    <label class="form-label">Password</label>
                                   <input type="password" id="txtPsw2" name="txtPsw2" value="<%=psw %>" class="form-control" placeholder="Password" />
                                </div>
                                <div class="form-group">
                                    <button style="color:white; background-color: #9d1104;font-size: 20px;font-size: 20px; font-weight: 700;float: right;border-radius: 4px !important;border: solid 1px #9d1104;" 
                                    type="button"  id="btnRegister" name="btnRegister" value="Register now"> Register now</button>
                                </div>
                               <%--  
                                <div  class="form-group" align="center" style="color: red">
										<%
										 String str="";
										if(request.getAttribute(contentPage.ERROR)!=null){ 
											str=((ErrorMsg)request.getAttribute(contentPage.ERROR)).getError();
										
										} %>
										
										<label><%=str  %> </label>
					
								</div>
                               --%>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="find-partner-section">
            <div class="container">
                <h2>Find the one who completes you</h2>
                <form action=""  class="partner-form">
                    <div class="radio-block">
                        <label class="radio inline"> 
                            <input type="radio" name="sex" value="Bride" checked="checked">
                            <span>Bride </span> 
                        </label>
                        <label class="radio inline"> 
                            <input type="radio" name="sex" value="Groom">
                            <span>Groom</span> 
                        </label>
                    </div>
                    <div class="age-block">
                        <div class="form-detail">
                            <label>Age</label>
                            <select>
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
                            <select>
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
                            <label id="mother-tounge">Mother Tounge</label>
                            <select>
                                <option selected="">English</option>
                                <option>English</option>
                                <option>English</option><option>English</option>
                                <option>English</option>
                            </select>
                        </div>
                        <div class="form-detail">
                            <label id="sect">Sect</label>
                            <select>
                                <option selected="">Sect</option>
                                <option>Sect</option>
                                <option>Sect</option>
                                <option>Sect</option>
                                <option>Sect</option>

                            </select>
                        </div>                       
                        <div class="form-detail">
                            <label>Division</label>
                            <select>
                                <option selected="">Division</option>
                                <option>Division</option>
                                <option>Division</option>
                                <option>Division</option>
                                <option>Division</option>
                            </select>
                        </div>
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
                    <div class="success-story-block">
                        <div class="story-image">
                            <img src="memberCSS/images/story1.png" alt=""/>
                        </div>
                        <div class="success-story-content">
                            <p>Thank you Muslim Matrimony for helping me find perfect match.</p>
                            <h4>- Shahana & Sajin</h4>
                        </div>                         
                    </div>

                    <div class="success-story-block">
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
                    </div>
                </div>
            </div>
        </section>
        <!-- Recently Joined Section Starts  -->
        <section class="recently-joined-section">
            <div class="container">
                <h2>Recently Joined....</h2>
                <div class="row">
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
        <script type="text/javascript" src="memberCSS/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="memberCSS/plugin/bootstrap/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="memberCSS/plugin/owl-carousel/owl.carousel.min.js"></script>
        <script type="text/javascript" src="memberCSS/js/default.js"></script>
        
        
         <script src="assets/js/jquery-1.11.3.min.js"></script>


		<!-- bootstrap & fontawesome -->
		 <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" /> 
	<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

		<!-- text fonts -->
		 <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" /> 

		<!-- ace styles -->
		 <link rel="stylesheet" href="assets/css/ace.min.css" /> 

		 <link rel="stylesheet" href="assets/css/ace-rtl.min.css" /> 
		 <link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />
		 
		 <script src="assets/js/bootstrap-datepicker.min.js"></script>
		<script src="assets/js/jquery.hotkeys.index.min.js"></script>
		<script src="assets/js/select2.min.js"></script>
		
		<script type='text/javascript' src='dwr/engine.js'></script>
		<script type='text/javascript' src='dwr/interface/softNiceUtilityData.js'></script>
		<script type='text/javascript' src='dwr/util.js'></script>
		<script src='js/softnice.js?v=" + Date.now() + "' type="text/javascript" charset="utf-8"></script>
        
        
 <script>
 
$(document).ready(function($){
		
	    $('#btnSubmit').click(function(){ 
	    		$("#key").val("login");
	        	$("#memberForm1").submit();
	    });
	    
	   /*  $('#btnRegister').click(function(){ 
	    	$("#key").val("register");
        	$("#memberForm2").submit();
    }); */
	    
	    getState('<%=country %>','<%=state %>');
		getCity('<%=state %>','<%=city %>')
		
		
		    $('#btnSubmit').click(function(){ 
		        	$("#memberForm2").submit();
		    });
		    
		    $('#btnRegister').click(function(){ 
		    	$("#key").val("register");
	        	$("#memberForm2").submit();
	    }); 
		    
		     $("#txtDob").datepicker({
			    changeMonth: true,
	            changeYear: true,
	            autoclose: true,
	            yearRange: '-100y:c+nn',
	            clearBtn: true,
	            endDate:'-20y', //'12-06-1990' ,
	            closeBtn: true, // close button visible
	        
	        }); 

	

	});
</script>
        
    </body>
</html>
