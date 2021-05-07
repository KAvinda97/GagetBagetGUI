<%@page import="model.FunderServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
			<title>Funder Management - GadgetBadget</title>
	
		<link href="myStyle.css" rel="stylesheet" />
		<link rel="stylesheet" href="Views/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="Components/jquery-3.5.0.min.js"></script>
		<script src="Components/Funder.js"></script>

	</head>
	
	<body>
		<div class="container">
	
			<p class="font-weight-bold">
				<center>
					<h1><u><i><b>Funder Management - GadgetBadget</b></i></u></h1>
				</center>
			</p>
			<br><br>
			
			<fieldset>
	
				<legend><b>Add Funder Details</b></legend>
					<form id="Funder" name="Funder" class="border border-light p-5">
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Funder Name:</label>
						    <input type="text" id="funderName" class="form-control" name="funderName">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Funder Email:</label>
						    <input type="text" id="funderEmail" class="form-control" name="funderEmail">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Funder Telephone No:</label>
						    <input type="text" id="funderTel" class="form-control" name="funderTel">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Gender:</label>
						    <input type="text" id="funderGender" class="form-control" name="funderGender">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Donation:</label>
						    <input type="text" id="funderDonation" class="form-control" name="funderDonation">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Description:</label>
						    <input type="text" id="funderDesc" class="form-control" name="funderDesc">						    
						</div>
										
						<br> 
						
						<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary btn-lg btn-block"> 
						<input type="hidden" id="hidFunderIDSave" name="hidFunderIDSave" value="">
					</form>
				
					<div id="alertSuccess" class="alert alert-success"></div>
					<div id="alertError" class="alert alert-danger"></div>			
			</fieldset>
			
			<br> 
			
			<div class="container" id="FunderGrid">
				<fieldset>
					<legend><b>View Funder Details</b></legend>
					<form method="post" action="Funder.jsp" class="table table-striped">
						<%
							FunderServlet viewFunder = new FunderServlet();
							out.print(viewFunder.readFunders());
						%>
					</form>
					<br>
				</fieldset>
			</div>
		</div>
	</body>
</html>



