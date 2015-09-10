package com.workflow.action;


import java.io.File;
import java.io.FileInputStream;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.jeecg.action.BaseAction;
import com.jeecg.pageModel.Json;
import com.jeecg.util.ExceptionUtil;
import com.jeecg.util.ResourceUtil;

import com.opensymphony.xwork2.ModelDriven;
import com.workflow.page.Jbpm4JeecgPage;
import com.workflow.service.Jbpm4JeecgServiceI;

@Action(value = "jbpm4JeecgAction", results = { @Result(name = "deploy-list", location = "/com/workflow/deploy-list.jsp") })
public class Jbpm4JeecgAction extends BaseAction implements ModelDriven<Jbpm4JeecgPage>{
	private static final Logger logger = Logger.getLogger(Jbpm4JeecgAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private Jbpm4JeecgServiceI jbpm4JeecgService;
	private Jbpm4JeecgPage jbpm4JeecgPage = new Jbpm4JeecgPage();

	
	/**
	 * 发布流程
	 */
	public void deploy() {
		Json j = new Json();
		try {
			MultiPartRequestWrapper multiPartRequest = (MultiPartRequestWrapper) ServletActionContext.getRequest();// 由于struts2上传文件时自动使用了request封装
			File[] files = multiPartRequest.getFiles(ResourceUtil.getUploadFieldName());// 上传的文件集合
			for(File f : files){
				jbpm4JeecgService.deploy(new FileInputStream(f));
			}
			j.setSuccess(true);
			j.setMsg("流程发布成功！");
		} catch (Exception e) {
			j.setMsg("流程发布失败！");
			logger.error(ExceptionUtil.getExceptionMessage(e));
		}
		writeJson(j);
	}
	
	/**
	 * 跳转：流程定义列表
	 */
	public String goDeployList() {
		return "deploy-list";
	}
	
	/**
	 * 获得pageHotel数据表格
	 */
	public void datagridDeployList() {
		writeJson(jbpm4JeecgService.datagrid(jbpm4JeecgPage));
	}
	
	
	
	/*@RequestMapping("/Jbpm4Action!toDeployPage.do")
	public ModelAndView toDeployPage(ModelMap map,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("jbpm4/deploy");
				
		return mav;
	} 
	
	@RequestMapping("/Jbpm4Action!deleteDeployment.do")
	public ModelAndView deleteDeployment(Jbpm4Vo jbpm4Vo,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		jbpm4JeecgService.delDeployment(Integer.toString(jbpm4Vo.getPdId()));
		dwzAjaxCallbackPara = new DwzAjaxCallbackPara("200", "删除成功", "流程定义管理",
				"", "true", "");
		mav.addAllObjects(JSONObject.fromObject(dwzAjaxCallbackPara));
		response.setContentType("text/html;charset=UTF-8");
		return mav;
	} 
	

	@RequestMapping("/Jbpm4Action!myTask.do")
	public ModelAndView myTask(Jbpm4Vo jbpm4Vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("jbpm4/myTask");
		jbpm4Vo.setUser(this.getSessionUser(request));
		// 如果没有分页对象，初始化分页对象
		if (page == null) {
			page = new ViewPage();
		}
		jbpm4JeecgService.queryMyTaskList(jbpm4Vo, page);
		mav.addObject("page", page);
		mav.addObject("jbpm4Vo", jbpm4Vo);
		return mav;
	} 
	
	@RequestMapping("/Jbpm4Action!toProcessImage.do")
	public ModelAndView toProcessImage(Jbpm4Vo jbpm4Vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("jbpm4/imageView");
//		jbpm4Vo.setPdName(jbpm4Service.getProcessName(jbpm4Vo.getInstanceId()));
		mav.addObject("jbpm4Vo", jbpm4Vo);
		return mav;
	} 
	
	
	@RequestMapping("/Jbpm4Action!queryImage.do")
	public void queryImage(Jbpm4Vo jbpm4Vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		jbpm4Vo = jbpm4JeecgService.getImage(jbpm4Vo.getInstanceId());
		if(jbpm4Vo.getImage()!=null && jbpm4Vo.getImage().length()>0) {
			OutputStream os = response.getOutputStream();
			InputStream inStream = null;
			try {
				inStream = jbpm4Vo.getImage().getBinaryStream();
				byte[] imageData = new byte[(int)jbpm4Vo.getImage().length()];
				response.reset();
				response.setContentType("image/jpg");
				response.setContentLength((int) imageData.length);
				response.setBufferSize((int) imageData.length);
				int len;
				while ((len = inStream.read(imageData)) > 0)
					os.write(imageData, 0, len);
				os.flush();
				inStream.close();
				inStream = null;
			}catch (Exception e) {
				 throw new Exception("读取图片流失败");
			}finally {
				if(os!=null) {
					os.close();
					os = null;
				}
				if(inStream!=null) {
					inStream.close();
					inStream = null;
				}
			}
			
		}
	}




*/	
	
	
	public Jbpm4JeecgPage getModel() {
		return jbpm4JeecgPage;
	}

	public Jbpm4JeecgPage getJbpm4JeecgPage() {
		return jbpm4JeecgPage;
	}

	public void setJbpm4JeecgPage(Jbpm4JeecgPage jbpm4JeecgPage) {
		this.jbpm4JeecgPage = jbpm4JeecgPage;
	}
}
