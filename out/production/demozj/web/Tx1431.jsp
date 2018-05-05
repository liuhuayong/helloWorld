<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="payment.api.util.GUIDGenerator"%>
<%@page import="payment.api.system.PaymentEnvironment"%>
<%
    String contextPath = request.getContextPath();
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>模拟商户</title>
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Common.css">
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Form.css">
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Table.css">
    <script type="text/javascript" src="<%=contextPath%>/js/bankIDList.js"></script>
  </head>
  <body onload="show(authPayBankList)">
    <script type="text/javascript">

function doSubmit() {    
    document.form1.submit();
}
</script>

    <p class="title">
      模拟商户
    </p>
    <%
        String action = contextPath + "/Tx1431";
    %>
    <form action="<%=action%>" name="form1" method="POST">
      <table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
        <tr>
          <td class="head" height="24" colspan="2">
            保证金退还（1431）
          </td>
        </tr>
        <tr class="mouseout">
          <td width="150" class="label" height="24"><font color="red">*</font>机构号码</td>
          <td width="*" class="content">
            <input type="text" name="InstitutionID" size="40" value="000179" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>退款交易流水号</td>
          <td width="*" class="content">
            <input type="text" name="SerialNumber" size="40" value="<%=GUIDGenerator.genGUID()%>" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>原支付交易流水号</td>
          <td width="*" class="content">
            <input type="text" name="PaymentNo" 10-接口规范 size="40" value="" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>退款本金</td>
          <td width="*" class="content">
            <input type="text" name="Amount" size="40" value="1000" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>是否退还利息</td>
          <td width="*" class="content">
            <select name="InterestFlag" style="width: 274">
              <option value="0">不退息</option>
              <option selected value="1">退息</option>
            </select>
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24">
计息开始时间(yyyy-mm-dd)
          </td>
          <td width="*" class="content">
            <input type="text" name="StartDate" size="40"  value="2013-01-30" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24">
计息结束时间(yyyy-mm-dd)
          </td>
          <td width="*" class="content">
            <input type="text" name="EndDate" size="40"  value="2013-08-05" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24">
            备注
          </td>
          <td width="*" class="content">
            <input type="text" name="Remark" size="40" value="" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>账户类型</td>
          <td width="*" class="content">
            <select name="AccountType" style="width: 274">
              <option value="<%=PaymentEnvironment.PERSONAL_ACCOUNT%>">
                个人账户
              </option>
              <option value="<%=PaymentEnvironment.BUSINESS_ACCOUNT%>">
                企业账户
              </option>
            </select>
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24">
            收款方在银行开立的账户
          </td>
          <td width="*" class="label" height="24">
            &nbsp;&nbsp;
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>银行ID</td>
          <td width="*" class="content">
            <select id="bankList" name="BankID" style="width: 274">
            </select>
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>账户名称</td>
          <td width="*" class="content">
            <input type="text" name="AccountName" size="40" value="张三" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>账户号码</td>
          <td width="*" class="content">
            <input type="text" name="AccountNumber" size="40" value="6222312385231111" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>分支行名称</td>
          <td width="*" class="content">
            <input type="text" name="BranchName" size="40" value="宣武门支行" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>开户行所在的省份</td>
          <td width="*" class="content">
            <input type="text" name="Province" size="40" value="北京" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>开户行所在的城市</td>
          <td width="*" class="content">
            <input type="text" name="City" size="40" value="北京" />
          </td>
        </tr>
      </table>

      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="10" colspan="2" />
        </tr>
        <tr>
          <td width="200" height="28" />
          <td width="*">
            <input type="button" class="ButtonMouseOut" onmouseover="this.className='ButtonMouseOver'"
              onmouseout="this.className='ButtonMouseOut'" style="width: 60px" value="提交" onclick="doSubmit()">
          </td>
        </tr>
      </table>

    </form>

  </body>
</html>
