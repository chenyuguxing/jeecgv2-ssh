package sun.action.test;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import sun.page.test.DemoPage;
import sun.service.test.DemoServiceI;
import com.jeecg.action.BaseAction;

import com.opensymphony.xwork2.ModelDriven;

/**   
 * @Title: Action
 * @Description: 用户
 * @author zhangdaihao
 * @date 2011-12-25 20:55:16
 * @version V1.0   
 *
 */
@Action(value = "demoAction", results = { @Result(name = "demo-jdbc", location = "/sun/test/demo-jdbc.jsp") })
public class DemoAction extends BaseAction implements ModelDriven<DemoPage> {

	private static final Logger logger = Logger.getLogger(DemoAction.class);

	@Autowired
	private DemoServiceI demoService;

	private DemoPage demoPage = new DemoPage();

	public DemoPage getModel() {
		return demoPage;
	}


	/**
	 * 获得pageHotel数据表格
	 */
	public void datagridByJdbc() {
		writeJson(demoService.listAllByJdbc(demoPage));
	}
	
	/**
	 * 
	 * @return
	 */
	public String goDemoJdbc() {
		return "demo-jdbc";
	}


	
	public DemoPage getDemoPage() {
		return demoPage;
	}


	public void setDemoPage(DemoPage demoPage) {
		this.demoPage = demoPage;
	}
}
