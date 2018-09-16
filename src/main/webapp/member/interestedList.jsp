<!DOCTYPE html>
<%@page import="com.softNice.nikah.beans.interestMemberBean"%>
<%@page import="java.util.Date"%>
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
        
          <!-- bootstrap & fontawesome -->
		<!-- <link rel="stylesheet" href="assets/css/bootstrap.min.css" /> -->
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		

		<script src="assets/js/jquery-2.1.4.min.js"></script>
		
		<!-- <link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" /> -->
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="assets/js/ace-extra.min.js"></script>


		
		<script src="assets/js/jquery-ui.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.easypiechart.min.js"></script>
		<script src="assets/js/jquery.sparkline.index.min.js"></script>
		<script src="assets/js/jquery.flot.min.js"></script>
		<script src="assets/js/jquery.flot.pie.min.js"></script>
		<script src="assets/js/jquery.flot.resize.min.js"></script>
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="assets/css/dropzone.min.css" />
		<script src="assets/js/dropzone.min.js"></script>
		
		
		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
		<script src="assets/js/dataTables.buttons.min.js"></script>
		<script src="assets/js/buttons.flash.min.js"></script>
		<script src="assets/js/buttons.html5.min.js"></script>
		<script src="assets/js/buttons.print.min.js"></script>
		<script src="assets/js/buttons.colVis.min.js"></script>
		<script src="assets/js/dataTables.select.min.js"></script>
		

	
		<script src="assets/js/bootstrap-datepicker.min.js"></script>
		<script src="assets/js/jquery.hotkeys.index.min.js"></script>
		<script src="assets/js/select2.min.js"></script>
		
		  
        <script type='text/javascript' src='dwr/engine.js'></script>
		<script type='text/javascript' src='dwr/interface/softNiceUtilityData.js'></script>
		<script type='text/javascript' src='dwr/util.js'></script>
		<script src='js/softnice.js?v=mk1"+ Date.now() + "' type="text/javascript" charset="utf-8"></script>
		
		<style type="text/css">
			.radio-block  {
				margin-left: 40%;
			}
			.age-block{
				margin-left: 33%;
			}
			select {
				height: 0%;
			}
			 .btn2{
				display: inline-block;
			    border: solid 1px #e4d7d2;
			    background-color: #5e1914;
			    border-radius: 3px;
			    padding: 7px 30px;
			    font-size: 16.72px;
			    line-height: 20px;
			    color: #fff;
			    text-transform: capitalize;
			    cursor: pointer;
			    padding: 2px 10px;
    			border-radius: 4px;
			} 
			li{
				    margin: 4px;
			}
			.modal-footer button {
				  float:right;
				 margin-right: 34%;
			}
			
			/* .recently-joined-section{
			    max-height: 810px;
			    overflow:scroll;overflow-y:scroll; padding-right: 17px; /* Increase/decrease this value for cross-browser compatibility */
    box-sizing: content-box;
			} */
		</style>
	
		
        <!-- SEO -->
        <meta name="description" content="" />
        <title>Hamara Nikah</title>
    </head>
    
     <%
     /* ArrayList<memberBean> memberList = new ArrayList<memberBean>();
     if(request.getAttribute(contentPage.MEMBERSEARCH)!=null){
			memberList = (ArrayList<memberBean>)request.getAttribute(contentPage.MEMBERSEARCH);  
     
     } */
    
    
   
				 String str="";
				
				 memberBean bean=new memberBean();
					if(request.getSession().getAttribute(contentPage.USERSOBJ)!=null){
						bean = (memberBean)request.getSession().getAttribute(contentPage.USERSOBJ);
					}
					
				
				boolean sessionUserFlag= false;
				if(request.getSession().getAttribute(contentPage.MEMBERS)!=null){
					
					sessionUserFlag = true;
					
				}
				
				ArrayList<memberStoryBean> storyList=new ArrayList<memberStoryBean>();				
			
				if(getServletContext().getAttribute(contentPage.STORIES)!=null){
					storyList = (ArrayList<memberStoryBean>) getServletContext().getAttribute(contentPage.STORIES);
					
				}
		%>
		
		
		
    <body>
        <!-- Header Starts  -->
        <header class="header"  style="margin-bottom: 0%;margin-top: 0px; */" >
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
                      
               
                         <a href="javascript:;" class="logo" style="padding-right: 47%;" >
                                <img src="memberCSS/images/logo.png" alt="logo"/>
                            </a>
                            
                            
                        	<div class="navbar-buttons navbar-header " role="navigation">
									<ul class="nav ace-nav">
								
										<li class="light-blue dropdown-modal " >
											<a data-toggle="dropdown" href="#" class="dropdown-toggle" style="background-color: #9d1104;">
												<img class="nav-user-photo" src="assets/images/avatars/user.jpg" alt="Jason's Photo" />
												<span class="user-info">
													<small>Welcome,</small>
													
													<%=bean.getFirstName() + " " + bean.getLastName() %>
												</span>
				
												<!-- <i class="ace-icon fa fa-caret-down"></i> -->
											</a>
				
											<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
												<li>
													<a href="memberServlet?key=dashboard">
														<i class="ace-icon fa fa-cog"></i>
														Dashboard
													</a>
												</li>
				
												<li>
													<a href="memberServlet?key=memberProfile">
														<i class="ace-icon fa fa-user"></i>
														Profile
													</a>
												</li>
												
												<li>
													<a href="memberServlet?key=searchMember">
														<i class="ace-icon fa fa-user"></i>
														quick Search
													</a>
												</li>
				
												<!-- <li class="divider"></li> -->
				
												<li>
													<a href="memberServlet?key=logout">
														<i class="ace-icon fa fa-power-off"></i>
														Logout
													</a>
												</li>
											</ul>
										</li>
									</ul>
								</div>
                    </div>
                </div>
            </div>
        </header>
<div class="main-container ace-save-state" id="main-container"  >
   <%--      <section class="find-partner-section">
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
                        <%
																
								ArrayList<masterBean> list = null;
									if(request.getSession().getAttribute(contentPage.MotherTounge)!=null){
										list = (ArrayList<masterBean>) request.getSession().getAttribute(contentPage.MotherTounge);
									}
															
							%>
                        <div class="form-detail">
                            <label id="mother-tounge">Mother Tounge</label>
                            <select>
                            	<option value="0">Select</option>
                                <%for(masterBean mstbean : list){%>
									<option value="<%=mstbean.getId() %>"  ><%=mstbean.getValue() %></option>
							<% }%>
                            </select>
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
        </section> --%>
        <%
        			int i = 1;
        					if(request.getAttribute(contentPage.INTERESTEDLIST)!=null){
	         			
	         			/* ArrayList<memberBean> memberList = new ArrayList<memberBean>();
	         			memberList = (ArrayList<memberBean>)request.getAttribute(contentPage.MEMBERSEARCH); */
	         %>


	        <!-- Search result content -->
	  
          	
	         <section class="recently-joined-section">
	            <div class="container">
	           
	           	<% if(request.getAttribute(contentPage.INTERESTEDLIST)!=null){ 
	           			ArrayList<interestMemberBean> list = (ArrayList<interestMemberBean>) request.getAttribute(contentPage.INTERESTEDLIST);
	           	
	           	%>
	            	
	            
	                <h2>Requested List</h2>
	                <form action="contentMemberServlet?key=message" method="post"  class="partner-form" name="memberForm4" id="memberForm4"  style="width:  auto;">
	                <div class="row" >
	                <input type="hidden" id="toMemberId" name="toMemberId" >
	                <input type="hidden" id="requestResult" name="requestResult" >
	               <%--  <% int fromMemid = 0; if(request.getSession().getAttribute(contentPage.MEMBERS)!=null){ fromMemid = bean.getId();  }%> --%>
	                
	              <%--   <input type="hidden" id="fromMemberId" name="fromMemberId" value="<%=fromMemid %>" > --%>
	                <% for(interestMemberBean bean2 : list){  memberBean memBean= bean2.getMember();  %>
	                    <div class="col-md-6 col-lg-4">
	                   
	                        <div class="joined-block">
	                            <div class="joined-member-image">
	                            	<%if(memBean.getGender().equals("male")){ %>
	                            			 <img src="memberCSS/images/join1.png" alt=""/>
	                            	<%}else{ %>
	                            	 	<img src="memberCSS/images/join2.png" alt=""/>
	                               <%} %>
	                               <%--  <h4><%=memBean.getFirstName() +" "+memBean.getLastName() %></h4> --%>
	                            </div>
	                            <div class="joined-member-info">
	                                <h3><%=memBean.getFirstName() +" "+memBean.getLastName() %></h3>
	                                
	                                <%String reqStatus = "";
	                                	if(bean2.getAcceptFlag()==0){
	                                		reqStatus = "Pending";
	                                	}else if(bean2.getAcceptFlag()==1){
	                                		reqStatus = "Accepted";
	                                	}else if (bean2.getAcceptFlag()==2){
	                                		reqStatus = "Rejected";
	                                		
	                                	}
	                                %>
	                               <p>Request Status :<%=reqStatus %></p>
	                               <p>City: <%=memBean.getCityName() %></p> 
	                                
	                                <a href="javascrupt:;" class="btn" id="bootbox-options<%=memBean.getId() %>" onclick="setMemberId(<%=bean2.getId() %>);" style="background-color: #5e1914!important; border-color: #5e1914;" data-target="#myModal" >View</a>
	                            </div>
	                        </div>
	                    </div>
	                    <%} %>
	              
	                </div>
	                 </form>
	                <%} %>
	            </div>
	        </section>  
	        <%} %>
     
 
       
        <!-- Story Block Starts  -->
        <section class="story-section">
            <div class="container">
                <div class="get-start-block">
                    <h3>Your story is waiting to open!</h3>
                    <a href="javascript:;" class="btn transpertant-btn" style="background-color: #5e1914!important; border-color: #5e1914;border: solid 1px #e4d7d2;">get started</a>
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
        
        
		</div> 
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		 <script src="assets/js/bootstrap.min.js"></script> 

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		
    	  <!-- <script type="text/javascript" src="memberCSS/js/jquery-3.3.1.min.js"></script>  --> 
         <script type="text/javascript" src="memberCSS/plugin/bootstrap/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="memberCSS/plugin/owl-carousel/owl.carousel.min.js"></script> 
        <script type="text/javascript" src="memberCSS/js/default.js"></script>
        
 		
		<!--   <script src="assets/js/jquery-1.11.3.min.js"></script>   
  		<script src="assets/js/bootstrap-datepicker.min.js"></script>
 		<script src="assets/js/jquery.hotkeys.index.min.js"></script>
		<script src="assets/js/select2.min.js"></script>  -->
        
        
          <script>
        function setMemberId(id){
     		if(document.getElementById("fromMemberId").value != 0){
     			document.getElementById("toMemberId").value = id;
     		}
     	}
      //  $.noConflict();
$(document).ready(function($){

	 $('#dynamic-table').dataTable(); 
	
	    $('#btnSubmit').click(function(){ 
	    		$("#key").val("login");
	        	$("#memberForm1").submit();
	    });
	    

	});

</script>
       

        
        
    </body>
</html>
