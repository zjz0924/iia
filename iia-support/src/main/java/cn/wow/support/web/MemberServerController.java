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
import cn.wow.common.domain.MemberServer;
import cn.wow.common.service.MemberServerService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;

/**
 * 会员服务
 * @author zhenjunzhuo 
 * 2017-07-12
 */
@Controller
@RequestMapping(value = "server")
public class MemberServerController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(MemberServerController.class);

	@Autowired
	private MemberServerService memberServerService;
	
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest httpServletRequest, Model model, String title, String startCreateTime, String endCreateTime, String isShow) {
		Map<String, Object> map = new PageMap(httpServletRequest);

		if (StringUtils.isNotBlank(title)) {
			map.put("title", title);
		}
		if (StringUtils.isNotBlank(isShow)) {
			map.put("isShow", isShow);
		}
		if (StringUtils.isNotBlank(startCreateTime)) {
			map.put("startCreateTime", startCreateTime + " 00:00:00");
		}
		if (StringUtils.isNotBlank(endCreateTime)) {
			map.put("endCreateTime", endCreateTime + " 23:59:59");
		}
		map.put("custom_order_sql", "create_time desc");
		List<MemberServer> dataList = memberServerService.selectAllList(map);

		model.addAttribute("title", title);
		model.addAttribute("isShow", isShow);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		model.addAttribute("dataList", dataList);
		return "member/server_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id) {
		if (StringUtils.isNotBlank(id)) {
			MemberServer memberServer = memberServerService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", memberServer);
		}
		
		model.addAttribute("mode", request.getParameter("mode"));
		return "member/server_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/save")
	public AjaxVO save(HttpServletRequest request, Model model, String id, String title, String content, String isShow) {
		MemberServer memberServer = null;
		AjaxVO vo = new AjaxVO();
		
		try {
			if (StringUtils.isNotBlank(id)) {
				memberServer = memberServerService.selectOne(Long.parseLong(id));
				memberServer.setTitle(title);
				memberServer.setContent(content);
				memberServer.setIsShow(isShow);
				memberServerService.update(memberServer);
				
				getResponse(vo, Contants.SUC_EDIT);
			} else {
				Account currentAccount = (Account) request.getSession().getAttribute(Contants.CURRENT_ACCOUNT);
				memberServer = new MemberServer();
				memberServer.setTitle(title);
				memberServer.setCreateTime(new Date());
				memberServer.setCreator(currentAccount.getId());
				memberServer.setContent(content);
				memberServer.setIsShow(isShow);
				memberServerService.save(memberServer);
				
				getResponse(vo, Contants.SUC_ADD);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			
			getResponse(vo, Contants.EXCEP);
		}
		return vo;
	}

	@ResponseBody
	@RequestMapping(value = "/delete")
	public AjaxVO delete(HttpServletRequest request, String id) {
		AjaxVO vo = new AjaxVO();

		if (StringUtils.isNotBlank(id)) {
			int num = memberServerService.deleteByPrimaryKey(Long.parseLong(id));

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
	
	
	/**
	 * 隐藏/显示类型
	 * 
	 * @param id
	 * @param lock
	 */
	@ResponseBody
	@RequestMapping(value = "/lock")
	public AjaxVO lock(HttpServletRequest request, String id, String lock) {
		AjaxVO vo = new AjaxVO();

		try {
			if (StringUtils.isNotBlank(id)) {
				MemberServer server = memberServerService.selectOne(Long.parseLong(id));

				if (server != null) {
					server.setIsShow(lock);
					memberServerService.update(server);

					getResponse(vo, Contants.SUC_EDIT);
				} else {
					getResponse(vo, Contants.FAIL_EDIT);
				}
			} else {
				getResponse(vo, Contants.FAIL_EDIT);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			getResponse(vo, Contants.EXCEP);
		}
		return vo;
	}
}