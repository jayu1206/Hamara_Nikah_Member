<%@page import="com.google.gson.Gson"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.softNice.nikah.beans.generalSettingBean"%>
<%@page import="com.softNice.nikah.beans.settingBean"%>
<%@page import="com.softNice.nikah.beans.UserBean"%>
<%@page import="com.softNice.nikah.constent.contentPage"%>
<%
			UserBean bean=new UserBean();
			if(request.getSession().getAttribute(contentPage.USERSOBJ)!=null){
				bean = (UserBean)request.getSession().getAttribute(contentPage.USERSOBJ);
			}
			
			String fileName = null;
			String finalPath = null;
			settingBean settingbean= null;
			generalSettingBean mailbean= new generalSettingBean();
			if(request.getSession().getAttribute(contentPage.SETTING)!=null){
				settingbean = (settingBean) request.getSession().getAttribute(contentPage.SETTING);
				System.out.println("value : "+settingbean.getValue());
				
				ObjectMapper mapperObj = new ObjectMapper();
				if(settingbean.getValue()!=null){
					mailbean = new Gson().fromJson(settingbean.getValue(),generalSettingBean.class);
				}
				
				
				
				String path[] = mailbean.getLogo().toString().split("images");
				finalPath = path[1];															
				fileName = finalPath.substring(finalPath.lastIndexOf("\\")+1);;
				
			}
	
	%>
	
	
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
		
                       
                    </div>
                </div>
            </div>
        </header>