package org.zerock.sample;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.zerock.domain.SampleDTO;

import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
// 설정 파일 지정 > 서버와 상관이 있음 : root-context.xml, servlet-context.xml
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class SampleRestControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; //Spring 의 WebMVC 테스팅을 위한 가짜 MVC 객체
	
	@Before // Test 전에 실행하는 메서드
	public void setup() { // mockMVC 세팅하는 메서드
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testConvert() throws Exception {
		
		// 전달하는 개체 SampleDTO
		SampleDTO dto = new SampleDTO("홍길동", 10);
		
		// json 데이터를 String 으로 만들어서 전달
		String jsonStr = new Gson().toJson(dto);
		
		log.info(jsonStr);
		
		mockMvc.perform(
				post("/sampleRest/sample")
				.contentType(MediaType.APPLICATION_JSON) // 넘겨주는 data type : json
				.content(jsonStr)) // 넘겨주는 data
				.andExpect(status().is(200)); 

	}
	
}
