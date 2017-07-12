package cn.wow.support.web;

import java.util.Map;
import java.util.List;
import java.lang.Long;
import java.lang.String;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.lang3.StringUtils;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;
import cn.wow.common.domain.Account;
import cn.wow.common.domain.Activity;
import cn.wow.common.service.ActivityService;

/**
 * 协会活动
 * 
 * @author zhenjunzhuo 
 * 2017-07-12
 */
@Controller
@RequestMapping(value = "activity")
public class ActivityController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(ActivityController.class);

	@Autowired
	private ActivityService activityService;

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest httpServletRequest, Model model, String title, String startCreateTime, String endCreateTime) {
		Map<String, Object> map = new PageMap(httpServletRequest);

		if (StringUtils.isNotBlank(title)) {
			map.put("title", title);
		}
		if (StringUtils.isNotBlank(startCreateTime)) {
			map.put("startCreateTime", startCreateTime + " 00:00:00");
		}
		if (StringUtils.isNotBlank(endCreateTime)) {
			map.put("endCreateTime", endCreateTime + " 23:59:59");
		}
		map.put("custom_order_sql", "create_time desc");
		List<Activity> dataList = activityService.selectAllList(map);

		model.addAttribute("title", title);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		model.addAttribute("dataList", dataList);
		return "activity/activity_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id) {
		if (StringUtils.isNotBlank(id)) {
			Activity activity = activityService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", activity);
		}

		model.addAttribute("mode", request.getParameter("mode"));
		return "activity/activity_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/save")
	public AjaxVO save(HttpServletRequest request, Model model, String id, String title, String content) {
		Activity activity = null;
		AjaxVO vo = new AjaxVO();
		
		try {
			if (StringUtils.isNotBlank(id)) {
				activity = activityService.selectOne(Long.parseLong(id));
				activity.setTitle(title);
				activity.setContent(content);
				activityService.update(activity);
				
				getResponse(vo, Contants.SUC_EDIT);
			} else {
				Account currentAccount = (Account) request.getSession().getAttribute(Contants.CURRENT_ACCOUNT);
				activity = new Activity();
				activity.setTitle(title);
				activity.setCreateTime(new Date());
				activity.setCreator(currentAccount.getId());
				activity.setContent(content);
				activityService.save(activity);
				
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
			int num = activityService.deleteByPrimaryKey(Long.parseLong(id));

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