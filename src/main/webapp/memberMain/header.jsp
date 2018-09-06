<%@page import="com.softNice.nikah.beans.memberBean"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.softNice.nikah.beans.generalSettingBean"%>
<%@page import="com.softNice.nikah.beans.settingBean"%>
<%@page import="com.softNice.nikah.beans.UserBean"%>
<%@page import="com.softNice.nikah.constent.contentPage"%>

<style>
.header {
    display: inline-block;
    width: 100%;
}

</style>

<%
			memberBean bean=new memberBean();
			if(request.getSession().getAttribute(contentPage.USERSOBJ)!=null){
				bean = (memberBean)request.getSession().getAttribute(contentPage.USERSOBJ);
			}
			
			
			settingBean settingbean= null;
			generalSettingBean mailbean= new generalSettingBean();
			if(request.getSession().getAttribute(contentPage.SETTING)!=null){
				settingbean = (settingBean) request.getSession().getAttribute(contentPage.SETTING);
				System.out.println("value : "+settingbean.getValue());
				
				ObjectMapper mapperObj = new ObjectMapper();
				if(settingbean.getValue()!=null){
					mailbean = new Gson().fromJson(settingbean.getValue(),generalSettingBean.class);
				}
				
			}
	
	%>
	
	
		<div id="navbar" class="navbar navbar-default ace-save-state"   >
			<div class="navbar-container ace-save-state" id="navbar-container">
				 <div class='col-md-4'> 

				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<!-- <i class="fa fa-leaf"></i> -->
							<%-- <%=mailbean.getApp_name() %> --%>
							<img src="memberCSS/images/logo.png" alt="logo">
						</small>
					</a>
				</div>
				 </div> 
				<div class='col-md-8'>
				<div class="navbar-buttons navbar-header pull-right " role="navigation">
					<ul class="nav ace-nav">
				
						<li class="light-blue dropdown-modal" style="margin-top: 7%;">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle" style="background-color: #9d1104;">
								<img class="nav-user-photo" src="assets/images/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									<%System.out.println(bean.getFirstName()); %>
									<%=bean.getFirstName() + " " + bean.getLastName() %>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="memberServlet?key=memberProfile">
										<i class="ace-icon fa fa-user"></i>
										Profile
									</a>
								</li>

								<li class="divider"></li>

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
			</div><!-- /.navbar-container -->
		</div>
		
		
		