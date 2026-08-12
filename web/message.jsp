<%
    String message=(String)session.getAttribute("message");
    if(message!= null){
        
  %>
  <div class="alert alert-success alert-dismissible mt-3"><button class="btn-close" data-bs-dismiss="alert"></button><%=message%></div>
<%
          session.removeAttribute("message");
    }
%>

