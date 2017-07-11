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
import cn.wow.common.domain.News;
import cn.wow.common.domain.NewsType;
import cn.wow.common.service.NewsService;
import cn.wow.common.service.NewsTypeService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;

/**
 * 新闻
 * @author zhenjunzhuo 
 * 2017-07-06
 */
@Controller
@RequestMapping(value = "news")
public class NewsController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(NewsController.class);

	@Autowired
	private NewsService newsService;
	@Autowired
	private NewsTypeService newsTypeService;

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
		List<News> dataList = newsService.selectAllList(map);
		
		// 新闻类型
		Map<String, Object> typeMap = new PageMap(false);
		typeMap.put("custom_order_sql", "name asc");
		List<NewsType> typeList = newsTypeService.selectAllList(typeMap);
		
		model.addAttribute("title", title);
		model.addAttribute("type", type);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		model.addAttribute("dataList", dataList);
		model.addAttribute("typeList", typeList);
		return "news/news_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id) {
		if (StringUtils.isNotBlank(id)) {
			News news = newsService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", news);
		}

		// 新闻类型
		Map<String, Object> typeMap = new PageMap(false);
		typeMap.put("custom_order_sql", "name asc");
		List<NewsType> typeList = newsTypeService.selectAllList(typeMap);
		
		model.addAttribute("typeList", typeList);
		model.addAttribute("mode", request.getParameter("mode"));
		return "news/news_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/save")
	public AjaxVO save(HttpServletRequest request, Model model, String id, String title, String content, Long type) {
		News news = null;
		AjaxVO vo = new AjaxVO();
		
		try {
			if (StringUtils.isNotBlank(id)) {
				news = newsService.selectOne(Long.parseLong(id));
				news.setTitle(title);
				news.setContent(content);
				news.setType(type);
				newsService.update(news);
				
				getResponse(vo, Contants.SUC_EDIT);
			} else {
				Account currentAccount = (Account) request.getSession().getAttribute(Contants.CURRENT_ACCOUNT);
				news = new News();
				news.setTitle(title);
				news.setCreateTime(new Date());
				news.setCreator(currentAccount.getId());
				news.setContent(content);
				news.setType(type);
				newsService.save(news);
				
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
			int num = newsService.deleteByPrimaryKey(Long.parseLong(id));

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