package cn.wow.support.web;

import java.util.Map;
import java.util.List;
import  java.lang.Long;
import  java.lang.String;
import  java.lang.Integer;
import  java.util.Date;
import javax.servlet.http.HttpServletRequest;
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
import org.apache.commons.lang3.StringUtils;
import cn.wow.common.utils.AjaxVO;
import cn.wow.common.utils.pagination.PageMap;
import cn.wow.support.utils.Contants;
import cn.wow.common.domain.ScrollPic;
import cn.wow.common.service.ScrollPicService;

/**
 * 滚动大圈控制器
 * 
 * @author zhenjunzhuo 
 * 2017-06-26
 */
@Controller
@RequestMapping(value = "scrollPicController")
public class ScrollPicController extends CommonController{

    private static Logger logger = LoggerFactory.getLogger(ScrollPicController.class);

    @Autowired
    private ScrollPicService scrollPicService;
    
    // 滚动图片路径
 	@Value("${img.scollPic.url}")
 	private String scollPicPath;
    

    @RequestMapping(value = "/list")
    public String list(HttpServletRequest httpServletRequest, Model model, String startCreateTime, String endCreateTime) {
        Map<String, Object> map = new PageMap(httpServletRequest);
        map.put("custom_order_sql", "sort desc");

        if (StringUtils.isNotBlank(startCreateTime)) {
			map.put("startCreateTime", startCreateTime + " 00:00:00");
		}
		if (StringUtils.isNotBlank(endCreateTime)) {
			map.put("endCreateTime", endCreateTime + " 23:59:59");
		}
        List<ScrollPic> dataList = scrollPicService.selectAllList(map);

        model.addAttribute("dataList", dataList);
        model.addAttribute("resUrl", resUrl);
        return "home/scrollpic_list";
    }

    @RequestMapping(value = "/detail")
    public String detail(HttpServletRequest request, Model model, String id){
        if(StringUtils.isNotBlank(id)){
            ScrollPic scrollPic = scrollPicService.selectOne(Long.parseLong(id));
            model.addAttribute("facadeBean", scrollPic);
        }

        model.addAttribute("mode", request.getParameter("mode"));
        model.addAttribute("resUrl", resUrl);
        return "home/scrollpic_detail";
    }

    @RequestMapping(value = "/save")
    public String save(HttpServletRequest request, Model model, String id, String content, @RequestParam(value = "url", required = false) MultipartFile multipartFile, Integer sort){
        String resultCode = "";
        String resultMsg = "";
        ScrollPic scrollPic = null;

        try{
            if(StringUtils.isNotBlank(id)){
                scrollPic = scrollPicService.selectOne(Long.parseLong(id));
                scrollPic.setContent(content);
                // 上传照片，获取照片路径 
				String imgName = uploadImg(multipartFile, scollPicPath);
				if(StringUtils.isNotBlank(imgName)){
					scrollPic.setUrl(imgName);
				}
                scrollPic.setSort(sort);
                scrollPicService.update(scrollPic);

                resultCode = Contants.EDIT_SUCCESS;
                resultMsg = Contants.EDIT_SUCCESS_MSG;
            }else{
                scrollPic = new ScrollPic();
                scrollPic.setContent(content);
                // 上传照片，获取照片路径 
				String imgName = uploadImg(multipartFile, scollPicPath);
				if(StringUtils.isNotBlank(imgName)){
					scrollPic.setUrl(imgName);
				}
                scrollPic.setSort(sort);
                scrollPic.setCreateTime(new Date());
                scrollPicService.save(scrollPic);

                resultCode = Contants.SAVE_SUCCESS;
                resultMsg = Contants.SAVE_SUCCESS_MSG;
            }
        }catch(Exception ex){
            ex.printStackTrace();
            resultCode = Contants.EXCEPTION;
            resultMsg = Contants.EXCEPTION_MSG;
        }

        model.addAttribute("resultCode",  resultCode);
        model.addAttribute("resultMsg", resultMsg);
        model.addAttribute("facadeBean", scrollPic);
        return "home/scrollpic_detail";
    }

    @ResponseBody
    @RequestMapping(value = "/delete")
    public AjaxVO delete(HttpServletRequest request, String id){
        AjaxVO vo = new AjaxVO();

        if(StringUtils.isNotBlank(id)){
            int num = scrollPicService.deleteByPrimaryKey(Long.parseLong(id));

            if(num > 0){
            	getResponse(vo, Contants.SUC_DELETE);
            }else{
            	getResponse(vo, Contants.FAIL_DELETE);
            }
        }else{
        	getResponse(vo, Contants.FAIL_DELETE);
        }

        return vo;
    }
}