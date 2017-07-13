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

import cn.wow.common.domain.Group;
import cn.wow.common.domain.Member;
import cn.wow.common.service.GroupService;
import cn.wow.common.service.MemberService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;

/**
 * 会员组
 * 
 * @author zhenjunzhuo
 *	2017-07-13
 */
@Controller
@RequestMapping(value = "group")
public class GroupController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	private GroupService groupService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest httpServletRequest, Model model, String name, String startCreateTime,
			String endCreateTime) {
		Map<String, Object> map = new PageMap(httpServletRequest);
		map.put("custom_order_sql", "name asc");

		if (StringUtils.isNotBlank(name)) {
			map.put("name", name);
		}
		if (StringUtils.isNotBlank(startCreateTime)) {
			map.put("startCreateTime", startCreateTime + " 00:00:00");
		}
		if (StringUtils.isNotBlank(endCreateTime)) {
			map.put("endCreateTime", endCreateTime + " 23:59:59");
		}
		
		List<Group> dataList = groupService.selectAllList(map);

		model.addAttribute("dataList", dataList);
		model.addAttribute("name", name);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		return "member/group_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id) {
		if (StringUtils.isNotBlank(id)) {
			Group group = groupService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", group);
		}

		model.addAttribute("mode", request.getParameter("mode"));
		return "member/group_detail";
	}

	@RequestMapping(value = "/save")
	public String save(HttpServletRequest request, Model model, String id, String name) {
		String resultCode = "";
		String resultMsg = "";
		Group group = null;

		try {
			if (StringUtils.isNotBlank(id)) {
				group = groupService.selectOne(Long.parseLong(id));
				group.setName(name);
				groupService.update(group);

				resultCode = Contants.EDIT_SUCCESS;
				resultMsg = Contants.EDIT_SUCCESS_MSG;
			} else {
				group = new Group();
				group.setName(name);
				group.setCreateTime(new Date());
				groupService.save(group);

				resultCode = Contants.SAVE_SUCCESS;
				resultMsg = Contants.SAVE_SUCCESS_MSG;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			resultCode = Contants.EXCEPTION;
			resultMsg = Contants.EXCEPTION_MSG;
		}

		model.addAttribute("resultCode", resultCode);
		model.addAttribute("resultMsg", resultMsg);
		model.addAttribute("facadeBean", group);
		return "member/group_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/delete")
	public AjaxVO delete(HttpServletRequest request, String id) {
		AjaxVO vo = new AjaxVO();

		if (StringUtils.isNotBlank(id)) {
			Map<String, Object> map = new PageMap(false);
			map.put("groupId", id);
			
			List<Member> memberList = memberService.selectAllList(map);
			if(memberList != null && memberList.size() > 0){
				vo.setSuccess(false);
				vo.setMsg("无法删除该类型，该类型已被使用");
				return vo;
			}
			int num = groupService.deleteByPrimaryKey(Long.parseLong(id));

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