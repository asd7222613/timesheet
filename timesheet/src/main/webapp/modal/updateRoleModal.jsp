<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">编辑用户信息</h4>
</div>
<div class="modal-body">
	<form class="form-horizontal">
		<input type="hidden" id="updateRoleId" name="id" value="${param.roleId}" />
		<div class="form-group">
			<label for="updateRoleName" class="col-sm-2 control-label">角色名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="updateRoleName" name="roleName"
					value="${param.roleName}" placeholder="请输入角色名">
			</div>
		</div>
		<div class="form-group">
			<label for="updateRoleDesc" class="col-sm-2 control-label">角色描述</label>
			<div class="col-sm-10">
				<textarea rows="3" class="form-control" id="updateRoleDesc" name="roleDesc"
					placeholder="请输入角色描述">${param.roleDesc}</textarea>
			</div>
		</div>

	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	<button type="button" class="btn btn-info" onclick="updateRoleInfo()">保存</button>
</div>