package cn.wow.support.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.wow.common.domain.Account;
import cn.wow.common.service.AccountService;
import cn.wow.support.utils.Contants;

/**
 * 首页控制器
 * @author zhenjunzhuo
 */
@Controller
@RequestMapping(value = "")
public class IndexController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, Model model) {
		Account currentAccount = (Account) request.getSession().getAttribute(Contants.CURRENT_ACCOUNT);
		
		
		model.addAttribute("currentAccount", currentAccount);
		return "sys/index";
	}

}

		
		
