<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Interactive Digital Classroom</title>
	<link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="favicon-16x16.png" sizes="16x16" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap&subset=latin-ext" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

  </head>
  <body>
			<%@ include file="includes/header.jsp" %>
			
			<div id="section4" class="col-md-12 noPadding text-center">
			<div id="myCarouselNew">
				<h2 class="mainText">Notifications</h2>
				<img src="img/shapegreen.png">
                                <%
                                  
                                Database db=new Database();
                                %>
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
                                            <%
                                  
                                try{
                                    int j=0;
                                    ResultSet rss=db.getNews();
                                    while(rss.next()){
                                    %>
                                    <li data-target="#myCarousel" data-slide-to="<%=j%>" class="<% if(j==0){ %> active <% } %>"></li>
                                    <%
                                        j++;
                                       }
                                    }catch(Exception e){

                                    }
                                    %>
						
					</ol>   
					<!-- Wrapper for carousel items -->
					<div class="carousel-inner">	
                                <%
                                  
                                try{
                                    int i=1;
                                    ResultSet rs=db.getNews();
                                    while(rs.next()){
                                    %>
                                    <div class="item carousel-item <% if(i==1){ %> active <% } %>"><br>
							<p class="testimonial"><%=rs.getString("description")%></p>
							<p class="overview"><b><%=rs.getString("title")%></b></p>
							
						</div>
                                    <%
                                        i++;
                                       }
                                    }catch(Exception e){

                                    }
                                    %>
		
					</div>
					<!-- Carousel controls -->
					<a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
						<i class="fa fa-angle-left"></i>
					</a>
					<a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
						<i class="fa fa-angle-right"></i>
					</a>
				</div>
			  </div>
		   </div>
		<%@ include file="includes/footer.jsp" %>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-easing/jquery.easing.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/ajax-mail.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>