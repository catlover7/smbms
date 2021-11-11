<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>表单申请管理页面 >> 表单申请添加页面</span>
     </div>
     <div class="providerAdd">
         <form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/jsp/bill.do">
             <!--div的class 为error是验证错误，ok是验证成功-->
             <input type="hidden" name="method" value="add">
             <div class="">
                 <label for="billCode">表单编码：</label>
                 <input type="text" name="billCode" class="text" id="billCode" value=""> 
				 <!-- 放置提示信息 -->
				 <font color="red"></font>
             </div>
             <div>
                 <label for="proProfession">职位名称：</label>
                 <input type="text" name="proProfession" id="proProfession" value="">
				 <font color="red"></font>
             </div>
             <div>
                 <label for="userLabel">姓名</label>
                 <input type="text" name="userLabel" id="userLabel" value="">
             </div>
             <div>
                 <label for="userName">修改者</label>
                 <input type="text" name="userName" id="userName" value="">
             </div>
             <div>
                 <label for="proGrade">学位：</label>
                 <input type="text" name="proGrade" id="proGrade" value="">
				 <font color="red"></font>
             </div>
             <div>
                 <label for="workExperience">工作经验：</label>
                 <input type="text" name="workExperience" id="workExperience" value="">
				 <font color="red"></font>
             </div>
             <div>
                 <label for="totalPrice">工资：</label>
                 <input type="text" name="totalPrice" id="totalPrice" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label >公司：</label>
                 <select name="providerId" id="providerId">
		         </select>
				 <font color="red"></font>
             </div>
             <div>
                 <label >是否录用：</label>
                 <input type="radio" name="isPayment" value="1" checked="checked">未录用
				 <input type="radio" name="isPayment" value="2" >已录用
             </div>
             <div class="providerAddBtn">
                  <input type="button" name="add" id="add" value="保存">
				  <input type="button" id="back" name="back" value="返回" >
             </div>
         </form>
     </div>
 </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billadd.js"></script>