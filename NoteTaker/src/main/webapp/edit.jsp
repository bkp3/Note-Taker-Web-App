<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

<div class="container">
<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit your note</h1>
		<br>
		<%
		
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		
		Session s= FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		Note note = (Note)s.get(Note.class, noteId);
		
		%>
		
		<!--this is edit form  -->
		<form action="UpdateServlet" method="POST">
		
		<input value="<%=note.getId() %>" name="noteId" type="hidden"/>
		
			<div class="form-group">
				<label for="title">Note Title</label>
				 <input
				 required 
				 value="<%=note.getTitle() %>"
					type="text" class="form-control" id="title"
					name="title" placeholder="Enter here"/>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label> 
				<textarea name="content" required id="content" placeholder="Enter your content here" class="form-control" style="height: 300px;"><%= note.getContent() %></textarea>
			</div>
			
			<div class="text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>
		</form>

</div>

</body>
</html>