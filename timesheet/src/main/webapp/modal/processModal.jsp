<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel">当前流程节点</h4>
</div>
<div class="modal-body">
	<img class="img-responsive" src="${pageContext.request.contextPath}/process/trace/${param.id}" alt="当前流程节点" />
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
<script>
	
</script>