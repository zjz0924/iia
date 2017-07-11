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

import cn.wow.common.domain.News;
import cn.wow.common.domain.NewsType;
import cn.wow.common.service.NewsService;
import cn.wow.common.service.NewsTypeService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;

/**
 * 新闻类型
 * 
 * @author zhenjunzhuo 2017-07-11
 */
@Controller
@RequestMapping(value = "newsType")
public class NewsTypeController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(NewsTypeController.class);

	@Autowired
	private NewsTypeService newsTypeService;
	@Autowired
	private NewsService newsService;

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest httpServletRequest, Model model, String name, String startCreateTime,
			String endCreateTime, String isShow) {
		Map<String, Object> map = new PageMap(httpServletRequest);
		map.put("custom_order_sql", "create_time desc");

		if (StringUtils.isNotBlank(name)) {
			map.put("name", name);
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
		
		List<NewsType> dataList = newsTypeService.selectAllList(map);

		model.addAttribute("dataList", dataList);
		model.addAttribute("name", name);
		model.addAttribute("isShow", isShow);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		return "news/newstype_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id) {
		if (StringUtils.isNotBlank(id)) {
			NewsType newsType = newsTypeService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", newsType);
		}

		model.addAttribute("mode", request.getParameter("mode"));
		return "news/newstype_detail";
	}

	@RequestMapping(value = "/save")
	public String save(HttpServletRequest request, Model model, String id, String name, String isShow) {
		String resultCode = "";
		String resultMsg = "";
		NewsType newsType = null;

		try {
			if (StringUtils.isNotBlank(id)) {
				newsType = newsTypeService.selectOne(Long.parseLong(id));
				newsType.setName(name);
				newsType.setIsShow(isShow);
				newsTypeService.update(newsType);

				resultCode = Contants.EDIT_SUCCESS;
				resultMsg = Contants.EDIT_SUCCESS_MSG;
			} else {
				newsType = new NewsType();
				newsType.setName(name);
				newsType.setCreateTime(new Date());
				newsType.setIsShow(isShow);
				newsTypeService.save(newsType);

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
		model.addAttribute("facadeBean", newsType);
		return "news/newstype_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/delete")
	public AjaxVO delete(HttpServletRequest request, String id) {
		AjaxVO vo = new AjaxVO();

		if (StringUtils.isNotBlank(id)) {
			Map<String, Object> map = new PageMap(false);
			map.put("type", id);
			
			List<News> newsList = newsService.selectAllList(map);
			if(newsList != null && newsList.size() > 0){
				vo.setSuccess(false);
				vo.setMsg("无法删除该类型，该类型已被使用");
				return vo;
			}
			int num = newsTypeService.deleteByPrimaryKey(Long.parseLong(id));

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
				NewsType type = newsTypeService.selectOne(Long.parseLong(id));

				if (type != null) {
					type.setIsShow(lock);
					newsTypeService.update(type);

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