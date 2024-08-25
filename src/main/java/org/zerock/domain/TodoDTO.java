package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {
	
	// yyyy-mm-dd > 사용자 입력 날짜를 java로 가져올 때, 패턴 지정 필수 (안하면 오류)
	// pattern > java SimpleDateForm 참조
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 소문자 mm >> 분을 의미함
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 소문자 mm >> 분을 의미함
	private Date endDate;
	
}
