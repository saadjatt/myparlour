<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<script src='js/jquery.js'></script>



<script type="text/javascript">
$(document).ready(function(){
	document.getElementById('update').disabled = true;
	document.getElementById('delete').disabled = true;

	$('#add').click(function(){
		alert('ok');
		})
})
</script>


</head>
<body>
	<div class="container">

		<h2>Our Services</h2>
		<div class="row">
			<div class="col-md-4">
				<form action="/action_page.php">
					<div class="form-group">
						<label for="name">Service Name:</label> <input type="text"
							class="form-control" id="name" placeholder="" name="name">
					</div>
					<div class="form-group">
						<label for="cost">Cost:</label> <input type="number"
							class="form-control" id="cost" placeholder="" name="cost">
					</div>
		
					<button type="button" class="btn btn-default" id='add'>Add</button>
					<button type="button" class="btn btn-default" id='update'>Update</button>
					<button type="button" class="btn btn-default" id='delete'>Delete</button>
					
				</form>
			</div>
			<div class="col-md-8">
				<table class="table table-dark table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Cost</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>john@example.com</td>
						</tr>
						<tr>
							<td>Mary</td>
							<td>Moe</td>
							<td>mary@example.com</td>
						</tr>
						<tr>
							<td>July</td>
							<td>Dooley</td>
							<td>july@example.com</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>