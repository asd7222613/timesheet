<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<small>角色信息</small>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div id="searchArea" style="margin-bottom: 20px">
					<form class="form-inline" action="${pageContext.request.contextPath}/role/list" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="roleName" placeholder="角色名称">
                        </div>
                        <button type="submit" class="btn btn-info btn-sm">查询</button>
                    </form>
				</div>
				<div>
					<div class="table-responsive">
						<table id="roleTable" class="table table-bordered table-striped text-center">
							<tr>
								<th>角色名称</th>
								<th>角色描述</th>
								<th>创建时间</th>
								<th>操作</th>
		
							<c:forEach var="role" items="${pagination.result}">
								<tr>
									<td>${role.roleName}</td>
									<td>${role.roleDesc}</td>
									<td><fmt:formatDate value="${role.createTime}" type="both"/></td>
									<td>
										<button type="button" class="btn btn-primary btn-sm" onclick="updateRole(${role.id},'${role.roleName}','${role.roleDesc}')"><small>编辑</small></button>
										<button type="button" class="btn btn-danger btn-sm" onclick="confirmDeleteRole(${role.id})"><small>删除</small></button>
										<button type="button" class="btn btn-info btn-sm" onclick='setPermissions(${role.id})'><small>权限分配</small></button>
									</td>
								</tr>
							</c:forEach>
						</table>
						<nav id="pager">
							<ul class="pager" style="text-align:left">
								<li style="margin-right: 150px">共有${pagination.totalCount}条数据，每页显示${pagination.pageSize}条，当前第${pagination.currentPage}页</li>
								<li><a href="${pageContext.request.contextPath}/role/list?currentPage=1">首页</a></li>
								<li><a href="${pageContext.request.contextPath}/role/list?currentPage=${pagination.currentPage - 1}">上一页</a></li>
								<li><a href="${pageContext.request.contextPath}/role/list?currentPage=${pagination.currentPage + 1}">下一页</a></li>
								<li><a href="${pageContext.request.contextPath}/role/list?currentPage=${pagination.totalPage}">尾页</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function setPermissions(roleId) {
		parent.setPermissions(roleId);
	}
	
	function updateRole(roleId,roleName,roleDesc) {
		parent.updateRole(roleId,roleName,roleDesc);
	}
	
	function confirmDeleteRole(roleId) {
		parent.confirmDeleteRole(roleId);
	}
</script>
</body>
</html>
