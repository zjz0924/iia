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
import cn.wow.common.domain.Train;
import cn.wow.common.service.TrainService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;

/**
 * 教育培训
 * @author zhenjunzhuo 
 * 2017-07-11
 */
@Controller
@RequestMapping(value = "train")
public class TrainController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(TrainController.class);

	@Autowired
	private TrainService trainService;

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
		List<Train> dataList = trainService.selectAllList(map);

		model.addAttribute("title", title);
		model.addAttribute("type", type);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		model.addAttribute("dataList", dataList);
		return "train/train_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id, String type) {
		if (StringUtils.isNotBlank(id)) {
			Train train = trainService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", train);
		}
		
		model.addAttribute("type", type);
		model.addAttribute("mode", request.getParameter("mode"));
		return "train/train_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/save")
	public AjaxVO save(HttpServletRequest request, Model model, String id, String title, String content, int lawType) {
		Train train = null;
		AjaxVO vo = new AjaxVO();
		
		try {
			if (StringUtils.isNotBlank(id)) {
				train = trainService.selectOne(Long.parseLong(id));
				train.setTitle(title);
				train.setContent(content);
				trainService.update(train);
				
				getResponse(vo, Contants.SUC_EDIT);
			} else {
				Account currentAccount = (Account) request.getSession().getAttribute(Contants.CURRENT_ACCOUNT);
				train = new Train();
				train.setTitle(title);
				train.setCreateTime(new Date());
				train.setCreator(currentAccount.getId());
				train.setContent(content);
				train.setType(lawType);
				trainService.save(train);
				
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
			int num = trainService.deleteByPrimaryKey(Long.parseLong(id));

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