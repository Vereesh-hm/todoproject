<%@page import="dto.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
div {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
</style>
<meta charset="ISO-8859-1">
<title>Todo Home</title>
</head>
<body>   
     <%
	List<Task> list = (List<Task>) request.getAttribute("list");
	%>
	<div>
		<h1>Todo Home</h1>
		<table border="1px solid black">
			<tr>
				<th>Task Name</th>
				<th>Task Description</th>
				<th>Date Created</th>
				<th>Status</th>
				<th>Delete</th>
				<th>Edit</th>
			</tr>
			<%
			   if(list!=null)
			   {
			    for(Task task:list){%>
			<tr>
				<th><%=task.getName()%></th>
				<th><%=task.getDescription()%></th>
				<th><%=task.getCreatedTime()%></th>
		<th>	<%
					if (task.isStatus()) 
					{
					%> Completed <%
					}
					else {
					%>
					<%-- Url rewriting for carrying primary key --%>
					<a href="change-status?id=<%=task.getId()%>"><button>Complete</button></a> <%
 }
 %>
				</th>
				
				<th><a href="delete?id=<%=task.getId()%>"><button>Delete</button></a></th>
				<th><button>Edit</button></th>
			</tr>
			<%} }%>
		</table>
		<br>
		<a href="session-add-task"><button>Add Task</button></a><br>
		<a href="logout"><button>Logout</button></a>
	</div>
</body>
</html>
