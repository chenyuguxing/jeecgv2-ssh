package com.workflow.service;

import java.io.InputStream;

import com.workflow.page.Jbpm4JeecgPage;

import com.jeecg.pageModel.DataGrid;

public interface Jbpm4JeecgServiceI {

	
	/**
	 * 发布流程查询
	 */
	public DataGrid datagrid(Jbpm4JeecgPage jbpm4JeecgPage);

	/**
	 * 流程定义发布
	 */
	public void deploy(InputStream in);
}
