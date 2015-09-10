package com.workflow.service.impl;

import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import org.jbpm.api.Deployment;
import org.jbpm.api.ProcessEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeecg.dao.jdbc.JdbcDao;
import com.jeecg.pageModel.DataGrid;

import com.util.LogUtil;
import com.workflow.page.Jbpm4JeecgPage;
import com.workflow.service.Jbpm4JeecgServiceI;

@Service("jbpm4JeecgService")
public class Jbpm4JeecgServiceImpl implements Jbpm4JeecgServiceI {

	@Autowired
	private JdbcDao jdbcDao;
	
	@Autowired
	private ProcessEngine processEngine;
	
	/**
	 * Spring Jdbc 分页
	 */
	public DataGrid datagrid(Jbpm4JeecgPage jbpm4JeecgPage) {
		String sql = com.util.JeecgSqlUtil.getMethodSql(com.util.JeecgSqlUtil.getMethodUrl());
		DataGrid j = new DataGrid();
		LogUtil.info(sql);
		List<Map<String, Object>> maplist =  jdbcDao.findForJdbcParam(sql, jbpm4JeecgPage.getPage(), jbpm4JeecgPage.getRows());
		//Long count = jdbcDao.getCountForJdbcParam(countsql);
		Long count = new Long(maplist.size());
		j.setRows(maplist);
		j.setTotal(count);
		return j;
	}
	
	/**
	 * Spring Jdbc 分页
	 */
	public DataGrid datagridOld(Jbpm4JeecgPage jbpm4JeecgPage) {
		String sql = com.util.JeecgSqlUtil.getMethodSql(com.util.JeecgSqlUtil.getMethodUrl());
	
		String countsql = "select count(*) from t00_dict_param";
		DataGrid j = new DataGrid();
		
		LogUtil.info(sql);
		//System.out.println(sql);
//		List<Map<String, Object>> maplist =  jdbcDao.findForJdbcParam(sql, jbpm4JeecgPage.getPage(), jbpm4JeecgPage.getRows());
////		Long count = jdbcDao.getCountForJdbcParam(countsql);
//		Long count = new Long(maplist.size());
//		j.setRows(maplist);
//		j.setTotal(count);
		
		
		List<Deployment> list = processEngine.getRepositoryService().createDeploymentQuery().list();
		Long i = processEngine.getRepositoryService().createDeploymentQuery().count();
		j.setRows(list);
		j.setTotal(i);
		return j;
	}

	public void deploy(InputStream in) {
		ZipInputStream zip = new ZipInputStream(in);
		processEngine.getRepositoryService().createDeployment().addResourcesFromZipInputStream(zip).deploy();
	}
}
