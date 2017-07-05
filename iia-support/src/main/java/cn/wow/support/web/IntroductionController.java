package cn.wow.support.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wow.common.domain.Introduction;
import cn.wow.common.service.IntroductionService;
import cn.wow.common.utils.AjaxVO;
import cn.wow.support.utils.Contants;

/**
 * 简介控制器
 * 
 * @author zhenjunzhuo 2017-07-05
 */
@Controller
@RequestMapping(value = "introduction")
public class IntroductionController extends CommonController {

	Logger logger = LoggerFactory.getLogger(IntroductionController.class);

	@Autowired
	private IntroductionService introductionService;

	private final Long INTRO_ID = 1l;

	@RequestMapping(value = "/detail")
	public String detail(HttpServletRequest request, Model model) {

		Introduction introduction = introductionService.selectOne(INTRO_ID);

		model.addAttribute("facadeBean", introduction);
		return "association/intro_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/update")
	public AjaxVO update(HttpServletRequest request, Model model, String content) {
		AjaxVO vo = new AjaxVO();
		
		try{
			Introduction introduction = introductionService.selectOne(INTRO_ID);
			introduction.setContent(content);
			introductionService.update(introduction);
			
			getResponse(vo, Contants.SUC_EDIT);
		}catch(Exception ex){
			ex.printStackTrace();
			getResponse(vo, Contants.FAIL_EDIT);
		}
		return vo;
	}

}
