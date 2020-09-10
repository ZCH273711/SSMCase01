package com.ssm.dao;

import org.apache.ibatis.annotations.Param;
import java.util.List;
import com.ssm.po.User;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

public interface UserDao {
    public List<User> selectUserList(@Param("keywords") String keywords, @Param("userListRoleId") Integer userListRoleId);
    public User findUser(@Param("loginName") String loginName, @Param("password") String password);
    public User getUserByLoginName(String loginName);
    public User getUserByUserId(Integer userId);
    public int addUser(User user);
    public int updateUser(User user);
    public int delUser(Integer userId);
    public int setUserStatus(User user);
}
