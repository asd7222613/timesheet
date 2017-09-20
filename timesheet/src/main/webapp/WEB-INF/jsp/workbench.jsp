<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" charset="utf-8" content="width=device-width, initial-scale=1">
    <%@ include file="/commonCSS.jsp"%>
    <%@ include file="/commonJS.jsp"%>
</head>
<body>
	<div class="row">
		<div class="col-xs-12">
			<div class="card">
				<div class="card-header">
					<div class="card-title">
						<div class="title">
							<small>本周已填写工时</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div>
						<div class="table-responsive">
							<table class="table table-bordered table-striped text-center">

								<tr>
									<td>日期</td>
									<td>天</td>
									<td>创建时间</td>
									<td>操作</td>
								</tr>
								<tr>
									<td>2017-9-11</td>
									<td>星期一</td>
									<td>2017-9-11 12:30</td>
									<td>
										<button type="button" class="btn btn-primary btn-sm">
											<small>编辑</small>
										</button>
										<button type="button" class="btn btn-danger btn-sm">
											<small>删除</small>
										</button>
									</td>
								</tr>

								<tr>
									<td>2017-9-12</td>
									<td>星期二</td>
									<td>2017-9-12 12:30</td>
									<td>
										<button type="button" class="btn btn-primary btn-sm">
											<small>编辑</small>
										</button>
										<button type="button" class="btn btn-danger btn-sm">
											<small>删除</small>
										</button>
									</td>
								</tr>

								<tr>
									<td>2017-9-13</td>
									<td>星期三</td>
									<td>2017-9-13 12:30</td>
									<td>
										<button type="button" class="btn btn-primary btn-sm">
											<small>编辑</small>
										</button>
										<button type="button" class="btn btn-danger btn-sm">
											<small>删除</small>
										</button>
									</td>
								</tr>

								<tr>
									<td>2017-9-14</td>
									<td>星期五</td>
									<td>2017-9-14 12:30</td>
									<td>
										<button type="button" class="btn btn-primary btn-sm">
											<small>编辑</small>
										</button>
										<button type="button" class="btn btn-danger btn-sm">
											<small>删除</small>
										</button>
									</td>
								</tr>

								<tr>
									<td>2017-9-15</td>
									<td>星期五</td>
									<td>2017-9-15 12:30</td>
									<td>
										<button type="button" class="btn btn-primary btn-sm">
											<small>编辑</small>
										</button>
										<button type="button" class="btn btn-danger btn-sm">
											<small>删除</small>
										</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="card">
				<div class="card-header">
					<div class="card-title">
						<div class="title">
							<small>待完成休假审批</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div>
						<div class="table-responsive">
							<table class="table table-bordered table-striped text-center">

								<tr>
									<td>提交审批日期</td>
									<td>休假原因</td>
									<td>当前审批进度</td>
									<td>申请时间</td>
									<td>操作</td>
								</tr>
								<tr>
									<td>2017-9-11 12:31</td>
									<td>家里有事</td>
									<td>人事部门审批</td>
									<td>2017-8-31:14:00</td>
									<td>
										<button type="button" class="btn btn-primary btn-sm">
											<small>查看审批流程</small>
										</button>
									</td>
								</tr>

								<tr>
									<td>2017-9-11 12:31</td>
									<td>家里有事</td>
									<td>调休</td>
									<td>2017-8-31:14:00</td>
									<td>
										<button type="button" class="btn btn-primary btn-sm">
											<small>查看审批流程</small>
										</button>
									</td>
								</tr>

								<tr>
									<td>2017-9-11 12:31</td>
									<td>身体不适</td>
									<td>人事部门审批</td>
									<td>2017-8-31:14:00</td>
									<td>
										<button type="button" class="btn btn-primary btn-sm">
											<small>查看审批流程</small>
										</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
