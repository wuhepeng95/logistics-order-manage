package i.am.whp.model.enums;

public enum VehicleState {
    normal(1, "正常运行"),
    offtheline(2, "报修停运"),;

    private int state;
    private String detail;

    VehicleState(int state, String detail) {
        this.state = state;
        this.detail = detail;

    }

    public int getState() {
        return this.state;
    }

    public static VehicleState valueOf(int state) {

        switch (state) {
            case 1:
                return normal;
            case 2:
                return offtheline;
        }
        return null;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
