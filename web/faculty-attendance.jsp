<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
	<%@ include file="includes/header-faculty.jsp" %>		
			
			<div id="section5" class="Material-contact-section section-dark">
				<div class="col-md-12  noPadding">
                                    
					<div class="row">
                                            
                                            <div class="col-md-1"></div>
						<div class="col-md-10">
                                                
                                                   <div class="col-md-12">
                                                                                             
                                                    <h3 align="left">Attendance</h3><br>
                                                    <div class="col-md-12 bgfrom">
                                                    <table class="table">
                                                        <tr>
                                                            <th align="center">Date</th><th align="right" style="text-align: center;">Attendance</th><th>Status</th>
                                                        </tr>
                                                                    <%
                                                Calendar cal = Calendar.getInstance();
                                                int month = cal.get(Calendar.MONTH);
                                                Database db=new Database();
                                                cal.set(Calendar.MONTH, month);
                                                cal.set(Calendar.DAY_OF_MONTH, 1);
                                                int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                                                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                                System.out.print(df.format(cal.getTime()));
                                                for (int i = 0; i < maxDay; i++) {
                                                    cal.set(Calendar.DAY_OF_MONTH, i + 1);
//                                                    out.println(df.format(cal.getTime()));
                                                        int id=(Integer)session.getAttribute("facultylogin");
                                                        String dt=df.format(cal.getTime());
                                                        ResultSet rs=db.getFacultyAttendance(id, dt);
                                                        String st="";
                                                        String ver="";
                                                        if(rs.next()){
                                                            st="checked";
                                                            ver=rs.getString("verify");
                                                        }
                                                    %>
                                                    <tr>
                                                            <th align="center"><%=dt%></th>
                                                            <td align="center">
                                                                <input type="checkbox" <%=st%> value="<%=dt%>" onclick="addattence('<%=dt%>');" class="form-control">
                                                            </td>
                                                            <td><%=ver%></td>
                                                        </tr>
                                                    <%
                                                }
                                                    %>
                                                    
                                                        
                                                    </table>
                                                      
                                                  
                                                    </div>
                                    
						</div>
                                                </div>
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
    <script>
        function addattence(date){
            
            $.ajax({
                type: "POST",
                url: "includes/WebService.jsp",
                data: {"date":date,'action':'addfacattence'},
                dataType : 'json',
                success:function(response){
                    console.log(response);
                   
                }
            });
        }
    </script>
  </body>
</html>