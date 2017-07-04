package cn.wow.support.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.wow.common.domain.Link;
import cn.wow.common.service.LinkService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;

/**
 * 友情链接控制器
 * 
 * @author zhenjunzhuo 2017-06-21
 */
@Controller
@RequestMapping(value = "linkController")
public class LinkController extends CommonController {

	private static Logger logger = LoggerFactory.getLogger(LinkController.class);

	@Autowired
	private LinkService linkService;

	// 链接图片路径
	@Value("${img.link.url}")
	private String linkPath;

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest httpServletRequest, Model model, String name, String startCreateTime,
			String endCreateTime) {
		Map<String, Object> map = new PageMap(httpServletRequest);
		map.put("custom_order_sql", "sort desc");

		if (StringUtils.isNotBlank(name)) {
			map.put("name", name);
		}
		if (StringUtils.isNotBlank(startCreateTime)) {
			map.put("startCreateTime", startCreateTime + " 00:00:00");
		}
		if (StringUtils.isNotBlank(endCreateTime)) {
			map.put("endCreateTime", endCreateTime + " 23:59:59");
		}

		List<Link> dataList = linkService.selectAllList(map);

		model.addAttribute("name", name);
		model.addAttribute("startCreateTime", startCreateTime);
		model.addAttribute("endCreateTime", endCreateTime);
		model.addAttribute("dataList", dataList);
		model.addAttribute("resUrl", resUrl);
		return "home/link_list";
	}

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model, String id) {
		if (StringUtils.isNotBlank(id)) {
			Link link = linkService.selectOne(Long.parseLong(id));
			model.addAttribute("facadeBean", link);
		}

		model.addAttribute("mode", request.getParameter("mode"));
		model.addAttribute("resUrl", resUrl);
		return "home/link_detail";
	}

	@RequestMapping(value = "/save")
	public String save(HttpServletRequest request, Model model, String id, String name, String url,
			Integer sort, @RequestParam(value = "logo", required = false) MultipartFile multipartFile) {
		String resultCode = "";
		String resultMsg = "";
		Link link = null;

		try {
			if (StringUtils.isNotEmpty(id)) {
				link = linkService.selectOne(Long.parseLong(id));
				
				link.setName(name);
				link.setUrl(url);
				link.setSort(sort);
				
				// 上传照片，获取照片路径 
				String imgName = uploadImg(multipartFile, linkPath);
				if(StringUtils.isNotBlank(imgName)){
					link.setLogo(imgName);
				}
				linkService.update(link);

				resultCode = Contants.EDIT_SUCCESS;
				resultMsg = Contants.EDIT_SUCCESS_MSG;
			} else {
				link = new Link();
				link.setName(name);
				link.setUrl(url);
				link.setSort(sort);
				link.setCreateTime(new Date());
				// 上传照片，获取照片路径 
				String imgName = uploadImg(multipartFile, linkPath);
				if(StringUtils.isNotBlank(imgName)){
					link.setLogo(imgName);
				}
				linkService.save(link);

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
		model.addAttribute("facadeBean", link);
		return "home/link_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/delete")
	public AjaxVO delete(HttpServletRequest request, String id) {
		AjaxVO vo = new AjaxVO();

		if (StringUtils.isNotBlank(id)) {
			int num = linkService.deleteByPrimaryKey(Long.parseLong(id));

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