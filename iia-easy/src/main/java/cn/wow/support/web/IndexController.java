package cn.wow.support.web;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.wow.common.domain.Account;
import cn.wow.common.domain.Contact;
import cn.wow.common.domain.Member;
import cn.wow.common.service.ContactService;
import cn.wow.common.service.MemberService;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;

/**
 * 首页控制器
 * @author zhenjunzhuo
 */
@Controller
@RequestMapping(value = "")
public class IndexController {
	
	@Autowired
	private ContactService contactService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, Model model) {
		
		// 联系信息
		Contact contact = contactService.selectOne(1l);
		
		// 会员数
		Map<String, Object> map = new PageMap(false);
		List<Member> memberList = memberService.selectAllList(map);
		int memberNum = memberList != null ? memberList.size(): 0;
		
		model.addAttribute("contact", contact);
		model.addAttribute("memberNum", memberNum);
		return "index/index";
	}

	
	@RequestMapping(value = "/main")
	public String main(HttpServletRequest request, Model model) {
		Account currentAccount = (Account) request.getSession().getAttribute(Contants.CURRENT_ACCOUNT);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String loginTime = sdf.format(request.getSession().getCreationTime());
		
		Map<String, Object> map = new PageMap(false);
		List<Member> memberList = memberService.selectAllList(map);
		int memberNum = memberList != null ? memberList.size(): 0;
		
		model.addAttribute("currentAccount", currentAccount);
		model.addAttribute("loginTime", loginTime);
		model.addAttribute("memberNum", memberNum);
		return "sys/main";
	}
	
	
}

		
		
