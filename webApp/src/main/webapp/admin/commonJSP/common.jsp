
<%
    String login = (String)session.getAttribute("login");
    if(login == null){
        response.sendRedirect("login.jsp");
        return;
    }
    if(login.equals("loginSuccess")){

    }else {
        response.sendRedirect("login.jsp");
    }
%>
