package com.workflow.vo;

import java.sql.Blob;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class Jbpm4Vo {
	
	private CommonsMultipartFile deployZip;
	
	private int pdId;
	private String pdName;
	private String pdvId;
	private String pdKey;
	private int pdVersion;
	private int piSum;
	
	private String instanceId;
	private String taskName;
	private String taskId;
	
	private Blob image;
	
	
	public CommonsMultipartFile getDeployZip() {
		return deployZip;
	}
	public void setDeployZip(CommonsMultipartFile deployZip) {
		this.deployZip = deployZip;
	}
	/**
	 * 流程定义ID
	 * @return
	 */
	public int getPdId() {
		return pdId;
	}
	public void setPdId(int pdId) {
		this.pdId = pdId;
	}
	/**
	 * 流程定义名称
	 * @return
	 */
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdvId() {
		return pdvId;
	}
	public void setPdvId(String pdvId) {
		this.pdvId = pdvId;
	}
	public String getPdKey() {
		return pdKey;
	}
	public void setPdKey(String pdKey) {
		this.pdKey = pdKey;
	}
	public int getPdVersion() {
		return pdVersion;
	}
	public void setPdVersion(int pdVersion) {
		this.pdVersion = pdVersion;
	}
	public int getPiSum() {
		return piSum;
	}
	public void setPiSum(int piSum) {
		this.piSum = piSum;
	}
	/**
	 * 流程实例ID
	 * @return
	 */
	public String getInstanceId() {
		return instanceId;
	}
	public void setInstanceId(String instanceId) {
		this.instanceId = instanceId;
	}
	/**
	 * 流程任务名称
	 * @return
	 */
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	
	
}
