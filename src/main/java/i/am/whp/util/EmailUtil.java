package i.am.whp.util;

import i.am.whp.model.po.User;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class EmailUtil {

    // 初始化参数
    private static Properties props;
    // 发件人地址
    private static InternetAddress sendMan = null;
    // 发件人的邮箱地址
    private static String userName = "q1041259750@163.com";
    // 发件人的密码
    private static String password = "whp199508.29";

    static {
        props = new Properties();
        // 指定协议
        props.put("mail.transport.protocol", "smtp");
        // 主机 smtp.qq.com
        props.put("mail.smtp.host", "smtp.163.com");
        // 端口
        props.put("mail.smtp.port", 465);
        // 用户密码认证
        props.put("mail.smtp.auth", "true");
        // 调试模式
        props.put("mail.debug", "true");
        props.put("mail.smtp.ssl.enable", "true");

        try {
            //创建地址对象
            sendMan = new InternetAddress(userName);
        } catch (AddressException e) {
            throw new RuntimeException(e);
        }
    }

    public static String sendResetPasswordEmail(User user) {
        try {
            // 创建邮件会话  
            Session session = Session.getInstance(props);
            // 创建邮件对象  
            MimeMessage msg = new MimeMessage(session);
            // 设置发件人  
            msg.setFrom(sendMan);
            // 设置邮件收件人  
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
            // 标题  
            msg.setSubject("重置密码验证码");
            // 发送时间  
            msg.setSentDate(new Date());
            // 发送内容
            String verificationCode = getVerificationCode();
            String content = "[舞鹤物流]" + user.getUsername() + "你好!你重置密码的验证码为:<a href=#>" + verificationCode + "</a>。该验证码5分钟之内有效,请不要轻易告诉别人！";
            msg.setContent(content, "text/html;charset=gbk");
            // 5. 发送
            Transport trans = session.getTransport();
            trans.connect(userName, password);
            trans.sendMessage(msg, msg.getAllRecipients());
            trans.close();
            return verificationCode;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }

    public static String getVerificationCode() {
        StringBuilder stringBuilder = new StringBuilder("");
        int randomInt;
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            randomInt = random.nextInt(10);
            stringBuilder.append(randomInt);
        }
        return stringBuilder.toString();
    }
}
