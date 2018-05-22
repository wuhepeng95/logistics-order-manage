package i.am.whp.model.po;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class User {
    private int userid;
    private String username;
    private String password;
    private String mobile;
    private String email;
    /**
     * @see i.am.whp.model.enums.Role
     */
    private int role;

    private String address;
    private Timestamp regtime;
    private Timestamp logintime;
}
