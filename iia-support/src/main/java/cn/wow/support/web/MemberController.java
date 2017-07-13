package cn.wow.support.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wow.common.domain.Account;
import cn.wow.common.domain.Group;
import cn.wow.common.domain.Member;
import cn.wow.common.service.GroupService;
import cn.wow.common.service.MemberService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;

@Controller
@RequestMapping(value = "member")
public class MemberController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	@Autowired
	private GroupService groupService;

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest httpServletRequest, Model model, String userName, String name, String groupId,
			String startCreateTime, String endCreateTime) {
		Map<String, Object> map = new PageMap(httpServletRequest);

		if (StringUtils.isNotBlank(userName)) {
			map.put("userName", userName);
		}
		if (StringUtils.isNotBlank(name)) {
			map.put("name", name);
		}
		if (StringUtils.isNotBlank(groupId)) {
			map.put("groupId", groupId);
		}
		if (StringUtils.isNotBlank(startCreateTime)) {
			map.put("startCreateTime", startCreateTime + " 00:00:00");
		}
		if (StringUtils.isNotBlank(endCreateTime)) {
			map.put("endCreateTime", endCreateTime + " 23:59:59");
		}
		List<Member> dataList = memberService.selectAllList(map);

		// 会员组
		Map<String, Object> groupMap = new PageMap(false);
		groupMap.put("custom_order_sql", "name asc");
		List<Group> groupList = groupService.selectAllList(groupMap);

		model.addAttribute("userName", userName);
		model.addAttribute("name", name);
		model.addAttribute("groupId", groupId);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		model.addAttribute("dataList", dataList);
		model.addAttribute("userName", userName);
		model.addAttribute("groupList", groupList);
		return "member/member_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id) {
		if (StringUtils.isNotBlank(id)) {
			Member member = memberService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", member);
		}

		// 会员组
		Map<String, Object> groupMap = new PageMap(false);
		groupMap.put("custom_order_sql", "name asc");
		List<Group> groupList = groupService.selectAllList(groupMap);

		model.addAttribute("groupList", groupList);
		model.addAttribute("mode", request.getParameter("mode"));
		return "member/member_detail";
	}

	@RequestMapping(value = "/save")
	public String save(HttpServletRequest request, Model model, String id, String userName, String password,
			String email, String url, String address, String name, Long groupId) {
		String resultCode = "";
		String resultMsg = "";
		Member member = null;

		try {
			if (StringUtils.isNotBlank(id)) {
				member = memberService.selectOne(Long.parseLong(id));
				member.setUserName(userName);
				member.setPassword(password);
				member.setEmail(email);
				member.setUrl(url);
				member.setAddress(address);
				member.setName(name);
				member.setGroupId(groupId);
				memberService.update(member);

				resultCode = Contants.EDIT_SUCCESS;
				resultMsg = Contants.EDIT_SUCCESS_MSG;
			} else {
				Account currentAccount = (Account) request.getSession().getAttribute(Contants.CURRENT_ACCOUNT);
				member = new Member();
				member.setUserName(userName);
				member.setPassword(password);
				member.setEmail(email);
				member.setUrl(url);
				member.setAddress(address);
				member.setName(name);
				member.setGroupId(1l);
				member.setCreator(currentAccount.getId());
				member.setCreateTime(new Date());
				memberService.save(member);

				resultCode = Contants.SAVE_SUCCESS;
				resultMsg = Contants.SAVE_SUCCESS_MSG;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			resultCode = Contants.EXCEPTION;
			resultMsg = Contants.EXCEPTION_MSG;
			
			// 会员组
			Map<String, Object> groupMap = new PageMap(false);
			groupMap.put("custom_order_sql", "name asc");
			List<Group> groupList = groupService.selectAllList(groupMap);
			model.addAttribute("groupList", groupList);
		}

		model.addAttribute("resultCode", resultCode);
		model.addAttribute("resultMsg", resultMsg);
		model.addAttribute("facadeBean", member);
		return "member/member_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/delete")
	public AjaxVO delete(HttpServletRequest request, String id) {
		AjaxVO vo = new AjaxVO();

		if (StringUtils.isNotBlank(id)) {
			int num = memberService.deleteByPrimaryKey(Long.parseLong(id));

			if (num > 0) {
				getResponse(vo, Contants.SUC_DELETE);
			} else {
				getResponse(vo, Contants.FAIL_DELETE);
			}
		} else {
			getResponse(vo, Contants.FAIL_DELETE);
		}

		return vo;
	}
}