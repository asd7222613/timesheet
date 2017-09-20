<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">调整申请信息</h4>
</div>
<div class="modal-body">
	<form class="form-horizontal">
		<input type="hidden" id="updateLeaveId" value="" />
		<input type="hidden" id="taskId" value="${param.taskId}" />
		<div class="form-group">
			<label for="updateStartTime" class="col-sm-2 control-label">休假开始日期</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="updateStartTime" name="startTime"
					value="${param.roleName}" placeholder="休假开始日期">
			</div>
		</div>
		
		<div class="form-group">
			<label for="updateEndTime" class="col-sm-2 control-label">休假结束日期</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="updateEndTime" name="endTime"
					value="${param.roleName}" placeholder="休假结束日期">
			</div>
		</div>
		
		<div class="form-group">
			<label for="updateReason" class="col-sm-2 control-label">休假事因</label>								<div class="col-sm-10">
				<textarea id="updateReason" name="reason" class="form-control" rows="3" placeholder="休假事因"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="updateApprovalUserId" class="col-sm-2 control-label">审批人</label>
			<div class="col-sm-10">
				<select class="form-control" id="updateApprovalUserId" name="approvalUserId">
				</select>
			</div>
		</div>

	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	<button type="button" class="btn btn-info" onclick="updateApprovalInfo(true)">保存</button>
</div>
<script>
	$.get(
		pageContext+"/vacation/input3/${param.id}",
		function(data) {
			$("#updateStartTime").val(data.leave.startTime);
			$("#updateEndTime").val(data.leave.endTime);
			$("#updateLeaveId").val(data.leave.id);
			$("#updateReason").val(data.leave.reason);
			
			$.each(data.list, function(index, val){
				$("#updateApprovalUserId").append("<option value="+ val.id +">"+ val.realName +"</option>");
			});
			
		}
	);
	
	function updateApprovalInfo(result){
		var leaveId = $("#updateLeaveId").val();
		var reason = $("#updateReason").val();
		var updateStartTime = $("#updateStartTime").val();
		var updateEndTime = $("#updateEndTime").val();
		var updateApprovalUserId = $("#updateApprovalUserId").val();
		var taskId = $("#taskId").val();
		$.post(
			pageContext+"/vacation/ajaxSubmitApply",
			{"approvalPass":result,"id":leaveId,"taskId":taskId,"reason":reason,"startTime":updateStartTime,"endTime":updateEndTime,"approvalUserId":updateApprovalUserId},
			function(data) {
				if(data == true) {
					$('#setPermissions').modal('hide');
					$("#myContainer").attr("src",pageContext+"/vacation/running");
				}else {
					alert("系统异常");
				}
			}
		);
	}
	
</script>