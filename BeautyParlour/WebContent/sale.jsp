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
.btn-primary:hover {
    background-color: #5cb85c !important;
}
</style>


<script type="text/javascript">
$(document).ready(function(){
	
	


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
				table+="<tr><th>SR.No</th><th>Name</th><th>Cost</th><th>Add to Cart</th></tr>";
				table+="</thead>";
				var object=JSON.parse(data);
				var i=0;
				for(x in object){
					i++;
				table+="<tr ><td>"+i+"</td>";
				table+="<td> "+object[x].name+"</td>";
				table+="<td>"+object[x].cost+"</td>";
				table+="<td><button value='"+object[x].id+"' id='addcart' class='addcart btn btn-primary'>>></button>";
				
			//	var a=object[x].studentsubject;
				//for(p in a){
					//alert(a[p].name);
				//}
				table+="</tr>";
				}

				 table+="</table>";		
				$(".data").html(table);
				
			},
			error:function(data){
				
				$(".data").html("okzzz");

			}
			
			
		});	
	}//get All record closed


	getAllRecords();


	$(document).on("click",".addcart",function(e){



	$.ajax({
		url:'ServiceServlet',
		type:'post',
		data:{
			id:e.target.value,
			method:"getSingleRecord",
		},
		success:function(data){
			var object=JSON.parse(data);
			$("#item").val(object[0].name);
			$("#cost").val(object[0].cost);


			
			

			
		} //success
	});


		})

		var total=Number("");
		$(document).on("click","#addtolist",function(e){
		var name = $("#item").val();
		var cost=$("#cost").val();
		

			let table="<tr ><td>1</td>";
		table+="<td> "+name+"</td>";
		table+="<td>"+cost+"</td>";
		
		
	//	var a=object[x].studentsubject;
		//for(p in a){
			//alert(a[p].name);
		//}
		table+="</tr>";
		total+=parseFloat(cost);
		 $("#item").val("");
		 $("#cost").val("");
		
		$('#grandtotal').val(total);
		$('#itemtable').append(table);
		
		
		

		

			})//add to list closed
		
}) //ready function closed
</script>


</head>
<body>
	<div class="container">

		<h2>Sale Page</h2>
		<div class="row">
			<div class="data col-md-4">
					</div>
					
			<div class="col-sm-4">
			<form action="/action_page.php">
					<div class="form-group ">
					    
						<label for="name">Item:</label> <input type="text"
							class="form-control" id="item" placeholder="Add Item...." name="item" disabled>
					</div>
					<div class="form-group">
						<label for="cost">Cost:</label> <input type="number"
							class="form-control" id="cost" placeholder="" name="cost" disabled>
					</div>
					<button type="button" class="btn btn-success form-control" id='addtolist'>Add TO List</button>
					<div class="form-group" style="height:50px;"></div>
					<div class="form-group col-sm-8" >
						<label for="cost">Grand Total:</label> <input type="number"
							class="form-control" id="grandtotal" placeholder="" name="grandtotal" disabled>
					</div>
					
						<div class="form-group" style="height:50px;"></div>
		
					<button type="button" class="btn btn-primary form-control" id=''>Generate Bill Now</button>
					
					
					
				</form>
					</div>		
					
			<div class="col-md-4">
				<table class='table table-dark table-hover'>
				<thead>
				<tr><th>SR.No</th><th>Name</th><th>Cost</th></tr>
				</thead>
				<tbody id="itemtable" >
				</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>