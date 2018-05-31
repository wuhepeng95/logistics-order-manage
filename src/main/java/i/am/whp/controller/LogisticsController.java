package i.am.whp.controller;

import com.alibaba.fastjson.JSON;
import i.am.whp.model.LogisticsInfoVo;
import i.am.whp.model.enums.LogisticsState;
import i.am.whp.model.po.LogisticsInfo;
import i.am.whp.model.po.LogisticsPrice;
import i.am.whp.service.LogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
public class LogisticsController {
    @Autowired
    LogisticsService logisticsService;

    @RequestMapping("/follow")
    public String follow(String orderid,Model model) {
        if(orderid!=null){
            model.addAttribute("followId",orderid);
        }
        return "follow";
    }

    @RequestMapping(value = "/queryPrice", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String queryPrice(String fahuoprovince, String fahuocity, String shouhuoprovince, String shouhuocity, HttpSession session) {
        if (fahuoprovince == null || shouhuoprovince == null) {
            return "";
        }
        LogisticsPrice logisticsPrice = logisticsService.queryPrice(fahuoprovince.concat(fahuocity), shouhuoprovince.concat(shouhuocity));
        return JSON.toJSONString(logisticsPrice);
    }

    @RequestMapping(value = "/queryLogisticsInfo", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String queryLogisticsInfo(String orderid) {
        if (orderid == null || orderid.length() < 10) {
            return "";
        }
        List<LogisticsInfo> logisticsInfos = logisticsService.queryLogisticsInfo(Long.parseLong(orderid));
        List<LogisticsInfoVo> logisticsInfoVos = new ArrayList<>();

        logisticsInfos.forEach(logisticsInfo -> {
            LogisticsInfoVo logisticsInfoVo = new LogisticsInfoVo();
            logisticsInfoVo.setInfo(logisticsInfo.getInfo());
            logisticsInfoVo.setState(LogisticsState.valueOf(logisticsInfo.getLogisticsstate()).getDetail());
            logisticsInfoVo.setUpdatetime(new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date(logisticsInfo.getUpdatetime().getTime())));
            logisticsInfoVos.add(logisticsInfoVo);
        });
        return JSON.toJSONString(logisticsInfoVos);
    }
}