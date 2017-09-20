<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>系统主页</title>
<meta name="viewport" charset="utf-8"
	content="width=device-width, initial-scale=1">
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
							<small>新增项目信息</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">项目名称</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputEmail3"
									placeholder="请输入项目名称">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">项目开始时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword3"
									placeholder="请选择项目开始时间">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">项目结束时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword4"
									placeholder="请选择项目结束时间">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">项目负责人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPasswor"
									placeholder="请选择项目负责人">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">相关人员</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPassword5"
									placeholder="请选择项目相关人员">
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