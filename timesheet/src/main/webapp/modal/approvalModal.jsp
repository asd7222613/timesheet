<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">待办任务审批</h4>
</div>
<div class="modal-body">
	<form class="form-horizontal">
		<input type="hidden" id="taskId" value="${param.id}" />
		<div class="form-group">
			<label class="col-sm-4 control-label">申请人</label>
			<div class="col-sm-8">
				<label class="control-label">${param.realName}</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">休假开始日期</label>
			<div class="col-sm-8">
				<label class="control-label">${param.startTime}</label>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">休假结束日期</label>
			<div class="col-sm-8">
				<label class="control-label">${param.endTime}</label>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">休假事因</label>
			<div class="col-sm-8">
				<label class="control-label">${param.reason}</label>
			</div>
		</div>
		
		<div class="form-group" id="next">
			<label class="col-sm-4 control-label">下级审批人</label>
			<div class="col-sm-8">
				<select class="form-control" id="nextApproval">
				</select>
			</div>
		</div>
		
	</form>
</div>
<div class="modal-footer">
	<a href="#" onclick="approvalResult(false)" class="btn btn-default" data-dismiss="modal">拒绝</a>
	<a href="#" onclick="approvalResult(true)" class="btn btn-info">同意</a>
</div>
<script>
	$.get(
		pageContext+"/vacation/input2",
		function(data) {
			try{
				$.each(data,function(index, val){
					$("#nextApproval").append("<option value="+ val.id + ">" + val.realName + "</option>");
				});
			}catch(e) {
				$("#next").hide();
			}	
		}	
	);
	
	function approvalResult(result) {
		var taskId = $("#taskId").val();
		var nextApprovalUserId = $("#nextApproval").val();
		$.post(
			pageContext+"/vacation/approval",
			{"taskId":taskId,"approvalUserId":nextApprovalUserId,"result":result},
			function(data) {
				if(data == true) {
					$('#setPermissions').modal('hide');
					$("#myContainer").attr("src",pageContext+"/vacation/todoTask");
				}else {
					alert("系统异常");
				}
			}
		);
	}
</script>