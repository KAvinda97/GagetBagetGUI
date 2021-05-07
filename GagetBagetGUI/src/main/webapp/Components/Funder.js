//hide alert
$(document).ready(function() {

	$("#alertSuccess").hide();
	$("#alertError").hide();
	$("#hidFunderIDSave").val("");
	$("#Funder")[0].reset();
});

$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
	var type = ($("#hidFunderIDSave").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "FunderAPI",
		type : type,
		data : $("#Funder").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});

});

function onItemSaveComplete(response, status) {
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#FunderGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error") {
		
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
		
	} else {
		
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#hidFunderIDSave").val("");
	$("#Funder")[0].reset();
}

$(document).on("click", ".btnRemove", function(event) {
	
	$.ajax({
		url : "FunderAPI",
		type : "DELETE",
		data : "FunderID=" + $(this).data("FunderID"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

function onItemDeleteComplete(response, status) {
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#FunderGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
		
	} else if (status == "error") {
		
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
		
	} else {
		
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// UPDATE==========================================
$(document).on("click",".btnUpdate",function(event)
		{
			$("#hidFunderIDSave").val($(this).data("FunderID"));
			$("#funderName").val($(this).closest("tr").find('td:eq(0)').text());
			$("#funderEmail").val($(this).closest("tr").find('td:eq(1)').text());
			$("#funderTel").val($(this).closest("tr").find('td:eq(2)').text());
			$("#funderGender").val($(this).closest("tr").find('td:eq(3)').text());
			$("#funderDonation").val($(this).closest("tr").find('td:eq(4)').text());
			$("#funderDesc").val($(this).closest("tr").find('td:eq(5)').text());		
		});


// CLIENTMODEL=========================================================================
function validateItemForm() {
	
	// funderName
	if ($("#funderName").val().trim() == "") {
		return "Please insert funder Name.";
	}
	
	// funderEmail
	if ($("#funderEmail").val().trim() == "") {
		return "Please insert funder Email.";
	}
	
	// funderTel
	if ($("#funderTel").val().trim() == "") {
		return "Please insert funder Telephone.";
	}

	// funderGender
	if ($("#funderGender").val().trim() == "") {
		return "Please insert funder Gender.";
	}
	
	// funderDonation
	if ($("#funderDonation").val().trim() == "") {
		return "Please insert funder Donation.";
	}
	
	// funderDesc
	if ($("#funderDesc").val().trim() == "") {
		return "Please insert funder Desc.";
	}
	
	return true;
}
