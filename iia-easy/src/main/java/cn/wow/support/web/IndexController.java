package cn.wow.support.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.wow.common.domain.Contact;
import cn.wow.common.domain.Link;
import cn.wow.common.domain.Member;
import cn.wow.common.domain.ScrollPic;
import cn.wow.common.service.ContactService;
import cn.wow.common.service.LinkService;
import cn.wow.common.service.MemberService;
import cn.wow.common.service.ScrollPicService;
import cn.wow.common.utils.pagination.PageMap;

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
	@Autowired
	private ScrollPicService scrollPicService;
	@Autowired
	private LinkService linkService;
	
	//照片资源路径
  	@Value("${res.url.root}")
  	protected String resUrl;
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, Model model) {
		
		// 联系信息
		Contact contact = contactService.selectOne(1l);
		
		// 会员数
		Map<String, Object> map = new PageMap(false);
		List<Member> memberList = memberService.selectAllList(map);
		int memberNum = memberList != null ? memberList.size(): 0;
		
		// 滚动大图
		Map<String, Object> scroPicMap = new PageMap(1, 6);
		scroPicMap.put("custom_order_sql", "sort desc");
		List<ScrollPic> scrollPicList =  scrollPicService.selectAllList(scroPicMap);
		
		// 友情链接
		Map<String, Object> linkMap = new PageMap(false);
		linkMap.put("custom_order_sql", "sort desc");
		List<Link> linkList = linkService.selectAllList(linkMap);
		
		model.addAttribute("resUrl", resUrl);
		model.addAttribute("contact", contact);
		model.addAttribute("memberNum", memberNum);
		model.addAttribute("scrollPicList", scrollPicList);
		model.addAttribute("linkList", linkList);
		return "index/index";
	}

}

		
		
