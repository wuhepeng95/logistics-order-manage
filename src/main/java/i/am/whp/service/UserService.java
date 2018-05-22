package i.am.whp.service;

import i.am.whp.model.po.User;

import java.util.List;

public interface UserService {

    User queryUser(String username);

    boolean addUser(User user);

    boolean checkPassword(User user);

    boolean updateUserInfo(User user);

    List<User> getAllUser();
}
