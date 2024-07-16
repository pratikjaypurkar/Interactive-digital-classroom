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
								<li class="nav-item <% if(pageName.equals("admin-profile.jsp")){ out.println("active"); } %>"><a href="admin-profile.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Contact List</a></li>
								<li class="nav-item <% if(pageName.equals("admin-students.jsp")){ out.println("active"); } %>"><a href="admin-students.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Students</a></li>
								<li class="nav-item <% if(pageName.equals("admin-faculties.jsp")){ out.println("active"); } %>"><a href="admin-faculties.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Faculties</a></li>
                                                                <li class="nav-item <% if(pageName.equals("admin-faculty-attendance.jsp")){ out.println("active"); } %>"><a href="admin-faculty-attendance.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Faculty Attendance</a></li>
                                                                <li class="nav-item <% if(pageName.equals("admin-feedback.jsp")){ out.println("active"); } %>"><a href="admin-feedback.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">News</a></li>
                                                                <li class="nav-item"><a href="logout.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Logout</a></li>

							</ul>
						</div><!-- /.navbar-collapse -->
						</div><!-- /.container-fluid -->
					</nav>

					
				</div>
				
			</div>
			</div>