<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src='js/jquery.js'></script>
<style type="text/css">
.table-dark {
    color: #fff;
    background-color: #76ace2 !important;
}
.table-dark td, .table-dark th, .table-dark thead th {
    border-color: #f5f7f9;
    cursor:pointer;
}
</style>


<script type="text/javascript">
$(document).ready(function(){
	document.getElementById("updatebtn").style.display="none";
	


	function getAllRecords(){
		$.ajax({
			url:'ServiceServlet',
			type:'post',
			data:{
				method:"getAllRecrods"
			},
			success:function(data){
			
				var table="<table class='table table-dark table-hover'>";
				table+="<thead>";
				table+="<tr><th>Name</th><th>Cost</th><th>Date</th><th>Action</th></tr>";
				table+="</thead>";
				var object=JSON.parse(data);
				var i=0;
				for(x in object){
					i++;
				table+="<tr ><td>"+i+"</td>";
				table+="<td> "+object[x].name+"</td>";
				table+="<td>"+object[x].cost+"</td>";
				table+="<td><button value='"+object[x].id+"' id='edit' class='edit btn btn-primary'>Update</button>/<button value='"+object[x].id+"' class='delete btn btn-danger'>Delete</button></td>";
				
			//	var a=object[x].studentsubject;
				//for(p in a){
					//alert(a[p].name);
				//}
				table+="</tr>";
				}

				 table+="</table>";		
				$("#data").html(table);
				
			},
			error:function(data){
				
				$("#data").html("okzzz");

			}
			
			
		});	
	}//get All record closed


	getAllRecords();

	$(document).on("click","#add",function(e){
		$.ajax({
			url:'ServiceServlet',
			type:'post',
			data:{
				method:"addService",
				name:$("#name").val(),
				cost:$("#cost").val(),	
					
			},
			success:function(data){
				alert(data);
				}

		})//ajax function closed	
		})//add click function closed
		$(document).on("click","#edit",function(e){

			$.ajax({
				url:'ServiceServlet',
				type:'post',
				data:{
					id:e.target.value,
					method:"getSingleRecord",
				},
				success:function(data){
					var object=JSON.parse(data);
					$("#name").val(object[0].name);
					$("#cost").val(object[0].cost);
//					$("#roll").val(object[0].roll);
					document.getElementById("add").style.display="none";
					document.getElementById("updatebtn").style.display="block";
					$("#updatebtn").html('Update');
					$("#updatebtn").click(function(){
						$.ajax({
							url:'ServiceServlet',
							type:'post',
							data:{
								upid:e.target.value,
								name:$("#name").val(),
								cost:$("#cost").val(),
								method:"updateRecord",
							},
							success:function(data){
								$("#name").val("");
								$("#cost").val("");
								getAllRecords();
								
							}
							
							});	
					});		

	
					
				} //success
			});
			

	});

	$(document).on("click",".delete",function(e){

		$.ajax({
			url:'ServiceServlet',
			type:'post',
			data:{
				id:e.target.value,
				method:"getSingleRecord",
			},
			success:function(data){
				var object=JSON.parse(data);
				$("#name").val(object[0].name);
				$("#cost").val(object[0].cost);
//				$("#roll").val(object[0].roll);
				document.getElementById("add").style.display="none";
					document.getElementById("updatebtn").style.display="block";
						$("#updatebtn").html('Delete');
				$("#updatebtn").click(function(){
					$.ajax({
						url:'ServiceServlet',
						type:'post',
						data:{
							delid:e.target.value,
							name:$("#name").val(),
							cost:$("#cost").val(),
							method:"deleteRecord",
						},
						success:function(data){
							$("#name").val("");
							$("#cost").val("");
							getAllRecords();
							
						}
						
						});	
				});		


				
			} //success
		});
		

});


		
		
}) //ready function closed
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
					<button type="button" class="btn btn-default" id='updatebtn'>Update</button>
					
					
				</form>
			</div>
			<div class="col-md-8" id="data">
				
			</div>
		</div>
	</div>

</body>
</html>