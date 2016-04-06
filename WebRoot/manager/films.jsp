<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息操作</title>
    <link href="<%=basePath %>/js/jquery.loadmask.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath %>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath %>/js/jquery.form.js"></script>
	<script type="text/javascript" src="<%=basePath %>/js/jquery.loadmask.js"></script>
    <script type="text/javascript">
    	
    	$(document).ready(function() {
			
			//采用jQuery的Ajax方式提交表单
	    	$('#filmForm').submit(function() { 
			        $(this).ajaxSubmit({ 
			        		beforeSubmit:  function(){
			        		
			        			//提交表单处理期间，屏蔽整个窗口
			        			$('#content').mask("正在提交数据，请稍候。");
			        			//关闭提交按钮
			        			$('input[name=submit]').attr("disabled", true);
			        			
	        				},
			        		dataType:  'json',
			        		//处理服务器响应的函数
				        	success: function showResponse(responseObj, statusText, xhr, $form){
				        		
				        		//取消窗口屏蔽
	        					$('#content').unmask();
	        					
			        			//打开提交按钮
			        			$('input[name=submit]').attr("disabled", false);
			        			
			        			//将服务器返回的影片信息添加到表格中
			        			var tableObj = document.getElementById('filmTable');
			        			
			        			//清除表格中原有数据
			        			var rowLength = tableObj.rows.length;
			        			for(var i = 1; i < rowLength; i++){
			        				tableObj.deleteRow(1);
			        			}
			        			
			        			//添加新的数据
			        			for(var i = 0; i < responseObj.length; i++){
			        				
			        				//读取影片对象
			        				var filmObj = responseObj[i];
			        				
			        				//在表格中创建新行
			        				var newRow = tableObj.insertRow(tableObj.rows.length);
			        				//在新行中创建3个单元格
			        				var cell1 = newRow.insertCell(0);
			        				var cell2 = newRow.insertCell(1);
			        				var cell3 = newRow.insertCell(2);
			        				//给单元格加入数据
			        				cell1.innerHTML = '' + (i + 1);
			        				cell2.innerHTML = filmObj.fname;
			        				cell3.innerHTML = '<a href="<%=basePath %>/film/detailFilm?id=' + 
			        				filmObj.id + '">[修改]</a>&nbsp;' + 
			        				'<a href="javascript:deleteFilm(\'<%=basePath %>/film/deleteFilm?id=' + 
			        				filmObj.id + '\');">[删除]</a>';
			        			}
			        			
					        }
		        	});
			        return false; 
	   		});
	   		
	});
	
	/*ajax方式提交删除*/
   	function deleteFilm(deleteUrl){
   		
   		if(confirm("是否删除影片？")){
   		
	  		$.ajax({
				type:'get',
				url:deleteUrl, 
				data:null, 
				datatype:'json',
				success: function(responseObj){
					alert(responseObj);
				}
			}); 
		}
   		
   	}
    
    </script>
  </head>
  
  <body>
  <!-- 布局DIV -->
  <div id="content">
    <s:form id="filmForm" action="/film/findFilm" method="post">
    	<s:submit value=" 获取所有影片信息 "></s:submit>
    </s:form>
	<a href="<%=basePath %>/manager/insertFilm.jsp">添加影片信息</a><br />	
   	<table id="filmTable" border="1" width="40%">
   		<tr>
   			<th>序号</th><th>影片名</th><th>操作</th>
   		</tr>	
	</table>
  </div>
  </body>
</html>
