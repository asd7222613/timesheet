<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	    		}
	    </style>
	</head>
	<body>
		<div class="row">
		<div class="col-xs-12">
			<div class="card">
				<div class="card-header">
					<div class="card-title">
						<div class="title">
							<small>新增角色信息</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/role/add" method="post">
						<div class="form-group">
							<label for="roleName" class="col-sm-2 control-label">角色名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="roleName" name="roleName" placeholder="请输入角色名称">
							</div>
						</div>
						<div class="form-group">
							<label for="roleDesc" class="col-sm-2 control-label">角色描述</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="roleDesc" name="roleDesc"
									placeholder="请输入角色描述">
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
	</body>
</html>