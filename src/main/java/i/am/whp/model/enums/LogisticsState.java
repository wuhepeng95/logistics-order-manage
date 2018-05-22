package i.am.whp.model.enums;

public enum LogisticsState {
    yilanjian(1, "已揽件"),
    yifahuo(2, "已发货"),
    yunshuzhong(3, "运输中"),
    daishouhuo(4, "待收货"),
    yiqianshou(5, "已签收"),;

    private int state;
    private String detail;

    LogisticsState() {
    }

    LogisticsState(int state, String detail) {
        this.state = state;
        this.detail = detail;
    }

    public static LogisticsState valueOf(int state) {
        switch (state) {
            case 1:
                return yilanjian;
            case 2:
                return yifahuo;
            case 3:
                return yunshuzhong;
            case 4:
                return daishouhuo;
            case 5:
                return yiqianshou;
        }
        return null;
    }


    public void setState(int state) {
        this.state = state;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getState() {
        return this.state;
    }

    public String getDetail() {
        return detail;
    }
}
