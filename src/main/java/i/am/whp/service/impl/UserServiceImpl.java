package i.am.whp.service.impl;


import i.am.whp.dao.UserDao;
import i.am.whp.model.po.User;
import i.am.whp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public User queryUser(String username) {
        return userDao.queryUser(username);
    }

    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user) == 1;
    }

    @Override
    public boolean checkPassword(User user) {
        return userDao.checkPassword(user) == 1;
    }

    @Override
    public boolean updateUserInfo(User user) {
        return userDao.updateUser(user) == 1;
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }
}
