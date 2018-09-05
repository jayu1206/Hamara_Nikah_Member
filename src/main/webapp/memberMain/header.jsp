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
	

		<div id="navbar" class="navbar navbar-default          ace-save-state"  style="background-color: #9d1104;    min-height: 77px;" >
			<div class="navbar-container ace-save-state" id="navbar-container">
			<!-- 	<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button> -->

				<div class="navbar-header pull-left" style="margin-top: 0%;">
					<a href="#" class="navbar-brand">
						<small>
							<!-- <i class="fa fa-leaf"></i> -->
							<%-- <%=mailbean.getApp_name() %> --%>
							<img src="memberCSS/images/logo.png" alt="logo">
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
				<!-- 		<li class="grey dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-check"></i>
									4 Tasks to complete
								</li>

							

								<li class="dropdown-footer">
									<a href="#">
										See tasks with details
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li> -->

			
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
			</div><!-- /.navbar-container -->
		</div>
		
		