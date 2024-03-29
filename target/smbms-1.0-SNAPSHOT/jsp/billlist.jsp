<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>表单申请管理页面</span>
       </div>
       <div class="search">
       <form method="get" action="${pageContext.request.contextPath }/jsp/bill.do">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>职位名称：</span>
			<input name="queryproProfession" type="text" value="${queryproProfession }">
		   <span>姓名：</span>
		   <input name="queryUserLabel" type="text" value="${queryUserLabel}">
			 
<%--			<span>公司：</span>--%>
<%--			<select name="queryProviderId">--%>
<%--				<c:if test="${providerList != null }">--%>
<%--				   <option value="0">--请选择--</option>--%>
<%--				   <c:forEach var="provider" items="${providerList}">--%>
<%--				   		<option <c:if test="${provider.id == queryProviderId }">selected="selected"</c:if>--%>
<%--				   		value="${provider.id}">${provider.proName}--%>
<%--						</option>--%>
<%--				   </c:forEach>--%>
<%--				</c:if>--%>
<%--       		</select>--%>

			<span>是否录用：</span>
			<select name="queryIsPayment">
				<option value="0">--请选择--</option>
				<option value="1" ${queryIsPayment == 1 ? "selected=\"selected\"":"" }>未录用</option>
				<option value="2" ${queryIsPayment == 2 ? "selected=\"selected\"":"" }>已录用</option>
       		</select>
			
			 <input	value="查 询" type="submit" id="searchbutton">
			 <a href="${pageContext.request.contextPath }/jsp/billadd.jsp">添加订单</a>
		</form>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="10%">表单编码</th>
              <th width="10%">职位名称</th>
			  <th width="10%">姓名</th>
              <th width="10%">公司</th>
			  <th width="10">修改者</th>
              <th width="10%">工资</th>
              <th width="10%">是否录用</th>
              <th width="10%">创建时间</th>
              <th width="20%">操作</th>
          </tr>
          <c:forEach var="bill" items="${billList }" varStatus="status">
				<tr>
					<td>
					<span>${bill.billCode }</span>
					</td>
					<td>
					<span>${bill.proProfession }</span>
					</td>
			<td>
				<span>
					${bill.userLabel}
				</span>
			</td>
					<td>
					<span>${bill.providerName}</span>
					</td>
					<td>
						<span>${bill.userName}</span>
					</td>
					<td>
					<span>${bill.totalPrice}</span>
					</td>
					<td>
					<span>
						<c:if test="${bill.isPayment == 1}">未录用</c:if>
						<c:if test="${bill.isPayment == 2}">已录用</c:if>
					</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<span><a class="viewBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
			</c:forEach>
      </table>
  </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该表单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>