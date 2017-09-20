<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <title>休假申请</title>
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
								<small>休假申请</small>
							</div>
						</div>
					</div>
					<div class="card-body">
						<form class="form-horizontal" action="${pageContext.request.contextPath}/vacation/submitApply" method="post">
							<div class="form-group">
								<label for="startDate" class="col-sm-2 control-label">休假开始日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control datepicker" id="startDate" name="startTime" value="<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd hh:mm:ss"/>" placeholder="请选择休假开始日期">
								</div>
							</div>
							<div class="form-group">
								<label for="endDate" class="col-sm-2 control-label">休假结束日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control datepicker" id="endDate" name="endTime" value="<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd hh:mm:ss"/>" placeholder="请选择休假结束日期">
								</div>
							</div>
		
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">休假事因</label>								<div class="col-sm-10">
									<textarea name="reason" class="form-control" rows="3" placeholder="休假事因"></textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">审批人</label>
								<div class="col-sm-10">
									<select class="form-control" name="approvalUserId">
									<c:forEach var="user" items="${list}">
										<option value="${user.id}">${user.realName}</option>
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
		<script>
			$(function() {
				 $('.datepicker').on('show.daterangepicker', function(ev, picker) {
					
				 });
				 
				 $('.datepicker').on('apply.daterangepicker', function(ev, picker) {
					 $(this).val(picker.endDate.format('YYYY-MM-DD h:mm:ss'));
				 });
				 
				 $(".datepicker").daterangepicker({
				        singleDatePicker: true,
				        showDropdowns: true,
				        timePicker: true,
				        timePickerSeconds: true,
				        timePicker24Hour: true,
				        autoUpdateInput: false,
				        locale: {
				            "applyLabel": "确定",
				            "cancelLabel": "取消",
				            "format": "YYYY-MM-DD h:mm:ss",
				            "daysOfWeek": [
				                "日",
				                "一",
				                "二",
				                "三",
				                "四",
				                "五",
				                "六"
				            ],
				            "monthNames": [
				                "1月",
				                "2月",
				                "3月",
				                "4月",
				                "5月",
				                "6月",
				                "7月",
				                "8月",
				                "9月",
				                "10月",
				                "11月",
				                "12月"
				            ]
				        }
				    });
			});    
	</script>
	</body>
</html>
