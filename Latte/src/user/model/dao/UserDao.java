package user.model.dao;

import org.apache.ibatis.session.SqlSession;

import user.model.exception.MyPageUserFailException;
import user.model.exception.RegisterCheckFailException;
import user.model.exception.RegisterFailException;
import user.model.exception.SelectUserFailException;
import user.model.exception.UpdateUserInfoFailException;
import user.model.vo.UserInfo;

public class UserDao {

	public int registerUser(SqlSession session, UserInfo user) throws RegisterFailException {
		int result = session.insert("userMapper.registerUser", user);
		if(result <= 0) {
			session.rollback();
			session.close();
			throw new RegisterFailException("회원 가입 실패!");
		}
		
		session.commit();
		
		return result;
	}

	public int checkRegister(SqlSession session, String userId) throws RegisterCheckFailException {
		
		int check = session.selectOne("userMapper.checkRegister", userId);
		
		if(check >= 1) {
			session.close();
			throw new RegisterCheckFailException("중복되는 아이디가 있습니다.");
		}
		
		return check;
	}

	public UserInfo selectUser(SqlSession session, UserInfo user) throws SelectUserFailException {
		
		user = session.selectOne("userMapper.selectUser", user);
		if(user == null) {
			session.close();
			throw new SelectUserFailException("로그인 실패!");
		}
		
		return user;
	}

	public UserInfo myPageUser(SqlSession session, UserInfo user) throws MyPageUserFailException {
		user = session.selectOne("userMapper.myPageUser", user);
		System.out.println(user);
		if(user == null) {
			session.close();
			throw new MyPageUserFailException("마이페이지 조회 실패!");
		}
		
		return user;
	}

	public void updateUserInfo(SqlSession session, UserInfo user) throws UpdateUserInfoFailException {
		int result = session.update("userMapper.updateUser", user);
		
		if(result <= 0) {
			session.rollback();
			session.close();
			throw new UpdateUserInfoFailException("유저 정보 업데이트 실패!");
		}
		
		session.commit();
		
	}

}
