<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	height: 30px;
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
							<small>待办任务</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div>
						<div class="table-responsive">
							<table class="table table-bordered table-striped text-center">

								<tr>
									<th>申请人</th>
									<th>休假开始日期</th>
									<th>休假结束日期</th>
									<th>休假事因</th>
									<th>操作</th>
								</tr>
								<c:choose>
									<c:when test="${!empty pagination.result}">
										<c:forEach var="leave" items="${pagination.result}">
											<tr>
												<td>${leave.submitUser.realName}</td>
												<td><fmt:formatDate value="${leave.startTime}" type="both"/></td>
												<td><fmt:formatDate value="${leave.endTime}" type="both"/></td>
												<td>${leave.reason}</td>
												<td>
													<a href="#" onclick="approval(${leave.task.id},'<fmt:formatDate value="${leave.startTime}" type="both"/>','<fmt:formatDate value="${leave.startTime}" type="both"/>','${leave.reason}','${leave.submitUser.realName}')" class="btn btn-primary btn-sm">
														<small>审核</small>
													</a>
													<a href="#" onclick="updateApproval(${leave.id},${leave.task.id})" class="btn btn-info btn-sm">
														<small>调整申请</small>
													</a>
												</td>												
											</tr>
										</c:forEach>
										</table>
										<nav id="pager">
											<ul class="pager" style="text-align:left">
												<li style="margin-right: 150px">共有${pagination.totalCount}条数据，每页显示${pagination.pageSize}条，当前第${pagination.currentPage}页</li>
												<li><a href="${pageContext.request.contextPath}/vacation/todoTask?currentPage=1">首页</a></li>
												<li><a href="${pageContext.request.contextPath}/vacation/todoTask?currentPage=${pagination.currentPage - 1}">上一页</a></li>
												<li><a href="${pageContext.request.contextPath}/vacation/todoTask?currentPage=${pagination.currentPage + 1}">下一页</a></li>
												<li><a href="${pageContext.request.contextPath}/vacation/todoTask?currentPage=${pagination.totalPage}">尾页</a></li>
											</ul>
										</nav>
									</c:when>
									<c:otherwise>
										<tr class="text-center">
											<td colspan="5"><strong>未查询到数据</strong></td>
										</tr>
										</table>
									</c:otherwise>
								</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	function approval(taskId,startTime,endTime,reason,realName) {
		parent.approval(taskId,startTime,endTime,reason,realName);
	}
	
	function updateApproval(leaveId,taskId){
		parent.updateApproval(leaveId,taskId);
	}
	
</script>
</body>
</html>
