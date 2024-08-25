package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {

	// 자동 DI - root-context.xml 에 bean 태그로 설정
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	// 자동 DI - root-context.xml 에 bean 태그로 설정
	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {
		
		log.info("------------- [CP 테스트] ----------------");
		
		// try(resource) > try 가 종료되면 resource 가 자동 닫기된다.
		try (Connection con = dataSource.getConnection()){
			
			log.info(con);
			
		} catch (Exception e) {
			// TODO: handle exception
			fail(e.getMessage());
		}
	}
	
	@Test
	public void testMybatis() {
		
		log.info("------------- [Mybatis 테스트] ----------------");
		
		// try(resource) > try 가 종료되면 resource 가 자동 닫기된다.
		try (SqlSession session = sqlSessionFactory.openSession();
			 Connection con = session.getConnection()){
			log.info(session);
			log.info(con);
		} catch (Exception e) {
			// TODO: handle exception
			fail(e.getMessage());
		}
	}
	
}
