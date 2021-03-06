package i.am.whp.model.enums;

public enum Role {
    admin(1, "管理员"),
    transporter(2, "运输员"),
    user(3, "用户"),;

    private int role;
    private String detail;

    Role(int role, String detail) {
        this.role = role;
        this.detail = detail;

    }

    public int getRole() {
        return this.role;
    }

    public static Role valueOf(int role) {

        switch (role) {
            case 1:
                return admin;
            case 2:
                return transporter;
            case 3:
                return user;
        }
        return null;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
