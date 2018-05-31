import i.am.whp.dao.LogisticsDao;
import i.am.whp.dao.OrderDao;
import i.am.whp.dao.UserDao;
import i.am.whp.dao.VehicleDao;
import i.am.whp.model.po.ConsigneeInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class TestBase {
    @Autowired
    LogisticsDao logisticsDao;
    @Autowired
    UserDao userDao;
    @Autowired
    OrderDao orderDao;
    @Autowired
    VehicleDao vehicleDao;

    @Test
    public void getLogisticsInfo() {
        System.out.println("结果" + logisticsDao.queryLogisticsInfo(309760859704L));
    }

    @Test
    public void user() {
        System.out.println(userDao.queryUser("test").toString());
    }

    @Test
    public void queryOrderDetail() {
        System.out.println("结果" + orderDao.queryOrderDetail(309760859704L));
    }

    @Test
    public void addConsigneeInfo() {
        ConsigneeInfo consigneeInfo = new ConsigneeInfo();
        consigneeInfo.setUsername("test");
        consigneeInfo.setConsigneename("张三");
        consigneeInfo.setConsigneephone("18699349932");
        consigneeInfo.setReachaddress("新疆石河子大学");
        consigneeInfo.setZipcode(832000);
        int i = orderDao.addConsigneeInfo(consigneeInfo);
        System.out.println("结果" + i);
        System.out.println("结果" + consigneeInfo.getConsigneeid());
    }


    @Test
    public void isExistConsigneeInfo() {
        ConsigneeInfo consigneeInfo = new ConsigneeInfo();
        consigneeInfo.setUsername("test");
        consigneeInfo.setConsigneename("张12三");
        consigneeInfo.setConsigneephone("18699349932");
        consigneeInfo.setReachaddress("新疆石河子大学");
        consigneeInfo.setZipcode(832000);
        System.out.println("结果"+orderDao.existConsigneeInfo(consigneeInfo));
    }

    @Test
    public void getAllUser() {
        System.out.println(userDao.getAllUser());
    }

    @Test
    public void getLoadInfo() {
        //System.out.println(vehicleDao.getLoadInfo());
    }
}
