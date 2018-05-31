package i.am.whp.model.enums;

public enum OrderState {
    daizhifu(1, "待支付"),
    dailanjian(2, "待揽件"),
    yunshuzhong(3, "运输中"),
    yiwancheng(4, "已完成"),
    yishixiao(5, "已失效"),;

    private int state;
    private String detail;

    OrderState() {
    }

    OrderState(int state, String detail) {
        this.state = state;
        this.detail = detail;
    }

    public static OrderState valueOf(int state) {

        switch (state) {
            case 1:
                return daizhifu;
            case 2:
                return dailanjian;
            case 3:
                return yunshuzhong;
            case 4:
                return yiwancheng;
            case 5:
                return yishixiao;
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
