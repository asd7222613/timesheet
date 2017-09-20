<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
    <title>系统主页</title>
    <meta name="viewport" charset="utf-8" content="width=device-width, initial-scale=1">
    <%@ include file="/commonCSS.jsp"%>
    <%@ include file="/commonJS.jsp"%>
</head>
<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-default navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <ol class="breadcrumb navbar-breadcrumb">
                            <li class="active">TimeSheet</li>
                        </ol>
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="title">
                                    Notification <span class="badge pull-right">0</span>
                                </li>
                                <li class="message">
                                    No new notification
                                </li>
                            </ul>
                        </li> 
                        <li class="dropdown profile">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${currentUser.realName}<span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="profile-img">
                                    <img src="../img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username">${currentUser.realName}</h4>
                                        <p>${currentUser.userEmail}</p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <a href="#" class="btn btn-default"><i class="fa fa-user"></i>个人信息</a>                
                                            <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-default"><i class="fa fa-sign-out"></i>登出</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">
                                <div class="icon fa fa-paper-plane"></div>
                                <div class="title">菜单导航</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active">
                                <a class="menuLink" href="#" title="workbench">
                                    <span class="icon fa fa-tachometer"></span><span class="title">我的任务</span>
                                </a>
                            </li>
                            <shiro:hasPermission name="tasktime/manager">
                            		<li class="panel panel-default dropdown">
	                                <a data-toggle="collapse" href="#dropdown-element">
	                                    <span class="icon fa fa-desktop"></span><span class="title">工时管理</span>
	                                </a>   
	                                <div id="dropdown-element" class="panel-collapse collapse">
	                                    <div class="panel-body">
	                                        <ul class="nav navbar-nav">
		                                        	<shiro:hasPermission name="tasktime/add">
		                                        		<li>
		                                            		<a class="menuLink" href="#" title="addTimeSheet">工时填写</a>
		                                            </li>
		                                        	</shiro:hasPermission>
		                                        <shiro:hasPermission name="tasktime/list">
		                                        		<li>
		                                            		<a class="menuLink" href="#" title="timeSheetList">工时浏览</a>
		                                            </li>
		                                        </shiro:hasPermission>   	              
	                                        </ul>
	                                    </div>
	                                </div>
                            		</li>
                            </shiro:hasPermission>
                            
                            <shiro:hasPermission name="vacation/manager">
                            		<li class="panel panel-default dropdown">
	                                <a data-toggle="collapse" href="#dropdown-table">
	                                    <span class="icon fa fa-table"></span><span class="title">休假管理</span>
	                                </a>         
	                                <div id="dropdown-table" class="panel-collapse collapse">
	                                    <div class="panel-body">
	                                        <ul class="nav navbar-nav">
	                                        	    <shiro:hasPermission name="vacation/add">
	                                        	    		<li><a class="menuLink" href="#" title="vacation/input">休假申请</a></li>
	                                        	    </shiro:hasPermission>
	                                        	    
	                                            <shiro:hasPermission name="vacation/apply">
	                                            		<li><a class="menuLink" href="#" title="vacation/todoTask">待办任务</a></li>
	                                            </shiro:hasPermission>
	                                            
	                                            <shiro:hasPermission name="vacation/running">
	                                            		<li><a class="menuLink" href="#" title="vacation/running">处理中的任务</a></li>
	                                            </shiro:hasPermission>
	                                            
	                                            <shiro:hasPermission name="vacation/history">
	                                            		<li><a class="menuLink" href="#" title="vacation/history">历史任务</a></li>
	                                            </shiro:hasPermission>	                                            
	                                        </ul>
	                                    </div>
	                                </div>
                            		</li>
                            </shiro:hasPermission>
                            
                            <shiro:hasPermission name="project/manager">
                            		<li class="panel panel-default dropdown">
	                                <a data-toggle="collapse" href="#dropdown-form">
	                                    <span class="icon fa fa-file-text-o"></span><span class="title">项目管理</span>
	                                </a>           
	                                <div id="dropdown-form" class="panel-collapse collapse">
	                                    <div class="panel-body">
	                                        <ul class="nav navbar-nav">
		                                        	<shiro:hasPermission name="project/add">
		                                        		<li>
		                                            		<a class="menuLink" href="#" title="page/load/addProject">新建项目</a>
		                                            </li>
		                                        	</shiro:hasPermission>
		                                        	
		                                        	<shiro:hasPermission name="project/list">
		                                        		<li>
		                                        			<a class="menuLink" href="#" title="projectList">浏览项目信息</a>
		                                            </li>
		                                        	</shiro:hasPermission>
	                                        </ul>
	                                    </div>
	                                </div>
                            		</li>
                            </shiro:hasPermission>
                              
                            <shiro:hasPermission name="role/manager">
                            		 <li class="panel panel-default dropdown">
	                                <a data-toggle="collapse" href="#component-example">
	                                    <span class="icon fa fa-cubes"></span><span class="title">角色管理</span>
	                                </a> 
	                                <div id="component-example" class="panel-collapse collapse">
	                                    <div class="panel-body">
	                                        <ul class="nav navbar-nav">
	                                        		<shiro:hasPermission name="role/add">
	                                        			<li>
	                                        				<a class="menuLink" href="#" title="page/load/addRole">新建角色</a>
	                                            		</li>
	                                        		</shiro:hasPermission>
	                                            
	                                            <shiro:hasPermission name="role/list">
	                                            		<li>
	                                            			<a class="menuLink" href="#" title="role/list">浏览角色信息</a>
	                                            		</li>
	                                            </shiro:hasPermission> 
	                                        </ul>
	                                    </div>
	                                </div>
                            		</li>
                            </shiro:hasPermission>
                           
                           <shiro:hasPermission name="user/manager">
                           		<li class="panel panel-default dropdown">
	                                <a data-toggle="collapse" href="#dropdown-example">
	                                    <span class="icon fa fa-slack"></span><span class="title">用户管理</span>
	                                </a>                 
	                                <div id="dropdown-example" class="panel-collapse collapse">
	                                    <div class="panel-body">
	                                        <ul class="nav navbar-nav">
		                                        <shiro:hasPermission name="user/add">
		                                        		<li>
		                                        			<a class="menuLink" href="#" title="user/add">新建用户</a>
		                                            </li>
		                                        </shiro:hasPermission>
	                                            
	                                            <shiro:hasPermission name="user/list">
	                                            		<li>
	                                            			<a class="menuLink" href="#" title="user/list">浏览用户信息</a>
	                                            		</li>
	                                            </shiro:hasPermission>       
	                                        </ul>
	                                    </div>
	                                </div>
                            		</li>
                           </shiro:hasPermission> 
                            <li>
                                <a href="license.html">
                                    <span class="icon fa fa-thumbs-o-up"></span><span class="title">关于我们</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
            <!-- Main Content -->
            <div class="container-fluid">
                <div id="parent" class="side-body padding-top">
                    <div class="row  no-margin-bottom">
	                    	<iframe id="myContainer" onload="iframeLoad()" frameborder="0" scrolling="yes" width="100%" height="500px">
	                    	
	                    	</iframe>
                    </div>
                </div>
            </div>
        <div>
        </div>
        
        <!--弹出框-->
<div class="modal fade" id="setPermissions" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			
		</div>
	</div>
</div>
   <script type="text/javascript">
   		$(function() {
   			pageContext = "${pageContext.request.contextPath}";
   			$("#myContainer").attr("src","${pageContext.request.contextPath}/page/load/workbench");
   			$(".menuLink").click(function() {
   				var menuUrl = $(this).prop("title");
   				$("#myContainer").attr("src","${pageContext.request.contextPath}/" + menuUrl);
   			});
   			
   			$("#setPermissions").on("hidden.bs.modal", function() {  
   			    $(this).removeData("bs.modal");  
   			});
   		});
   		
   		function iframeLoad(){
   		    document.getElementById("myContainer").height=$("#parent").css("height");
   		}
   		
   		function processNode(processInstanceId) {
   			$('#setPermissions').modal({
   				remote: pageContext+"/modal/processModal.jsp?id="+processInstanceId,
   				show: true
   			});
   		}
   </script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/role.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/approval.js"></script>
</body>
</html>