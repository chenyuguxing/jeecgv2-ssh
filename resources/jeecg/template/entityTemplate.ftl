package ${bussiPackage}.entity.${entityPackage};

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
 * @Title: Entity
 * @Description: ${ftl_description}
 * @author zhangdaihao
 * @date ${ftl_create_time}
 * @version V1.0   
 *
 */
@Entity
@Table(name = "${tableName}", schema = "")
public class ${entityName}Entity implements java.io.Serializable {
	//标识号
	private String ${jeecg_table_id};
	
	@Id
	@Column(name = "${jeecg_table_id?capitalize}",  nullable = false, length = 36)
	public String get${jeecg_table_id?cap_first}() {
		return ${jeecg_table_id};
	}
	public void set${jeecg_table_id?cap_first}(String ${jeecg_table_id}) {
		this.${jeecg_table_id} = ${jeecg_table_id};
	}
}
