<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">提示信息</h4>
	<input type="hidden" id="deleteUserId" value="${param.userId}">
</div>
<div class="modal-body">确定要删除该用户吗?</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="btn btn-info" onclick="deleteUserInfo()">确认</button>
</div>