package user.model.service;

import static common.Template.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import user.model.dao.UserDao;
import user.model.exception.MyPageUserFailException;
import user.model.exception.RegisterCheckFailException;
import user.model.exception.RegisterFailException;
import user.model.exception.SelectUserFailException;
import user.model.exception.UpdateUserInfoFailException;
import user.model.vo.UserInfo;

public class UserServiceImpl implements UserService{
	
	UserDao uDao = new UserDao();
	@Override
	public int registerUser(UserInfo user) throws RegisterFailException {
		SqlSession session = getSqlSession();
		
		int result = uDao.registerUser(session, user);
		
		session.close();
		
		return result;
	}
	@Override
	public int checkRegister(String userId) throws RegisterCheckFailException {
		SqlSession session = getSqlSession();
		
		int check = uDao.checkRegister(session, userId);
		
		session.close();
		
		return check;
	}
	@Override
	public UserInfo selectUser(UserInfo user) throws SelectUserFailException {
		SqlSession session = getSqlSession();
		
		user = uDao.selectUser(session, user);

		session.close();
		
		return user;		
	}
	@Override
	public UserInfo myPageUser(UserInfo user) throws MyPageUserFailException {
		SqlSession session = getSqlSession();
		user = uDao.myPageUser(session, user);
		session.close();
		return user;		
	}
	@Override
	public void updateUserInfo(UserInfo user) throws UpdateUserInfoFailException {
		SqlSession session = getSqlSession();
		
		uDao.updateUserInfo(session, user);
		
		session.close();
	}
	
}
