$(function(){
	// 在键盘按下并释放及提交后验证提交表单
	$("#Form").validate({
		rules:{
			// 字段的name属性:"校验器"
			//字段的name属性:{校验器:值,校验器:值}
			username:{
				required:true,
				rangelength:[2,8]
			},
			password:{
				required:true,
				digits:true,
				rangelength:[3,9]
			},
			repassword:{
				equalTo:"[name='password']"
			},
			birthday:{
				required:true
			}
		},
		messages:{
			//字段的name属性:"提示信息"
			//字段的name属性:{校验器:"提示信息",校验器:提示信息"}
			username:{
				required:"用户名不能为空",
				rangelength:"用户名为2到8位"
			},
			password:{
				required:"密码不能为空",
				digits:"密码只能是3-9位数字",
				rangelength:"密码为3到9位"
			},
			repassword:{
				equalTo:"两次输入的密码不一致"
			},
			birthday:{
				required:"日期不能为空"
			}
		}
	});
	//名称框失去焦点事件,验证用户名是否存在
	$("#username").blur(function(){
		var username = $(this).val();
		//alert(username);
		//{"username":username}
		//var user={"username":username};
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath }/user/findByName.action",
			//定义回调响应的数据格式
			dataType:"json",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify({"username":username}),
			success:function(data){
				//alert(data);返回boolean
				//如果用户存在,false
				if(!data){
					//alert("用户名已经存在");
					$("#msg").html("用户名已经存在!!!");
					//设置注册按钮不可点击
					$("#reg").attr("disabled",true);
				}else{
					//删除提示
					$("#msg").html("");
					$("#reg").attr("disabled",false);
				}
			},
		});
	});
});