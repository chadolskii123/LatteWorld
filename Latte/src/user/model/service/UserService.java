package user.model.service;

import user.model.exception.MyPageUserFailException;
import user.model.exception.RegisterCheckFailException;
import user.model.exception.RegisterFailException;
import user.model.exception.SelectUserFailException;
import user.model.exception.UpdateUserInfoFailException;
import user.model.vo.UserInfo;

public interface UserService {

	int registerUser(UserInfo user) throws RegisterFailException;

	int checkRegister(String userId) throws RegisterCheckFailException;

	UserInfo selectUser(UserInfo user) throws SelectUserFailException;

	UserInfo myPageUser(UserInfo user) throws MyPageUserFailException;

	void updateUserInfo(UserInfo user) throws UpdateUserInfoFailException;
	
}
