<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<body>
		<div class="row">
		<div class="col-xs-12">
			<div class="card">
				<div class="card-header">
					<div class="card-title">
						<div class="title">
							<small>用户信息</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div id="searchArea" style="margin-bottom: 20px">
						<form class="form-inline" action="${pageContext.request.contextPath}/user/list" method="post">
	                        <div class="form-group">
	                            <input type="text" style="width: 230px" class="form-control" name="condition" placeholder="用户名\真实姓名\邮箱">
	                        </div>
	                        <button type="submit" class="btn btn-info btn-sm">查询</button>
	                    </form>
					</div>
					<div>
						<div class="table-responsive">
							<table class="table table-bordered table-striped text-center">
								<tr>
									<th>用户名</th>
									<th>真实姓名</th>
									<th>邮箱</th>
									<th>角色</th>
									<th>创建时间</th>
									<th>操作</th>
								</tr>
								<c:forEach var="user" items="${pagination.result}">
									<tr>
										<td>${user.userAccount}</td>
										<td>${user.realName}</td>
										<td>${user.userEmail}</td>
										<td>${user.roleNames}</td>
										<td><fmt:formatDate value="${user.createTime}" type="both"/></td>
										<td>
											<button type="button" class="btn btn-primary btn-sm"
												data-toggle="modal" onclick="updateUser(${user.id})">
												<small>编辑</small>
											</button>
											<button type="button" class="btn btn-danger btn-sm"
												data-toggle="modal" onclick="deleteUser(${user.id})">
												<small>删除</small>
											</button>
										</td>
									</tr>
								</c:forEach>
								
							</table>
							<nav id="pager">
								<ul class="pager" style="text-align:left">
									<li style="margin-right: 150px">共有${pagination.totalCount}条数据，每页显示${pagination.pageSize}条，当前第${pagination.currentPage}页</li>
									<li><a href="${pageContext.request.contextPath}/user/list?currentPage=1">首页</a></li>
									<li><a href="${pageContext.request.contextPath}/user/list?currentPage=${pagination.currentPage - 1}">上一页</a></li>
									<li><a href="${pageContext.request.contextPath}/user/list?currentPage=${pagination.currentPage + 1}">下一页</a></li>
									<li><a href="${pageContext.request.contextPath}/user/list?currentPage=${pagination.totalPage}">尾页</a></li>
								</ul>
							</nav>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	function updateUser(userId) {
		parent.updateUser(userId);
	}
	
	function deleteUser(userId) {
		parent.confirmDeleteUser(userId);
	}

</script>
	</body>
</html>