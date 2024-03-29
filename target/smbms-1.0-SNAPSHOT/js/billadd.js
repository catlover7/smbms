var billCode = null;
var proProfession = null;
var proGrade = null;
var workExperience = null;
var totalPrice = null;
var providerId = null;
var userLabel=null;
var addBtn = null;
var backBtn = null;

function priceReg (value){
	value = value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
		value = value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
    value = value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
    value = value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");//去掉特殊符号￥
	if(value.indexOf(".")>0){
		value = value.substring(0,value.indexOf(".")+3);
	}
	return value;
}


$(function(){
	billCode = $("#billCode");
	proProfession = $("#proProfession");
	proGrade = $("#proGrade");
	workExperience = $("#workExperience");
	totalPrice = $("#totalPrice");
	providerId = $("#providerId");
	userLabel =$("#userLabel");
	addBtn = $("#add");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	billCode.next().html("*");
	proProfession.next().html("*");
	proGrade.next().html("*");
	workExperience.next().html("*");
	totalPrice.next().html("*");
	providerId.next().html("*");
	userLabel.next().html("*");

	$.ajax({
		type:"GET",//请求类型
		url:path+"/jsp/bill.do",//请求的url
		data:{method:"getproviderlist"},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			if(data != null){
				$("select").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
				var options = "<option value=\"0\">请选择</option>";
				for(var i = 0; i < data.length; i++){
					//alert(data[i].id);
					//alert(data[i].proName);
					options += "<option value=\""+data[i].id+"\">"+data[i].proName+"</option>";
				}
				$("select").html(options);
			}
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			validateTip(providerId.next(),{"color":"red"},imgNo+" 获取公司列表error",false);
		}
	});
	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	billCode.on("blur",function(){
		if(billCode.val() != null && billCode.val() != ""){
			validateTip(billCode.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(billCode.next(),{"color":"red"},imgNo+" 编码不能为空，请重新输入",false);
		}
	}).on("focus",function(){
		//显示友情提示
		validateTip(billCode.next(),{"color":"#666666"},"* 请输入表单编码",false);
	}).focus();
	
	proProfession.on("focus",function(){
		validateTip(proProfession.next(),{"color":"#666666"},"* 请输入职位名称",false);
	}).on("blur",function(){
		if(proProfession.val() != null && proProfession.val() != ""){
			validateTip(proProfession.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(proProfession.next(),{"color":"red"},imgNo+" 职位名称不能为空，请重新输入",false);
		}
		
	});

	userLabel.on("focus",function(){
		validateTip(userLabel.next(),{"color":"#666666"},"* 请输入姓名",false);
	}).on("blur",function(){
		if(userLabel.val() != null && userLabel.val() != ""){
			validateTip(userLabel.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userLabel.next(),{"color":"red"},imgNo+" 姓名不能为空，请重新输入",false);
		}

	});

	proGrade.on("focus",function(){
		validateTip(proGrade.next(),{"color":"#666666"},"* 请输入学位",false);
	}).on("blur",function(){
		if(proGrade.val() != null && proGrade.val() != ""){
			validateTip(proGrade.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(proGrade.next(),{"color":"red"},imgNo+" 学位不能为空，请重新输入",false);
		}

	});
	
	providerId.on("focus",function(){
		validateTip(providerId.next(),{"color":"#666666"},"* 请选择公司",false);
	}).on("blur",function(){
		if(providerId.val() != null && providerId.val() != "" && providerId.val() != 0){
			validateTip(providerId.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(providerId.next(),{"color":"red"},imgNo+" 公司不能为空，请选择",false);
		}
		
	});
	
	workExperience.on("focus",function(){
		validateTip(workExperience.next(),{"color":"#666666"},"* 请输入大于0的正自然数",false);
	}).on("keyup",function(){
		this.value = priceReg(this.value);
	}).on("blur",function(){
		this.value = priceReg(this.value);
	});
	
	totalPrice.on("focus",function(){
		validateTip(totalPrice.next(),{"color":"#666666"},"* 请输入大于0的正自然数",false);
	}).on("keyup",function(){
		this.value = priceReg(this.value);
	}).on("blur",function(){
		this.value = priceReg(this.value);
	});
	
	addBtn.on("click",function(){
		if(billCode.attr("validateStatus") != "true"){
			billCode.blur();
		}else if(proProfession.attr("validateStatus") != "true"){
			proProfession.blur();
		}
		else if(proGrade.attr("validateStatus") != "true"){
			proGrade.blur();
		}
		else if(providerId.attr("validateStatus") != "true"){
			providerId.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#billForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		if(referer != undefined
			&& null != referer
			&& "" != referer
			&& "null" != referer
			// && referer.length > 4
		){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}

	});
});