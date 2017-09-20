<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>系统登录</title>
		<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/templatemo_style.css" rel="stylesheet" type="text/css">	
		<style>
			.alert {
				margin-bottom: 0px;
			}
		</style>
	</head>
	<body class="templatemo-bg-gray">
		<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">Time Sheet</h1>
			<form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="${pageContext.request.contextPath}/user/login" method="post">
		        <div class="form-group">
		          <div class="col-xs-12">		            
		            <div class="control-wrapper">
		            	<label for="userAccount" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
		            	<input type="text" class="form-control" id="userAccount" name="userAccount" placeholder="请输入用户名">
		            </div>		            	            
		          </div>              
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		            		<label for="userPassword" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
		            		<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="请输入密码">
		            </div>
		          </div>
		        </div>
		        <c:if test="${errorMessage != null}">
			        	<div class="form-group">
			        		<div class="alert alert-danger text-center" role="alert">用户名或密码不正确，请重新输入</div>
			        </div> 
		        </c:if>  
		        <div class="form-group">
		          <div class="col-md-12">
	             	<div class="checkbox control-wrapper">
	                	<label>
	                  		<input type="checkbox"> 记住我
                		</label>
	              	</div>
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		          		<input type="submit" value="登录" class="btn btn-info">
		          		<a href="forgot-password.html" class="text-right pull-right">忘记密码?</a>
		          	</div>
		          </div>
		        </div>
		      </form>
		      <div class="text-center">
		      	<a href="create-account.html" class="templatemo-create-new">注册新用户<i class="fa fa-arrow-circle-o-right"></i></a>
		      </div>
		</div>
	</div>
	</body>
</html>