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
		<input type="hidden" id="updateUserId" value="${param.id}">
		<div class="form-group">
			<label for="updateUserPassword" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="updateUserPassword"
					placeholder="请输入密码">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="confirmUpdateUserPassword"
					placeholder="请再次输入密码">
			</div>
		</div>
		
		<div class="form-group">
			<label for="updateRealName" class="col-sm-2 control-label">真实姓名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="updateRealName"
					placeholder="请输入真实姓名" value="${param.realName}">
			</div>
		</div>

		<div class="form-group">
			<label for="updateUserEmail" class="col-sm-2 control-label">邮箱</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="updateUserEmail"
					placeholder="请输入邮箱" value="${param.userEmail}">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">角色</label>
			<div class="col-sm-10">
				<select class="form-control">
					<option>普通员工</option>
					<option>部门经理</option>
					<option>部门领导</option>
					<option>总经理</option>
					<option>系统管理员</option>
				</select>
			</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	<button type="button" class="btn btn-info" onclick="updateUserInfo()">保存</button>
</div>