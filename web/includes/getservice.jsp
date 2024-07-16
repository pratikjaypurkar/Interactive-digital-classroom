<%
    
    session.setAttribute("name","");
            session.setAttribute("subject","");
            session.setAttribute("year","");
            session.setAttribute("semester","");
            session.invalidate();
    response.sendRedirect("../faculty-files.jsp");
%>