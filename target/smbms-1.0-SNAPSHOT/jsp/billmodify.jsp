<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>表单申请管理页面 >> 表单添加页面</span>
        </div>
        <div class="providerAdd">
          <form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/jsp/bill.do">
				<input type="hidden" name="method" value="modifysave">
				<input type="hidden" name="id" value="${bill.id }">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="billCode">表单编码：</label>
                    <input type="text" name="billCode" id="billCode" value="${bill.billCode }" readonly="readonly"> 
                </div>
                <div>
                    <label for="proProfession">职位名称：</label>
                    <input type="text" name="proProfession" id="proProfession" value="${bill.proProfession }">
					<font color="red"></font>
                </div>
              <div>
                  <label for="userLabel">姓名</label>
                  <input type="text" name="userLabel" id="userLabel" value="${bill.userLabel}">
              </div>
              <div>
                  <label for="userName">修改者</label>
                  <input type="text" name="userName" id="userName" value="${bill.userName}">
              </div>
                <div>
                    <label for="proGrade">学位：</label>
                    <input type="text" name="proGrade" id="proGrade" value="${bill.proGrade }">
					<font color="red"></font>
                </div>
                <div>
                    <label for="workExperience">工作经验：</label>
                    <input type="text" name="workExperience" id="workExperience" value="${bill.workExperience }">
					<font color="red"></font>
                </div>
                <div>
                    <label for="totalPrice">工资：</label>
                    <input type="text" name="totalPrice" id="totalPrice" value="${bill.totalPrice }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="providerId">公司：</label>
                    <input type="hidden" value="${bill.providerId }" id="pid" />
					<select name="providerId" id="providerId">
		        	</select>
					<font color="red"></font>
                </div>
                <div>
                    <label >是否录用：</label>
                    <c:if test="${bill.isPayment == 1 }">
						<input type="radio" name="isPayment" value="1" checked="checked">未录用
						<input type="radio" name="isPayment" value="2" >已录用
					</c:if>
					<c:if test="${bill.isPayment == 2 }">
						<input type="radio" name="isPayment" value="1">未录用
						<input type="radio" name="isPayment" value="2" checked="checked">已录用
					</c:if>
                </div>
                <div class="providerAddBtn">
                  <input type="button" name="save" id="save" value="保存">
				  <input type="button" id="back" name="back" value="返回" >
              	</div>
            </form>
        </div>

    </div>
</section>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billmodify.js"></script>