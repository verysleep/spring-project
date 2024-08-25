package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
// 생성자를 이용해서 파라메터로 값을 전달해서 저장시킨다.
@AllArgsConstructor
// 기본 생성자 생성
@NoArgsConstructor
public class SampleDTO {

	private String name;
	// String 으로 넘어오기 때문에 int 타입을 캐스팅하기
	private int age; // 기본값 0
	
}
