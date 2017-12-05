/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hp;

import com.lambdaworks.crypto.SCryptUtil;
import static com.hp.EncryptUtils.base64encode;
import static com.hp.EncryptUtils.xorMessage;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.hibernate.Session;

/**
 *
 * @author Ruchir Gupta
 */
public class AddNewEmpAction extends ActionSupport{
     SessionMap<String, String>sessionmap;
    private String user;
    private String pass;
    private String email;

    @Override
    public String execute() throws Exception {         
        try{
    Session s= HibernateUtil.getSessionFactory().openSession();
        String generatedSecuredPasswordHash = SCryptUtil.scrypt(pass, 16, 16, 16);
        Login l=new Login(user, generatedSecuredPasswordHash, email);
        s.save(l);
        s.beginTransaction().commit();
        AuthTable at=new AuthTable(l,"deactive");
        s.save(at);
        s.beginTransaction().commit();
        Emailer e=new Emailer();
        e.setFrom("shivamshuklashivam29@gmail.com");
        e.setPassword("karmavesh@96VIBES");
        e.setTo(email);
        e.setSubject("Activation Link!");
        
        String Activation_link=base64encode(xorMessage(at.getAuthId()+";"+l.getUser(),"_@ct!v@tE")) ;  //SCryptUtil.scrypt(at.getAuthId()+";"+l.getUser(), 16, 16, 16);
        String Body=" Greetings of the Day,\nDear "+user+",\n Your Login User Id is "+l.getLoginid()
                +",\n Your Password is "+pass
                +" ,\n Following is the Activation Link Please click and activate your account! Enjoy...\n"
                +"http://localhost:8084/FindyourJobs_/verify_activation.action?New_key="+generateCaptchaString()
                +"&link="+Activation_link
                +"&Encrypt_uid="+generateCaptchaString();
        e.setBody(Body);
        String execute=e.execute();
        s.close();
        if(execute.equals("SUCCESS"))
            return SUCCESS;
        else
            return ERROR;
        }
        catch (Exception e){
           
            return ERROR;
        }        
    }

    
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    public static String generateCaptchaString() {
	int length = 7 + (Math.abs((int)(Math.random()*100000)) % 3);

	StringBuffer captchaStringBuffer = new StringBuffer();
	for (int i = 0; i < length; i++) {
		int baseCharNumber = Math.abs((int)(Math.random()*100000)) % 62;
		int charNumber = 0;
		if (baseCharNumber < 26) {
			charNumber = 65 + baseCharNumber;
		}
		else if (baseCharNumber < 52){
			charNumber = 97 + (baseCharNumber - 26);
		}
		else {
			charNumber = 48 + (baseCharNumber - 52);
		}
		captchaStringBuffer.append((char)charNumber);
	}

	return captchaStringBuffer.toString();
}
    
  
}