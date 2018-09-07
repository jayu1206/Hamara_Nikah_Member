<%@page import="com.softNice.nikah.utility.EncrypitDecrypit"%>
<%@page import="com.softNice.nikah.beans.memberBean"%>
<%@page import="com.softNice.nikah.beans.dashboard"%>
<%@page import="com.softNice.nikah.beans.memberPlanBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.softNice.nikah.constent.contentPage"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.softNice.nikah.beans.generalSettingBean"%>
<%@page import="com.softNice.nikah.beans.settingBean"%>

<%

ArrayList<memberPlanBean> list=new ArrayList<memberPlanBean>();
if(request.getAttribute(contentPage.MEMBERPLANOBJ)!=null){
	list = (ArrayList<memberPlanBean>)request.getAttribute(contentPage.MEMBERPLANOBJ);
}

ArrayList<dashboard> dashboardList =new ArrayList<dashboard>();
if(request.getSession().getAttribute(contentPage.DASHBOARD)!=null){
	dashboardList = (ArrayList<dashboard>) request.getSession().getAttribute(contentPage.DASHBOARD);
	 
}
memberBean bean= new memberBean();
bean = (memberBean)request.getSession().getAttribute(contentPage.USERSOBJ);

int totalMember=0;
int active=0;
int inactive=0;
int toalGender=0;
int male=0;
int female=0;

for(dashboard daBean : dashboardList){
	
		if(daBean.getName().equals("totalMembers"))
			totalMember = daBean.getValue();
		
		if(daBean.getName().equals("active"))
			active = daBean.getValue();
		
		if(daBean.getName().equals("inactive"))
			inactive = daBean.getValue();
		
		if(daBean.getName().equals("totalGender"))
			toalGender = daBean.getValue();
		
		if(daBean.getName().equals("male"))
			male = daBean.getValue();
		
		if(daBean.getName().equals("female"))
			female = daBean.getValue();
				
	
}


%>

<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
							<li class="active">Dashboard</li>
						</ul><!-- /.breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->
					</div>

					<div class="page-content">
					

						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									overview &amp; stats
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
							

								<div class="row">
									<div class="space-6"></div>
 
					
									<div class="vspace-12-sm"></div>

						
								</div><!-- /.row -->
								
									<h4 class="header blue bolder smaller"> &nbsp;</h4>
									
<%if(list.size()>0){  %>
					<div class="row">
				
						<div class="col-xs-4 col-sm-2 pricing-span-header">
										<div class="widget-box transparent">
											<div class="widget-header">
												<h5 class="widget-title bigger lighter">Package Name</h5>
											</div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<ul class="list-unstyled list-striped pricing-table-header">
														<li>Creadit</li>
														<li>Plan Validity</li>
														<li>Order</li>
														<li>Print view</li>
														<li>Photo Upload</li>
														<li>Horoscope Upload</li>
														<li>Horoscope View</li>
														<li>Video Upload</li>
														<li>Protect Photo</li>
														<li>Bookmark</li>
														<li>Messaging</li>
														<li>Service Tax</li>
														<li>Plan Charges</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-8 col-sm-9 pricing-span-body">
									<%  for(memberPlanBean plan: list){
									
									String str="";
									if(plan.getPlanName().equalsIgnoreCase("free")){
										str="red3";
									}
									if(plan.getPlanName().equalsIgnoreCase("Dimond")){
										str="orange";
									}
									
									if(plan.getPlanName().equalsIgnoreCase("Gold")){
										str="blue";								
									}
									if(plan.getPlanName().equalsIgnoreCase("Platinum")){
										str="green";	
									}
									if(plan.getPlanName().equalsIgnoreCase("Silver")){
										str="grey";
									}
									
									%>
									
										
										<div class="pricing-span">
											
											<div class="widget-box pricing-box-small widget-color-<%=str %>">
												<div class="widget-header" align="center" >
													<h5 class="widget-title bigger lighter"  ><%=plan.getPlanName() %></h5>
												</div>

												<div class="widget-body">
													<div class="widget-main no-padding">
														<ul class="list-unstyled list-striped pricing-table">
															<li> <%=plan.getCredits() %></li>
															<li> <%=plan.getPlanValidity() + " Days"  %> </li>
															<li> <%=plan.getOrder() %> </li>
														
														<%if(plan.isPrintedView()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
														
														<%if(plan.isPhotoUpload()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
														
														<%if(plan.isHoroscopeUpload()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
														
														<%if(plan.isHoroscopeView()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
														
														<%if(plan.isVideoUpload()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
														
														<%if(plan.isProtectPhoto()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
														
														<%if(plan.isBookmark()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
														
														<%if(plan.isMessaging()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
														
														<%if(plan.isServiceTex()){ %>
															<li><i class=" green ace-icon fa fa-check-circle"></i></li>
														<%}else{ %>
															<li><i class="red ace-icon fa fa-times-circle"></i></li>
														<%} %>
	
														<li><div class="price">
															<span class="label label-lg label-inverse arrowed-in arrowed-in-right">
																<small><%=plan.getPlanCharges() + " Rs" %></small>
															</span>
														</div></li>
															
														</ul>

													</div>
<%

	String memberId = EncrypitDecrypit.encrypt(bean.getMemberId(), "password");
	String pln = String.valueOf(plan.getPlanId());
	String planId = EncrypitDecrypit.encrypt(pln, "password");
%> 
													<div>
														<a href="memberServlet?key=requestPlan&memberId=<%=memberId %>&planID=<%=planId %>" class="btn btn-block btn-sm btn-danger">
															<span>Buy</span>
														</a>
													</div>
												</div>
											</div>
										</div>

								<%} %>

									</div>
							</div>
							
							
							<%} %>
							
							
							
									
									
									
							
							
							
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->