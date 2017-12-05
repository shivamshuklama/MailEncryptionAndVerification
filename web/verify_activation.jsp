

<%@page import="com.hp.AuthTable"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.hp.HibernateUtil"%>
<%@page import="static com.hp.EncryptUtils.base64decode"%>
<%@page import="static com.hp.EncryptUtils.xorMessage"%>

<%
    try {
        String Activation_link = request.getParameter("link");
        System.out.println(Activation_link+" _ "+xorMessage(base64decode(Activation_link), "_@ct!v@tE"));
        System.out.println(Activation_link != null);
        if (Activation_link != null) {
            String decoded = xorMessage(base64decode(Activation_link), "_@ct!v@tE");
            System.out.println(decoded);
            String authId = decoded.substring(0, decoded.indexOf(';'));
            String user = decoded.substring(decoded.indexOf(';') + 1);
            System.out.println(decoded+" "+authId+" "+user);
            Session s = HibernateUtil.getSessionFactory().openSession();
            System.out.println(s);
            System.out.println("...");
            Integer intAuthId = new Integer(authId);
            AuthTable at = (AuthTable)s.get(AuthTable.class, intAuthId);
                        System.out.println("_...");
            System.out.println(at.getAuthId());
            System.out.println(at.getStatus());
            if (at!= null && at.getLogin().getUser().equals(user)) {
                at.setStatus("active");
                s.save(at);
                s.beginTransaction().commit();
                System.out.println(at.getStatus());
                s.close();
                response.sendRedirect("account_activated.jsp");
            } else {
                response.sendRedirect("activation_Failed.jsp");
            }

        } else {
            response.sendRedirect("Error.jsp");
        }
    } catch (Exception e) {
        System.out.println(e.getStackTrace());
        response.sendRedirect("Error.jsp");
    }

%>