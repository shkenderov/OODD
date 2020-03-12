<%@page import="org.solent.com504.project.impl.service.ServiceObjectFactoryJpaImpl"%>
<%@page import="org.solent.com504.project.model.dto.Role"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="org.solent.com504.project.model.service.ServiceFacade"%>
<%@page import="org.solent.com504.project.impl.web.WebObjectFactory"%>
<%@page import="org.solent.com504.project.impl.service.ServiceFacadeImpl"%>

<%@page import="org.solent.com504.project.model.dto.Person"%> 
<%@page import="org.solent.com504.project.model.dto.Appointment"%> 




<%

    // used to place error message at top of page 
    String errorMessage = "";
    String message = "";

    // used to set html header autoload time. This automatically refreshes the page
    // Set refresh, autoload time every 20 seconds
    response.setIntHeader("Refresh", 20);

    // accessing service 
    ServiceFacade serviceFacade = new ServiceFacadeImpl();
    
    serviceFacade=WebObjectFactory.getServiceFacade();

	// If the user session has no bankApi, create a new one
	String redirectURL = "http://localhost:8084/projectfacadeweb/testHeartbeat.jsp";

 

    // accessing request parameters
    String actionStr = request.getParameter("action");
    List<Appointment> appList=new ArrayList<Appointment>();
    List<Person> personList= new ArrayList<Person>();
    Person tempPerson=new Person();
    tempPerson.setAddress("Address");
    tempPerson.setFirstName("FirstName");
    Long a=new Long(15);
    tempPerson.setId(a);
    tempPerson.setSecondName("SecondName");
    tempPerson.setRole(Role.DENTIST);
    
    //vars for adding a person 
    String pfname=request.getParameter("pfname");
    String psname=request.getParameter("psname");
    String paddress=request.getParameter("paddress");
    

   
    //vars for add appointment
    String appdescr=request.getParameter("appDescr");
    int apphr=0,appmth=0,appday=0,appdur=0;
    
    //vars for onsite and leaving site
    String pid=request.getParameter("personId");
    String siteid=request.getParameter("appId");
    //var for deleting appointment/person
    Long personId=null;
    try
    {
        personId=Long.parseLong(request.getParameter("personId"));
    }
    catch (NumberFormatException nfe)
    {
      System.out.println("NumberFormatException: " + nfe.getMessage());
    }
    Long appId=null;
     try
    {
        appId=Long.parseLong(request.getParameter("appId"));
    }
    catch (NumberFormatException nfe)
    {
      System.out.println("NumberFormatException: " + nfe.getMessage());
    }
    // basic error checking before making a call
    if (actionStr == null || actionStr.isEmpty()) {
        // do nothing

    } else if ("OnSite".equals(actionStr)) {
        serviceFacade.personOnSite(pid, siteid);
        response.sendRedirect(redirectURL);

   
    }
    else if ("LeavingSite".equals(actionStr)) {
        serviceFacade.personLeavingSite(pid, siteid);
        
        response.sendRedirect(redirectURL);
        
    }
    else if("Removeapp".equals(actionStr)) {
        serviceFacade.deleteAppById(appId);
        personList=serviceFacade.findAllPerson();
        appList=serviceFacade.findAllApps();        
        response.sendRedirect(redirectURL);
    }
    else if("deletePerson".equals(actionStr)){

        serviceFacade.deletePersonById(personId);
            
        
        personList=serviceFacade.findAllPerson();
        appList=serviceFacade.findAllApps();
        response.sendRedirect(redirectURL);
            
    }
    else if("addApp".equals(actionStr)){
        try
    {
        apphr=Integer.parseInt(request.getParameter("apphour"));
    }
    catch (NumberFormatException nfe)
    {
      System.out.println("NumberFormatException: " + nfe.getMessage());
    }
    try
    {
        appmth=Integer.parseInt(request.getParameter("appmth"));
    }
    catch (NumberFormatException nfe)
    {
      System.out.println("NumberFormatException: " + nfe.getMessage());
    }
    try
    {
        appday=Integer.parseInt(request.getParameter("appday"));
    }
    catch (NumberFormatException nfe)
    {
      System.out.println("NumberFormatException: " + nfe.getMessage());
    }
    try
    {
        appdur=Integer.parseInt(request.getParameter("appduration"));
    }
    catch (NumberFormatException nfe)
    {
      System.out.println("NumberFormatException: " + nfe.getMessage());
    }
        Appointment atemp=new Appointment();
        atemp.setDescripton(appdescr);
        atemp.setHr(apphr);
        atemp.setMth(appmth);
        atemp.setYr(appday);
        atemp.setDurationMinutes(appdur);
        Person ptemp=new Person();
        ptemp.setAddress(paddress);
        ptemp.setFirstName(pfname);
        ptemp.setSecondName(psname);
        ptemp.setRole(Role.PATIENT);
        serviceFacade.savePerson(ptemp);
        personList=serviceFacade.findAllPerson();

        atemp.setPersonA(ptemp);
        
        
        serviceFacade.saveApp(atemp);

        response.sendRedirect(redirectURL);


    }
    
    else if("addPerson".equals(actionStr)){
        Person ptemp=new Person();
        ptemp.setAddress(paddress);
        ptemp.setFirstName(pfname);
        ptemp.setSecondName(psname);
        ptemp.setRole(Role.DENTIST);
        

        serviceFacade.savePerson(ptemp);
        personList=serviceFacade.findAllPerson();
        appList=serviceFacade.findAllApps();
        response.sendRedirect(redirectURL);
    }
    
        personList=serviceFacade.findAllPerson();
        appList=serviceFacade.findAllApps();
    


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/style.css">

    <div class="heading"><title>JSP Server Page for heart beat</title></div>
    </head>
    <body>
        <!-- works with http://localhost:8080/basicfacadeweb/testHeartbeat.jsp -->
        <H1>JSP Server Page for heart beat</H1>
        <!-- print error message if there is one -->
        <div style="color:red;"><%=errorMessage%></div>
        <div style="color:green;"><%=message%></div>

        <p>The time is: <%= new Date().toString()%> (note page is auto refreshed every 20 seconds)</p>
        
        <p>Getting heartbeat message: <%= serviceFacade.getHeartbeat()%> (note message is auto refreshed every 20 seconds)</p>
        <div class="table_container"><table>
        <tr>
                        <th class="id">id</th>
			<th>first name</th>
			<th>second name</th>
			<th>address</th>
			<th>Role</th>
		</tr>
		<%
			for (Person person : personList) {
		%>
		<tr>
			<td class="id"><%=person.getId()%></td>
			<td><%=((person.getFirstName()==null) ? "":person.getFirstName()) %></td>
			<td><%=((person.getSecondName()==null) ? "":person.getSecondName()) %></td>
                        <td><%=((person.getAddress()==null) ? "":person.getAddress()) %></td>
                        <td><%=((person.getRole()==null) ? "":person.getRole()) %></td>
                        
                        <td><form action="testHeartbeat.jsp">
				<input type="hidden" name="action" value="deletePerson"> 
                                <input type="hidden" name="personId" value="<%=person.getId()%>"> 
				<input type="submit" value="Delete Person">

			</form></td>

		
		</tr>
                
		<%
			}
		%>
                </table>
        </div>
        
        <div class="table_container">
  <table>
        <tr>
			<th class="id">id</th>
			<th>Description</th>
			<th>Patient Name</th>
                        <th>Dentist on site Name</th>

			
			<th>Hour</th>
                        <th>Month</th>
                        <th>Date</th>
                        <th>Duration (minutes)</th>

		</tr>
		<%
			for (Appointment appointment : appList) {
                            String PersonAName="null",PersonBName="null";
                            if(appointment.getPersonA()!=null){
                                PersonAName=((appointment.getPersonA().getSecondName()==null) ? "":appointment.getPersonA().getSecondName());
                            }
                            if(appointment.getPersonB()!=null){
                                PersonBName=((appointment.getPersonB().getSecondName()==null) ? "":appointment.getPersonB().getSecondName());
                            }
		%>
		<tr>
			<td class="id"><%=appointment.getId()%></td>
			<td><%=((appointment.getDescripton()==null) ? "":appointment.getDescripton()) %></td>
			<td><%=PersonAName %></td>
                        <td><%=PersonBName %></td>

                        <td><%=((appointment.getHr()==null) ? "":appointment.getHr()) %></td>
                        <td><%=((appointment.getMth()==null) ? "":appointment.getMth()) %></td>
                        <td><%=((appointment.getYr()==null) ? "":appointment.getYr()) %></td>
			<td><%=((appointment.getDurationMinutes()==null) ? "":appointment.getDurationMinutes()) %></td>
                        
                            <td><form action="testHeartbeat.jsp">
					<input  type="hidden" name="action" value="LeavingSite" > 
                                        <input type="hidden" name="appId" value="<%=appointment.getId()%>"> 
                                        <%if(appointment.getPersonB()!=null){%>
                                        <input type="hidden" name="personId" value="<%=appointment.getPersonB().getId()%>"> <%}
                        %>
                                        <input type="submit" value="Person Leaving Site">
				</form></td>
                                <td> <form action="testHeartbeat.jsp">
					<input type="hidden" name="action" value="Removeapp">
                                        <input type="hidden" name="appId" value="<%=appointment.getId()%>"> 
                                        <input type="submit" value="Remove Appointment">
				</form></td>

		</tr>
		<%
			}
		%>
  </table></div> <div id="onSiteDiv">
      <div class="onsitediv2">
                 <form action="testHeartbeat.jsp">
                                        <input type="textbox" class="textbox"name="personId" placeholder="Enter Worker Id" required > 
                                        <input type="textbox" class="textbox" name="appId" placeholder="Enter Appointment Id" required> 

                                        <input type="hidden" name="action" value="OnSite">
                                        <input type="submit" class="btn" id="onsitebtn" value="Person On Site">
                 </form></div>
      <div class="adddiv">
                <form action="testHeartbeat.jsp">
                    <input type="hidden" name="action" value="AddPersonForm">
                    <input  type="submit" class="btn" value="Add Dentist">
                </form>
                  <form action="testHeartbeat.jsp">
                    <input type="hidden" name="action" value="AddAppointmentForm">
                    <input  type="submit" class="btn" value="Add Appointment">
                  </form></div></div>
                <BR>
                <% if("AddPersonForm".equals(actionStr)){
                    %>
                     <div class="table_container"><table>
                <form action="testHeartbeat.jsp">
                    <td>ADD A DENTIST: <input type="hidden" name="action" value="addPerson" ><td/>
                     
                    <td> Enter first name: <input type="textbox" name="pfname" required></td>
                                 <td> Enter second name: <input type="textbox" name="psname" required></td>
                                <td>  Enter Address: <input type="textbox" name="paddress" required></td>
				<td> <input type="submit" value="Add a Person"></td>
                                
                </form></td>    </table></div>
               
                <%}
                else if("AddAppointmentForm".equals(actionStr)){
                    %>
                   <div class="table_container"> <table>
                
                           <form action="testHeartbeat.jsp">
                    <td>ADD AN APPOINTMENT: <input type="hidden" name="action" value="addApp"><td/>
                    <td> Description: <input type="textbox" name="appDescr" required></td>
                                 <td> Hour: <input type="textbox" name="apphour" required></td>
                                <td>  Month: <input type="textbox" name="appmth" required></td>
                                <td>  day <input type="textbox" name="appday" required></td>
                                <td>duration (minutes) <input type="textbox" name="appduration" required></td>
				<td> <input type="submit" value="Add an Appointment"></td>
                                
                         </table>
                     <table class="table_container2" >
                    <td>ADD THE PATIENT: 
                     
                    <td> Enter first name: <input type="textbox" name="pfname" required></td>
                                 <td> Enter second name: <input type="textbox" name="psname" required></td>
                                <td>  Enter Address: <input type="textbox" name="paddress" required></td>
                                
                                </table></form>
                <%}%>
                


    </body>
</html>
