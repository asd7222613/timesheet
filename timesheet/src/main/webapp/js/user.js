function updateUser(userId) {
	$.get(
		pageContext+"/user/findBy/"+userId,
		function(data) {
			$('#setPermissions').modal({
   				remote: pageContext+"/modal/updateUserModal.jsp?id="+data.id+"&realName="+data.realName+"&userEmail="+data.userEmail,
   				show: true
   			});
		}
	);
}

function updateUserInfo() {
	var updateUserId = $("#updateUserId").val();
	var updateUserPassword = $("#updateUserPassword").val();
	var updateRealName = $("#updateRealName").val();
	var updateUserEmail = $("#updateUserEmail").val();
	
	$.post(
		pageContext+"/user/update",
		{"id":updateUserId,"userPassword":updateUserPassword,"realName":updateRealName,"userEmail":updateUserEmail},
		function(data) {
			if(data == true) {
   				$('#setPermissions').modal('hide');
   				$("#myContainer").attr("src",pageContext+"/user/list");
   			}else {
   				alert("系统异常");
   			}
		}
	);
}

function confirmDeleteUser(userId) {
	$('#setPermissions').modal({
			remote: pageContext+"/modal/deleteUserModal.jsp?userId="+userId,
			show: true
	});
}

function deleteUserInfo() {
	var userId = $("#deleteUserId").val();
	$.post(
			pageContext+"/user/delete",
			{"id":userId},
			function(data) {
				if(data == true) {
	   				$('#setPermissions').modal('hide');
	   				$("#myContainer").attr("src",pageContext+"/user/list");
	   			}else {
	   				alert("系统异常");
	   			}
			}	
		);
}
