package sun.service.core;

import java.util.List;

import sun.entity.core.GroupEntity;
import sun.page.core.GroupPage;

import com.jeecg.pageModel.DataGrid;
import com.jeecg.service.BaseServiceI;

/**   
 * @Title: Service
 * @Description: 组织机构
 * @author zhangdaihao
 * @date 2013-01-18 12:18:08
 * @version V1.0   
 *
 */
public interface GroupServiceI extends BaseServiceI {

	/**
	 * 获得数据表格
	 * 
	 * @param bug
	 * @return
	 */
	public DataGrid datagrid(GroupPage groupPage);

	/**
	 * 添加
	 * 
	 * @param groupPage
	 */
	public void add(GroupPage groupPage);

	/**
	 * 修改
	 * 
	 * @param groupPage
	 */
	public void update(GroupPage groupPage) throws Exception;

	/**
	 * 删除
	 * 
	 * @param ids
	 */
	public void delete(String ids);

	/**
	 * 获得
	 * 
	 * @param Group
	 * @return
	 */
	public GroupEntity get(GroupPage groupPage);
	
	
	/**
	 * 获得
	 * 
	 * @param obid
	 * @return
	 */
	public GroupEntity get(String obid);
	
	/**
	 * 获取所有数据
	 */
	public List<GroupEntity> listAll(GroupPage groupPage);

}
