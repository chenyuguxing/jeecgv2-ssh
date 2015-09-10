package sun.service.impl.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.page.test.DemoPage;
import sun.service.test.DemoServiceI;
import com.jeecg.dao.jdbc.JdbcDao;
import com.jeecg.pageModel.DataGrid;
import com.jeecg.service.impl.BaseServiceImpl;

/**   
 * @Title: ServiceImpl
 * @Description: 用户
 * @author zhangdaihao
 * @date 2011-12-25 20:55:16
 * @version V1.0   
 *
 */
@Service("demoService")
public class DemoServiceImpl extends BaseServiceImpl implements DemoServiceI {

	@Autowired
	//SQL 使用JdbcDao
	private JdbcDao jdbcDao;
	
	/**
	 * Spring Jdbc 分页
	 */
	public DataGrid listAllByJdbc(DemoPage demoPage) {
		//从对应路径中，获取SQL [sun/sql/test/DemoService_listAllByJdbc.sql]
		String sql = com.util.JeecgSqlUtil.getMethodSql(com.util.JeecgSqlUtil.getMethodUrl());
		String countsql = "select count(*) from jeecg_dict_param";
		DataGrid j = new DataGrid();
		List<Map<String, Object>> maplist =  jdbcDao.findForJdbcParam(sql, demoPage.getPage(), demoPage.getRows());
		Long count = jdbcDao.getCountForJdbcParam(countsql);
		j.setRows(maplist);
		j.setTotal(count);
		return j;
	}
	
}
