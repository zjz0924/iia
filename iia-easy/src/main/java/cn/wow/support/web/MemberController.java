package cn.wow.support.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wow.common.domain.Member;
import cn.wow.common.service.MemberService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.support.utils.Contants;

/**
 * 首页控制器
 * 
 * @author zhenjunzhuo
 */
@Controller
@RequestMapping(value = "member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/loginPage")
	public String loginPage(HttpServletRequest request, Model model) {
		return "member/login_page";
	}

	@RequestMapping(value = "/login")
	@ResponseBody
	public AjaxVO login(HttpServletRequest request, String userName, String password) {
		AjaxVO vo = new AjaxVO();

		if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
			vo.setSuccess(false);
			vo.setMsg("登录失败，用户名和密码不能为空");
			return vo;
		}

		Member member = memberService.selectByUserName(userName);
		if (member == null) {
			vo.setSuccess(false);
			vo.setMsg("登录失败，用户不存在");
			return vo;
		}

		if (!password.equals(member.getPassword())) {
			vo.setSuccess(false);
			vo.setMsg("登录失败，密码不正确");
			return vo;
		}

		vo.setSuccess(true);
		vo.setMsg("登录成功，欢迎使用");

		request.getSession().setAttribute(Contants.CURRENT_MEMBER, member);
		return vo;
	}

	@RequestMapping(value = "/logout")
	@ResponseBody
	public AjaxVO logout(HttpServletRequest request) {
		request.getSession().removeAttribute(Contants.CURRENT_MEMBER);

		AjaxVO vo = new AjaxVO();
		vo.setSuccess(true);
		vo.setMsg("登出成功，欢迎下次使用");
		return vo;
	}
	
	
	@RequestMapping(value = "/registerPage")
	public String registerPage(HttpServletRequest request, Model model) {
		return "member/register_page";
	}
	
	
	@RequestMapping(value = "/register")
	@ResponseBody
	public AjaxVO register(HttpServletRequest request, String userName, String password, String name, String email) {
		AjaxVO vo = new AjaxVO();

		if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
			vo.setSuccess(false);
			vo.setMsg("注册失败，用户名和密码不能为空");
			return vo;
		}

		Member member = new Member();
		member.setUserName(userName);
		member.setPassword(password);
		member.setEmail(email);
		member.setName(name);
		member.setGroupId(1l);
		member.setCreateTime(new Date());
		memberService.save(member);

		vo.setSuccess(true);
		vo.setMsg("注册成功");
		return vo;
	}
	

}
