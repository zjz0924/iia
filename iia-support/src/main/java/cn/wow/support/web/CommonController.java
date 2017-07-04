package cn.wow.support.web;

import java.io.File;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import cn.wow.common.utils.AjaxVO;
import cn.wow.support.utils.Contants;

/**
 * 共享控制器
 * @author zhenjunzhuo
 * 2017-1-5
 */
public class CommonController {
	
	// 照片上传根路径
	@Value("${img.root.url}")
	private String rootPath;
	
	//照片资源路径
  	@Value("${res.url.root}")
  	protected String resUrl;
  	
	
	/**
	 * 返回响应结果
	 * @param vo    返回对象
	 * @param msg   提示信息
	 * @param flag  结果
	 */
	public void getResponse(AjaxVO vo, int type){
		String information = null; 
		boolean flag = true;
		
		switch(type){
			case 1:   //添加成功
				information = Contants.SAVE_SUCCESS_MSG;
				flag = true;
				break;
			case 2:   //添加失败
				information = Contants.SAVE_FAIL_MSG;
				flag = false;
				break;
			case 3:   //修改成功
				information = Contants.EDIT_SUCCESS_MSG;
				flag = true;
				break;
			case 4:   //修改失败	
				information = Contants.EDIT_FAIL_MSG;
				flag = false;
				break;
			case 5:   //删除成功
				information = Contants.DELETE_SUCCESS_MSG;
				flag = true;
				break;
			case 6:   //删除失败	
				information = Contants.DELETE_FAIL_MSG;
				flag = false;
				break;
			case 7:   //异常
				information = Contants.EXCEPTION_MSG;
				flag = false;
				break;
		}
		
		vo.setSuccess(flag);
		vo.setMsg(information);
	}
	
	
	/**
	 * 返回响应结果
	 * @param vo    返回对象
	 * @param msg   提示信息
	 * @param flag  结果
	 */
	public void getResponse(AjaxVO vo, boolean flag, String msg){
		vo.setSuccess(flag);
		vo.setMsg(msg);
	}
	
	
	public String uploadImg(MultipartFile multipartFile, String path) throws Exception{
		if(multipartFile != null && multipartFile.getSize() > 0){
			// 原始文件名
			String sourceName = multipartFile.getOriginalFilename();
			String newName = System.currentTimeMillis() + sourceName.substring(sourceName.indexOf("."));
			// 文件上传路径
			String uploadPath = rootPath + "/" + path ;
			
			File uploadPathFile = new File(uploadPath);
			if(!uploadPathFile.exists()){
				uploadPathFile.mkdirs();
			}
			
			File srcFile = new File(uploadPath + newName);
			multipartFile.transferTo(srcFile);
			
			return path + newName;
		}
		
		return null;
	}
}
