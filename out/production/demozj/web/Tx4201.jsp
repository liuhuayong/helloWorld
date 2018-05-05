<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="payment.api.util.GUIDGenerator"%>
<%
    String contextPath = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <title>模拟商户</title>
	  <link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Common.css">
	  <link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Form.css">
      <link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Table.css">
	</head>

	<body>
	  <script language="JavaScript" type="text/JavaScript">
	    function doSubmit() {
	      document.form1.submit();
        }
	  </script>

	  <p class="title">模拟商户</p>
	  <%
        String action = contextPath + "/Tx4201";
	  %>
		
	  <form action="<%=action%>" name="form1" method="POST">
	    <table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
	      <tr>
            <td class="head" height="24" colspan="2">统一账户注册（4201）</td>
          </tr>
          
          <tr class="mouseout">
            <td width="120" class="label" height="24"><font color="red">*</font>机构编号</td>
            <td width="*" class="content">
              <input type="text" name="InstitutionID" size="40" value="000020"/>
            </td>
          </tr>
          
          <tr class="mouseout">
            <td width="120" class="label" height="24"><font color="red">*</font>注册编号</td>
            <td width="*" class="content">
              <input type="text" name="RegisterNo" size="40" value="<%=GUIDGenerator.genGUID()%>"/>
            </td>
          </tr>
          
          <tr class="mouseout">
            <td width="120" class="label" height="24"><font color="red">*</font>手机号码</td>
            <td width="*" class="content">
              <input type="text" name="PhoneNumber" placeholder="必填" size="40" value=""/>
            </td>
          </tr>
          
          <tr class="mouseout">
            <td width="120" class="label" height="24">用户姓名</td>
            <td width="*" class="content">
              <input type="text" name="UserName" size="40" value=""/>
            </td>
          </tr>

          <tr class="mouseout">
            <td width="120" class="label" height="24">身份证号码</td>
            <td width="*" class="content">
              <input type="text" name="IdentificationNumber" size="40" value=""/>
            </td>
          </tr>
          
          <tr class="mouseout">
            <td width="120" class="label" height="24"><font color="red">*</font>用户类型</td>
            <td width="*" class="content">
              <select id="UserType" name="UserType" style="width: 274">
                <option value="">--选择--</option>
                <option value="11">11-个人账户</option>
                <option value="12">12-企业账户</option>
              </select>
            </td>
          </tr>
          
          <tr class="mouseout">
            <td width="120" class="label" height="24">页面URL</td>
            <td width="*" class="content">
            <%
              String url = null;
              if(request.getHeader("Referer") == null){
                  url = request.getRequestURL().substring(0, request.getRequestURL().indexOf(request.getRequestURI()) + request.getContextPath().length()) + "/ReceiveNoticePage";
              }else{
                  url = request.getHeader("Referer").substring(0, request.getHeader("Referer").indexOf(request.getContextPath()) + request.getContextPath().length()) + "/ReceiveNoticePage";
              }
          %>
              <input type="text" name="PageURL" size="40" value="<%=url%>"/>
            </td>
          </tr>
        </table> 
	  
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td height="10" colspan="2"/>
          </tr>
          <tr>
            <td width="200" height="28"/>
            <td width="*" >
              <input type="button" class="ButtonMouseOut" onmouseover="this.className='ButtonMouseOver'" onmouseout="this.className='ButtonMouseOut'" style="width: 60px" value="提交" onclick="doSubmit()">
            </td>
          </tr>
        </table>
	  </form>
	  
	</body>
		
</html>
