package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

// dao -> 자동 완성 처리된다.
@Repository
public interface TimeMapper {
	
	@Select("select sysdate from dual")
	public String getTime();
	
	// mapper.xml 과 연결되어 있다.
	public String getTime2();
	
}
