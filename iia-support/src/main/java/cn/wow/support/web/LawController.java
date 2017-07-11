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
import cn.wow.common.domain.Law;
import cn.wow.common.domain.SoundPic;
import cn.wow.common.service.LawService;

/**
 * 政策法规
 * @author zhenjunzhuo 
 * 2017-07-11
 */
@Controller
@RequestMapping(value = "law")
public class LawController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(LawController.class);

	@Autowired
	private LawService lawService;

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest httpServletRequest, Model model, String title, String startCreateTime, String endCreateTime, String type) {
		Map<String, Object> map = new PageMap(httpServletRequest);

		if (StringUtils.isNotBlank(title)) {
			map.put("title", title);
		}
		if (StringUtils.isNotBlank(type)) {
			map.put("type", type);
		}
		if (StringUtils.isNotBlank(startCreateTime)) {
			map.put("startCreateTime", startCreateTime + " 00:00:00");
		}
		if (StringUtils.isNotBlank(endCreateTime)) {
			map.put("endCreateTime", endCreateTime + " 23:59:59");
		}
		map.put("custom_order_sql", "create_time desc");
		List<Law> dataList = lawService.selectAllList(map);

		model.addAttribute("title", title);
		model.addAttribute("type", type);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		model.addAttribute("dataList", dataList);
		return "law/law_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id, String type) {
		if (StringUtils.isNotBlank(id)) {
			Law law = lawService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", law);
		}
		
		model.addAttribute("type", type);
		model.addAttribute("mode", request.getParameter("mode"));
		return "law/law_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/save")
	public AjaxVO save(HttpServletRequest request, Model model, String id, String title, String content, int lawType) {
		Law law = null;
		AjaxVO vo = new AjaxVO();
		
		try {
			if (StringUtils.isNotBlank(id)) {
				law = lawService.selectOne(Long.parseLong(id));
				law.setTitle(title);
				law.setContent(content);
				lawService.update(law);
				
				getResponse(vo, Contants.SUC_EDIT);
			} else {
				Account currentAccount = (Account) request.getSession().getAttribute(Contants.CURRENT_ACCOUNT);
				law = new Law();
				law.setTitle(title);
				law.setCreateTime(new Date());
				law.setCreator(currentAccount.getId());
				law.setContent(content);
				law.setType(lawType);
				lawService.save(law);
				
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
			int num = lawService.deleteByPrimaryKey(Long.parseLong(id));

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