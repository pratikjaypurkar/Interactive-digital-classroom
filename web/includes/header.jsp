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
								<li class="nav-item <% if(pageName.equals("home.jsp")){ out.println("active"); } %>"><a href="home.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Home</a></li>
                                                                <li class="nav-item <% if(pageName.equals("login.jsp")){ out.println("active"); } %>"><a href="login.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Login</a></li>
								<li class="nav-item <% if(pageName.equals("registration.jsp")){ out.println("active"); } %>"><a href="registration.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Registration</a></li>
								<li class="nav-item <% if(pageName.equals("feedback.jsp")){ out.println("active"); } %>"><a href="feedback.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">News</a></li>
								<li class="nav-item <% if(pageName.equals("staff.jsp")){ out.println("active"); } %>"><a href="staff.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Staff Details</a></li>
								<li class="nav-item <% if(pageName.equals("notification.jsp")){ out.println("active"); } %>"><a href="notification.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Notifications</a></li>
								<li class="nav-item <% if(pageName.equals("admin.jsp")){ out.println("active"); } %>"><a href="admin.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Admin</a></li>
                                                                <li class="nav-item <% if(pageName.equals("contact.jsp")){ out.println("active"); } %>"><a href="contact.jsp" class="nav-link text-uppercase font-weight-bold js-scroll-trigger">Contact Us</a></li>
                                                                

							</ul>
						</div><!-- /.navbar-collapse -->
						</div><!-- /.container-fluid -->
					</nav>

					
				</div>
				
			</div>
			</div>