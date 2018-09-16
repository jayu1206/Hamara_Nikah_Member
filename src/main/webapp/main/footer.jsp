
<%@page import="com.google.gson.Gson"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.softNice.nikah.beans.generalSettingBean"%>
<%@page import="com.softNice.nikah.beans.settingBean"%>
<%@page import="com.softNice.nikah.constent.contentPage"%>
<%
settingBean settingbean= null;
			generalSettingBean mailbean= new generalSettingBean();
			if(request.getSession().getAttribute(contentPage.SETTING)!=null){
				settingbean = (settingBean) request.getSession().getAttribute(contentPage.SETTING);
				
				ObjectMapper mapperObj = new ObjectMapper();
				if(settingbean.getValue()!=null){
					mailbean = new Gson().fromJson(settingbean.getValue(),generalSettingBean.class);
				}
				
			}
	%>		
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
        