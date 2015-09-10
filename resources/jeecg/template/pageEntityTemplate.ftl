package ${bussiPackage}.page.${entityPackage};

import java.math.BigDecimal;
import java.util.Date;

<#include "/include/pageInclude.ftl">

/**   
 * @Title: Page
 * @Description: ${ftl_description}
 * @author zhangdaihao
 * @date ${ftl_create_time}
 * @version V1.0   
 *
 */
 
 @SuppressWarnings("serial")
public class ${entityName}Page  extends BasePage implements java.io.Serializable {
	private String  ${jeecg_table_id};

	public String get${jeecg_table_id?cap_first}() {
		return ${jeecg_table_id};
	}

	public void set${jeecg_table_id?cap_first}(String ${jeecg_table_id}) {
		this.${jeecg_table_id} = ${jeecg_table_id};
	}
}
