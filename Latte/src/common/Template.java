package common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {
	public static SqlSession getSqlSession() {
		// SqlSession 객체를 반환하기 위한 변수 선언
		SqlSession session = null;
		
		//	JDBCTemplate에서 public static Connection getConnection()과 같은 개념의 메소드
		//	기존에는 여기서 driver, sql 접속 정보가 들어있는 properties 파일을 불러와
		//	이 메소드 안에서 DBMS와 연결 했다.
		
		//	하지만 우리가 초반에 mybatis-config.xml 파일을 통해서 driver, sql 접속 관련 정보를 설정 했었다.
		//	그러면 그 mybatis-config.xml 파일을 불러와야 한다.
		
		try {
			InputStream stream = Resources.getResourceAsStream("/mybatis-config.xml");
			
			//	SqlSession을 만들기 위해서 SqlSessionFactory에서 openSession이라는 것을 해줘야 하는데
			//	SqlSessionFactory는 SqlSessionFactoryBuilder라는 클래스의 build()를 통해서 생성
			session = new SqlSessionFactoryBuilder().build(stream).openSession(false);
			
		} catch (IOException e) {
			System.out.println("이거가 나오는거?");
			e.printStackTrace();
		}
		
		return session;
	}
	
		//	commit(), rollback(), close() 함수에 대해서는
		//	SqlSession 클래스가 commit, rollback, close를 제공해주고 Statement, ResulstSet관련 부분에 대해서도
		//	더 편리하게 작성하게 되었기 때문에 사용하지 않게 됨
	
		//	다시 MemberServiceImpl로 돌아가자....!
	
}
