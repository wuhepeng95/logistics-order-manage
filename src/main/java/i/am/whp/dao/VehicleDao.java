package i.am.whp.dao;


import i.am.whp.model.po.User;

import java.util.List;

public interface UserDao {
    //select
    User queryUser(String username);
    //select
    int checkPassword(User user);
    //insert
    int addUser(User user);
    //updated
    int updateUser(User user);
    //get all user
    List<User> getAllUser();
}

