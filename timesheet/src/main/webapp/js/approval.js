function approval(taskId,startTime,endTime,reason,realName) {
	$('#setPermissions').modal({
		remote: pageContext+"/modal/approvalModal.jsp?id="+taskId+"&startTime="+escape(startTime)+"&endTime="+escape(startTime)+"&reason="+reason+"&realName="+realName,
		show: true
	});
}

function updateApproval(leaveId,taskId) {
	$('#setPermissions').modal({
		remote: pageContext+"/modal/updateLeaveModal.jsp?id="+leaveId+"&taskId="+taskId,
		show: true
	});
}