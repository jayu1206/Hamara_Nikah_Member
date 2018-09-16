
<%@page import="com.softNice.nikah.beans.memberBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.softNice.nikah.beans.roleBean"%>
<%@page import="com.softNice.nikah.beans.permissionBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.softNice.nikah.constent.contentPage"%>
<%@page import="com.softNice.nikah.beans.UserBean"%>
<style>
.profile-pic {
    display: block;
}

.file-upload {
 max-width: 200px;
    max-height: 200px;
    display: none;
}

.main-content-inner {
	width: auto;
}
.circle {
    border-radius: 1000px !important;
    overflow: hidden;
    width: 128px;
    height: 128px;
    border: 8px solid rgba(255, 255, 255, 0.7);
    position: absolute;
    top: 72px;
}
img {
    max-width: 100%;
    height: auto;
}
.p-image {
  position: absolute;
  top: 167px;
  right: 30px;
  color: #d81515;
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
      margin-top: -63%;
}
.p-image:hover {
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}
.upload-button {
  font-size: 1.2em;
}

.upload-button:hover {
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
  color: #999;
}


</style>

<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
				
				<%
						/* HashMap<String, permissionBean> map= null;
						if(request.getSession().getAttribute(contentPage.MAPOBJ)!=null){
							new HashMap<String, permissionBean>();
							map = (HashMap) request.getSession().getAttribute(contentPage.MAPOBJ);
						}		
							 */
							 memberBean bean=new memberBean();
							 if(request.getSession().getAttribute(contentPage.USERSOBJ)!=null){
								 bean = (memberBean)request.getSession().getAttribute(contentPage.USERSOBJ);
							 }
	
				%>
				
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

					 	<!-- <span class="profile-picture">  --> 
					 	<div class="row">
   									<div class="small-12 medium-2 large-2 columns">
									 <div class="circle" style="margin-top: -4%;margin-left: 2%;">
									<img id="avatar" name="avatar" class="profile-pic" alt="Alex's Avatar" src="assets/images/avatars/profile-pic.jpg" />
									<div class="p-image">
								       <i class="fa fa-camera upload-button"></i> 
								        <input class="file-upload" type="file" id="profileImg"  name="profileImg" accept="image/*"/>
								     </div>
									</div>
								 	</div>
						</div>
						<!-- </span> -->
										
				<ul class="nav nav-list"  style="display: block;margin-top: 70%;"  >
			
					<li class="active">
						<a href="memberServlet?key=dashboard">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Dashboard </span>
						</a>

						<b class="arrow"></b>
					</li>
					<%
						/* permissionBean Perbean=(permissionBean) map.get("Administration");
						if(Perbean.isView()){ */
					%>
					
					
					 	<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								Photos
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

					 	<b class="arrow"></b>

						<ul class="submenu">
							
							<li class="">
								<a href="memberServlet?key=uploadPhotos">
									<i class="menu-icon fa fa-caret-right"></i>
									Upload Photos
								</a>

								<b class="arrow"></b>
							</li> 

						</ul> 
					</li>
					
				<!-- 	<li >
						<a href="memberServlet?key=addStory">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Add Story </span>
						</a>

						<b class="arrow"></b>
					</li> -->
					
					<li >
						<a href="memberServlet?key=updateProfile">
							<!-- <i class="menu-icon fa fa-tachometer"></i> -->
							<span class="menu-text"> Update Profile </span>
						</a>

						<b class="arrow"></b>
					</li>
					
					
					<li >
						<a href="contentMemberServlet?key=requesInterestedList&<%=bean.getId() %>">
							<!-- <i class="menu-icon fa fa-tachometer"></i> -->
							<span class="menu-text">Sent Request List </span>
						</a>

						<b class="arrow"></b>
					</li>
					
				
					<!-- Members menu finished -->


				</ul><!-- /.nav-list -->			
			</div>
<script>

$(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.profile-pic').attr('src', e.target.result);
            }
    			
            reader.readAsDataURL(input.files[0]);
        }
        
        alert(document.getElementById("profileImg").toString());
    }
    

    $(".file-upload").on('change', function(){
        readURL(this);
    });
    
    $(".upload-button").on('click', function() {
       $(".file-upload").click();
    });
});

</script>