package i.am.whp.model.enums;

public enum Category {
    ordinary(1, "普通"),
    precious(2, "贵重"),
    special(3, "特殊"),
    others(4, "其他"),;

    private int state;
    private String detail;

    Category() {
    }

    Category(int state, String detail) {
        this.state = state;
        this.detail = detail;
    }

    public static Category valueOf(int state) {

        switch (state) {
            case 1:
                return ordinary;
            case 2:
                return precious;
            case 3:
                return special;
            case 4:
                return others;
        }
        return null;
    }

    public static Category valueOfDetatl(String state) {
        switch (state) {
            case "普通":
                return ordinary;
            case "贵重":
                return precious;
            case "特殊":
                return special;
            case "其他":
                return others;
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
