<%@page import="com.hp.verify_activation"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.HibernateUtil"%>
<%@page import="com.hp.AuthTable"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%-- HttpServletRequest request1=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

String adf=null;
String authid1=null;  

        try{  
            Session s = HibernateUtil.getSessionFactory().openSession();
        
          verify_activation v=new verify_activation();
         Cookie cookie = null;
         Cookie[] cookies = null;
       String ch;
      
       int cp;
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
            out.println("<h2> Found Cookies Name and Value</h2>");
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               
              
               
               if(cookie.getName().equals("aothk")){
              out.print("Value: " + cookie.getValue( )+" <br/>");
        cp=new Integer(cookie.getValue());
        AuthTable as=(AuthTable)s.get(AuthTable.class,cp);
        
        if(as.getStatus().equals("active"))
        {adf="yes";}
        else
        {adf="false";}}}}}
        catch(Exception e){}
      out.print(adf);
     
 --%>
<html><head>
   

     


    </head>
    <body >
       
        <table style="float: right">  
            <sb:head/>
            <tr><td style="width: 10px" class="container"> 
                    <div id="jklm">     <p>    <font color="WHITE" face="bold" size="5">New To TakeaJob</font></p>
                    <p>
                            <a href="jSIGNUP"> <button type="button" class="btn btn-info">
      <span class="glyphicon glyphicon-pencil"></span> Register with us
                                </button></a>
                        </p>  
                       <font color="WHITE" face="bold" size="5">-------OR-------</font></p>
          <p>
                 <a href="jSIGNUP"> <button type="button" class="btn btn-info">
      <span class="glyphicon glyphicon-pencil"></span> Upload Resume
                     </button> </a>          
                 </p>
            
            <!--input type="hidden" name="hiddenTemp1" id="hiddenTemp1" value="<%--=adf%--%>" -->   
            </form>  
                    </div>
         
                    
                    
                  <!--  <script>
                        if(document.getElementById("hiddenTemp1").value!==null){
                      if (document.getElementById("hiddenTemp1").value==="yes") {
                          
  document.getElementById('jklm').style.display = "none"; 
}  
                        }

                        
                        
                        
                    </script>-->
         </td>
                    
                    
                    
  <!--<input type=button value="Register with us"/>--><!--</td><td style="width: 10px;text-align: center;"><p style="color: blue; display: inline;">OR</p>&nbsp;</td>&nbsp;<td style="width: 10px" >
                  <!--  <form action="jSIGNUP"><input type="button" value="Upload Resume" class="btn btn-info"> <span class="glyphicon glyphicon-pencil"></span> Register with --></tr>
            <tr> <td>  
                    
                    
                    
                    <form action="login" method="post" >
   <div width=100% class="input-group input-group-lg">
  <span class="input-group-addon glyphicon glyphicon-user"></span>
  <input type="text"  name="user" label="username" class="form-control" placeholder="Username"/>
</div>
  <div width=100% class="input-group input-group-lg">   <span class="input-group-addon glyphicon glyphicon-lock "></span> 
       <input type="password" name="pass" label="Password" class="form-control" placeholder="Password" pattern=".{6,}" title="Six or more characters"/>
       </div>
    <p><button type="submit" class="btn btn-info" >
      <span class="glyphicon glyphicon-certificate"></span> Login
    </button>
   
</form></td></tr></table>
            
</body>
</html>