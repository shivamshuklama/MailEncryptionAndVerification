<%@taglib prefix="s" uri="/struts-tags" %>
<s:head/>
<s:form action="signup">
    <s:textfield name="user" label="Full Name"/>
    <s:password name="pass" label="Password"/>
    <s:textfield name="email" label="email"/>
    <s:submit value="SignUp"/>
</s:form>