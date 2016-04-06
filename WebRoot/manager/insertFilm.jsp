<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>添加影片</title>
    <link href="<%=basePath %>/js/jquery.loadmask.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="<%=basePath %>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath %>/js/jquery.form.js"></script>
	<script type="text/javascript" src="<%=basePath %>/js/jquery.loadmask.js"></script>
    <script type="text/javascript">
    	
    	$(document).ready(function() {
			
			//采用jQuery的Ajax方式提交表单
	    	$('#insertForm').submit(function() { 
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
			        			
			        			//显示服务器返回的信息
			        			alert(responseObj);
			        			
					        }
		        	}); 
			        return false; 
	   		}); 

	});
    
    </script>
  </head>
  
  <body>
    <!-- 布局DIV -->
  	<div id="content">
	    <s:form id="insertForm" action="/film/insertFilm" method="post">
	    	<s:textfield name="fname" value="" />
	    	<s:submit value=" 添加 "></s:submit>
	    </s:form>
	    <a href="<%=basePath %>/manager/films.jsp">[返回影片列表]</a>
    </div>
  </body>
</html>
