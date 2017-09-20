var roleId = 0;
function setPermissions(id) {
	roleId = id;
	$('#setPermissions').modal({
		remote: pageContext+"/modal/permissonModal.html",
		show: true
	});
	initTree();
}
   		
function initTree() {
	$.get(
		pageContext+"/menu/buildTree",
		function(data) {
			$('#tree').treeview({
				data: data,
				showCheckbox:true,
				onNodeChecked: nodeChecked,
				onNodeUnchecked: nodeUnChecked
			});
		}	
	);	
}
   		
var nodeCheckedSilent = false;
function nodeChecked(event, node) {
	if(nodeCheckedSilent){  
        return;  
    }
	nodeCheckedSilent = true;
	checkAllParent(node);
	checkAllSon(node);
	nodeCheckedSilent = false;
}
   		
var nodeUncheckedSilent = false;
function nodeUnChecked(event, node) {
	if(nodeUncheckedSilent){
	  	return;
	}
 	nodeUncheckedSilent = true;
	uncheckAllParent(node);
	uncheckAllSon(node);
	nodeUncheckedSilent = false;
}
   		
//选中全部父节点  
function checkAllParent(node){
    $('#tree').treeview('checkNode',node.nodeId,{silent:true});  
    var parentNode = $('#tree').treeview('getParent',node.nodeId);  
    if(!("nodeId" in parentNode)){  
        return;  
    }else{  
        checkAllParent(parentNode);  
    }  
} 
   		
//级联选中所有子节点
function checkAllSon(node) {
	$('#tree').treeview('checkNode',node.nodeId,{silent:true});  
    if(node.nodes!=null&&node.nodes.length>0){  
        for(var i in node.nodes){  
            checkAllSon(node.nodes[i]);  
        }  
    }  
}

//取消全部父节点  
function uncheckAllParent(node){  
    $('#tree').treeview('uncheckNode',node.nodeId,{silent:true});  
    var siblings = $('#tree').treeview('getSiblings', node.nodeId);  
    var parentNode = $('#tree').treeview('getParent',node.nodeId);  
    if(!("nodeId" in parentNode)) {  
        return;  
    }  
    
    var isAllUnchecked = true;  //是否全部没选中  
    for(var i in siblings){  
        if(siblings[i].state.checked){  
            isAllUnchecked=false;  
            break;  
        }  
    }  
   
    if(isAllUnchecked){  
        uncheckAllParent(parentNode);  
    }
}
   		
//级联取消所有子节点  
function uncheckAllSon(node){ 
    $('#tree').treeview('uncheckNode',node.nodeId,{silent:true});  
    if(node.nodes!=null&&node.nodes.length>0){  
        for(var i in node.nodes){  
            uncheckAllSon(node.nodes[i]);  
        }  
    }  
}
	   	
function savePermissions(){
	var arr = $("#tree").treeview('getChecked');
	var ids = new Array();
	for(var i in arr) {
		if(arr[i].nodeId != 0) {
			ids.push(arr[i].nodeId);
		}
	}
   	//保存新的权限
   	$.post(
   		pageContext+"/role/savePermissions",
   		{"ids":ids.toString(),"roleId":roleId},
   		function(data) {
   			if(data == true) {
   				$('#setPermissions').modal('hide');
   			}else {
   				alert("系统异常");
   			}
   		}	
   	);
}
	   	
function updateRole(roleId,roleName,roleDesc) {
	$.get(
		pageContext+"/role/findBy/"+roleId,
		function(data) {
			$('#setPermissions').modal({
   				remote: pageContext+"/modal/updateRoleModal.jsp?roleId="+roleId+"&roleName=" + escape(roleName) + "&roleDesc=" + roleDesc,
   				show: true
   			});
		}
	);
}

function updateRoleInfo(){
	var roleName = $("#updateRoleName").val();
	var roleDesc = $("#updateRoleDesc").val();
	var roleId = $("#updateRoleId").val();
	
	$.post(
		pageContext+"/role/update",
		{"id":roleId,"roleName":roleName,"roleDesc":roleDesc},
		function(data) {
			if(data == true) {
   				$('#setPermissions').modal('hide');
   				$("#myContainer").attr("src",pageContext+"/role/list");
   			}else {
   				alert("系统异常");
   			}
		}
	);
}

function confirmDeleteRole(roleId) {
	$('#setPermissions').modal({
			remote: pageContext+"/modal/deleteRoleModal.jsp?roleId="+roleId,
			show: true
	});
}

function deleteRole() {
	var roleId = $("#roleId").val();
	$.post(
		pageContext+"/role/delete",
		{"id":roleId},
		function(data) {
			if(data == true) {
   				$('#setPermissions').modal('hide');
   				$("#myContainer").attr("src",pageContext+"/role/list");
   			}else {
   				alert("系统异常");
   			}
		}	
	);
}