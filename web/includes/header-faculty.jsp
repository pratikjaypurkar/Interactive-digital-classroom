                    <%
                        String uri = request.getRequestURI();
                        String pageName = uri.substring(uri.lastIndexOf("/")+1);
                        
                    %>
<div class="col-md-12">
			  <div class="container">
				<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 text-center">
                                    <h1 style="margin: 0px; padding: 20px; font-weight: bold; color: #754104;">Interactive Digital Classroom</h1>
				</div>
				<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 text-center">
					<nav class="navbar navbar-expand-lg navbar-light bg-light myNavbar">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							</div>
						
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav myNavUl">
								<li class="nav-item <% if(pageName.equals("faculty-profile.jsp")){ out.println("active"); } %>"><a href="faculty-profile.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Home</a></li>
								<li class="nav-item <% if(pageName.equals("faculty-notifications.jsp")){ out.println("active"); } %>"><a href="faculty-notifications.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Notifications</a></li>
								<li class="nav-item <% if(pageName.equals("faculty-files.jsp")){ out.println("active"); } %>"><a href="faculty-files.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Files</a></li>
                                                                <li class="nav-item <% if(pageName.equals("faculty-videos.jsp")){ out.println("active"); } %>"><a href="faculty-videos.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Videos</a></li>
                                                                <li class="nav-item <% if(pageName.equals("faculty-students.jsp")){ out.println("active"); } %>"><a href="faculty-students.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Student Attendance</a></li>
                                                                <li class="nav-item <% if(pageName.equals("faculty-attendance.jsp")){ out.println("active"); } %>"><a href="faculty-attendance.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Attendance</a></li>
                                                                <li class="nav-item"><a href="logout.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Logout</a></li>

							</ul>
						</div><!-- /.navbar-collapse -->
						</div><!-- /.container-fluid -->
					</nav>

					
				</div>
				
			</div>
			</div>
      