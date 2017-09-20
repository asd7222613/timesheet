<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>系统主页</title>
	    <meta name="viewport" charset="utf-8" content="width=device-width, initial-scale=1">
	    <%@ include file="/commonCSS.jsp"%>
	    <%@ include file="/commonJS.jsp"%>
	    <style>
	    		.form-control {
	    			border-radius: 5px;
	    			height: 30px;
	    		}
	    </style>
	</head>
</html>
<div class="row">
	<div class="col-xs-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title">
					<div class="title">
						<small>新增用户信息</small>
					</div>
				</div>
			</div>
			<div class="card-body">
				<form class="form-horizontal" action="${pageContext.request.contextPath}/user/save" method="post">
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userName"
								name="userAccount" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="userPassword" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="userPassword"
								name="userPassword" placeholder="请输入密码">
						</div>
					</div>

					<div class="form-group">
						<label for="confirmUserPassword" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="confirmUserPassword"
								name="confirmUserPassword" placeholder="请再次输入密码">
						</div>
					</div>

					<div class="form-group">
						<label for="realName" class="col-sm-2 control-label">真实姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="realName"
								name="realName" placeholder="请输入真实姓名">
						</div>
					</div>

					<div class="form-group">
						<label for="userEmail" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="userEmail"
								name="userEmail" placeholder="请输入邮箱">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">角色</label>
						<div class="col-sm-10">
							<select class="form-control" name="roleId">
							<c:forEach var="role" items="${list}">
								<option value="${role.id}">${role.roleName}</option>
							</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
