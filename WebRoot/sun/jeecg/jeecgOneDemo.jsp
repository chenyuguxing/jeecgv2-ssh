<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
    var searchForm;
	var datagrid;
	var jeecgOneDemoAddDialog;
	var jeecgOneDemoAddForm;
	var cdescAdd;
	var jeecgOneDemoEditDialog;
	var jeecgOneDemoEditForm;
	var cdescEdit;
	var showCdescDialog;
	var iframeDialog;
	$(function() {
	    //查询列表	
	    searchForm = $('#searchForm').form();
		datagrid = $('#datagrid').datagrid({
			url : 'jeecgOneDemoAction!datagrid.action',
			title : '单表模型Demo列表',
			iconCls : 'icon-save',
			pagination : true,
			pagePosition : 'bottom',
			rownumbers : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40 ],
			fit : true,
			fitColumns : true,
			nowrap : true,
			border : false,
			idField : 'obid',
			sortName : 'createDt',
			sortOrder : 'desc',
			columns : [ [ 
			{field:'ck',checkbox:true,
						formatter:function(value,row,index){
							return row.obid;
						}
					},
			   {field:'name',title:'用户名',align:'center',sortable:true,
					formatter:function(value,row,index){
						return row.name;
					}
				},				
			   {field:'age',title:'年龄',align:'center',sortable:true,
					formatter:function(value,row,index){
						return row.age;
					}
				},				
			   {field:'salary',title:'工资',align:'center',sortable:true,
					formatter:function(value,row,index){
						return row.salary;
					}
				},				
			   {field:'birthday',title:'生日',align:'center',sortable:true,
					formatter:function(value,row,index){
						return dateFormatYMD(row.birthday);
					}
				},				
			   {field:'registerDt',title:'注册时间',align:'center',sortable:true,
					formatter:function(value,row,index){
						return dateFormatYMD(row.registerDt);
					}
				}				
			 ] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					add();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					del();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					edit();
				}
			}, '-', {
				text : '取消选中',
				iconCls : 'icon-undo',
				handler : function() {
					datagrid.datagrid('unselectAll');
				}
			}, '-' ],
			onRowContextMenu : function(e, rowIndex, rowData) {
				e.preventDefault();
				$(this).datagrid('unselectAll');
				$(this).datagrid('selectRow', rowIndex);
				$('#menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});

		jeecgOneDemoAddForm = $('#jeecgOneDemoAddForm').form({
			url : 'jeecgOneDemoAction!add.action',
			success : function(data) {
				var json = $.parseJSON(data);
				if (json && json.success) {
					$.messager.show({
						title : '成功',
						msg : json.msg
					});
					datagrid.datagrid('reload');
					jeecgOneDemoAddDialog.dialog('close');
				} else {
					$.messager.show({
						title : '失败',
						msg : '操作失败！'
					});
				}
			}
		});

		jeecgOneDemoAddDialog = $('#jeecgOneDemoAddDialog').show().dialog({
			title : '添加单表模型Demo',
			modal : true,
			closed : true,
			maximizable : true,
			buttons : [ {
				text : '添加',
				handler : function() {
					jeecgOneDemoAddForm.submit();
				}
			} ]
		});

		cdescAdd = $('#cdescAdd').xheditor({
			tools : 'mini',
			html5Upload : true,
			upMultiple : 4,
			upLinkUrl : 'jeecgOneDemoAction!upload.action',
			upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx',
			upImgUrl : 'jeecgOneDemoAction!upload.action',
			upImgExt : 'jpg,jpeg,gif,png'
		});

		jeecgOneDemoEditForm = $('#jeecgOneDemoEditForm').form({
			url : 'jeecgOneDemoAction!edit.action',
			success : function(data) {
				var json = $.parseJSON(data);
				if (json && json.success) {
					$.messager.show({
						title : '成功',
						msg : json.msg
					});
					datagrid.datagrid('reload');
					jeecgOneDemoEditDialog.dialog('close');
				} else {
					$.messager.show({
						title : '失败',
						msg : '操作失败！'
					});
				}
			}
		});

		jeecgOneDemoEditDialog = $('#jeecgOneDemoEditDialog').show().dialog({
			title : '编辑单表模型Demo',
			modal : true,
			closed : true,
			maximizable : true,
			buttons : [ {
				text : '编辑',
				handler : function() {
					jeecgOneDemoEditForm.submit();
				}
			} ]
		});

		cdescEdit = $('#cdescEdit').xheditor({
			tools : 'mini',
			html5Upload : true,
			upMultiple : 4,
			upLinkUrl : 'jeecgOneDemoAction!upload.action',
			upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx',
			upImgUrl : 'jeecgOneDemoAction!upload.action',
			upImgExt : 'jpg,jpeg,gif,png'
		});

		showCdescDialog = $('#showCdescDialog').show().dialog({
			title : '单表模型Demo描述',
			modal : true,
			closed : true,
			maximizable : true
		});

		iframeDialog = $('#iframeDialog').show().dialog({
			title : 'POP弹出页面',
			modal : true,
			closed : true,
			maximizable : true
		});
	});

	function _search() {
		datagrid.datagrid('load', sy.serializeObject(searchForm));
	}
	function cleanSearch() {
		datagrid.datagrid('load', {});
		searchForm.find('input').val('');
	}
	function add() {
		jeecgOneDemoAddForm.find('input,textarea').val('');
		$('div.validatebox-tip').remove();
		jeecgOneDemoAddDialog.dialog('open');
	}
	function del() {
		var rows = datagrid.datagrid('getSelections');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('请确认', '您要删除当前所选项目？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].obid);
					}
					$.ajax({
						url : 'jeecgOneDemoAction!delete.action',
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(response) {
							datagrid.datagrid('load');
							datagrid.datagrid('unselectAll');
							$.messager.show({
								title : '提示',
								msg : '删除成功！'
							});
						}
					});
				}
			});
		} else {
			$.messager.alert('提示', '请选择要删除的记录！', 'error');
		}
	}
	function edit() {
		var rows = datagrid.datagrid('getSelections');
		if (rows.length == 1) {
			$.messager.progress({
				text : '数据加载中....',
				interval : 100
			});
			$.ajax({
				url : 'jeecgOneDemoAction!showDesc.action',
				data : {
					obid : rows[0].obid
				},
				dataType : 'json',
				cache : false,
				success : function(response) {
					jeecgOneDemoEditForm.find('input,textarea').val('');
					jeecgOneDemoEditForm.form('load', response);
					$('div.validatebox-tip').remove();
					jeecgOneDemoEditDialog.dialog('open');
					$.messager.progress('close');
				}
			});
		} else {
			$.messager.alert('提示', '请选择一项要编辑的记录！', 'error');
		}
	}
	function showCdesc(index) {
		var rows = datagrid.datagrid('getRows');
		var row = rows[index];
		$.messager.progress({
			text : '数据加载中....',
			interval : 100
		});
		$.ajax({
			url : 'jeecgOneDemoAction!showDesc.action',
			data : {
				obid : row.obid
			},
			dataType : 'json',
			cache : false,
			success : function(response) {
				if (response && response.cdesc) {
					showCdescDialog.find('div[name=cdesc]').html(response.cdesc);
					showCdescDialog.dialog('open');
				} else {
					$.messager.alert('提示', '没有单表模型Demo描述！', 'error');
				}
				$.messager.progress('close');
			}
		});
		datagrid.datagrid('unselectAll');
	}
</script>
</head>
<body class="easyui-layout">
	<div region="north" border="false" title="过滤条件" collapsed="true"  style="height: 110px;overflow: hidden;display: none;" align="left">
		<form id="searchForm">
			<table class="tableForm datagrid-toolbar" style="width: 100%;height: 100%;">
				<tr>
					<th>用户名</th>
					<td><input name="name" style="width:155px;" /></td>
				</tr>
				<tr>
					<th>创建时间</th>
					<td><input name="ccreatedatetimeStart" class="easyui-datebox" editable="false" style="width: 155px;" />至<input name="ccreatedatetimeEnd" class="easyui-datebox" editable="false" style="width: 155px;" /></td>
				</tr>
				<tr>
					<th>最后修改时间</th>
					<td><input name="cmodifydatetimeStart" class="easyui-datebox" editable="false" style="width: 155px;" />至<input name="cmodifydatetimeEnd" class="easyui-datebox" editable="false" style="width: 155px;" /><a href="javascript:void(0);" class="easyui-linkbutton" onclick="_search();">过滤</a><a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div region="center" border="false">
		<table id="datagrid"></table>
	</div>

	<div id="menu" class="easyui-menu" style="width:120px;display: none;">
		<div onclick="add();" iconCls="icon-add">增加</div>
		<div onclick="del();" iconCls="icon-remove">删除</div>
		<div onclick="edit();" iconCls="icon-edit">编辑</div>
	</div>

	<div id="jeecgOneDemoAddDialog" style="display: none;width: 500px;height: 300px;" align="center">
		<form id="jeecgOneDemoAddForm" method="post">
			<table class="tableForm">
							<tr>
							<td>用户名</td>
							<td>
							<input name="name" type="text" maxlength="32" class="easyui-validatebox" data-options="required:true" missingMessage="请填写用户名"  style="width: 155px;"/>
							</td>
							</tr>
							<tr>
							<td>年龄</td>
							<td>
							<input name="age" type="text" maxlength="" class="easyui-numberbox" data-options="required:true" missingMessage="请填写年龄"  style="width: 155px;"/>
							</td>
							</tr>
							<tr>
							<td>工资</td>
							<td>
							<input name="salary" type="text" maxlength="" class="easyui-numberbox" data-options="required:true,precision:2,groupSeparator:','" missingMessage="请填写工资"  style="width: 155px;"/>
							</td>
							</tr>
							<tr>
							<td>生日</td>
							<td>
							<input name="birthday" type="text" maxlength="" class="easyui-datebox" data-options="required:true" missingMessage="请填写生日"  style="width: 155px;"/>
							</td>
							</tr>
							<tr>
							<td>注册时间</td>
							<td>
							<input name="registerDt" type="text" maxlength="" class="easyui-datetimebox" data-options="required:true" missingMessage="请填写注册时间"  style="width: 155px;"/>
							</td>
							</tr>
			</table>
		</form>
	</div>

	<div id="jeecgOneDemoEditDialog" style="display: none;width: 500px;height: 300px;" align="center">
		<form id="jeecgOneDemoEditForm" method="post">
			<input type="hidden" name="obid" />
			<table class="tableForm">
							<tr>
							<td>用户名</td>
							<td>
							<input name="name" type="text" maxlength="32" class="easyui-validatebox" data-options="required:true" missingMessage="请填写用户名"  style="width: 155px;"/>
							</td>
							</tr>
							<tr>
							<td>年龄</td>
							<td>
							<input name="age" type="text" maxlength="" class="easyui-numberbox" data-options="required:true" missingMessage="请填写年龄"  style="width: 155px;"/>
							</td>
							</tr>
							<tr>
							<td>工资</td>
							<td>
							<input name="salary" type="text" maxlength="" class="easyui-numberbox" data-options="required:true,precision:2,groupSeparator:','" missingMessage="请填写工资"  style="width: 155px;"/>
							</td>
							</tr>
							<tr>
							<td>生日</td>
							<td>
							<input name="birthday" type="text" maxlength="" class="easyui-datebox" data-options="required:true" missingMessage="请填写生日"  style="width: 155px;"/>
							</td>
							</tr>
							<tr>
							<td>注册时间</td>
							<td>
							<input name="registerDt" type="text" maxlength="" class="easyui-datetimebox" data-options="required:true" missingMessage="请填写注册时间"  style="width: 155px;"/>
							</td>
							</tr>
			</table>
		</form>
	</div>

	<div id="showCdescDialog" style="display: none;overflow: auto;width: 500px;height: 400px;">
		<div name="cdesc"></div>
	</div>
	
	<div id="iframeDialog" style="display: none;overflow: auto;width: 600px;height: 400px;">
	<iframe name="iframe" id="iframe" src="#"  scrolling="auto" frameborder="0" style="width:100%;height:100%;">
    </iframe>
</div>
</body>
</html>