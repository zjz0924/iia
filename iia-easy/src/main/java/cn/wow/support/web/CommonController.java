package cn.wow.support.web;

import cn.wow.common.utils.AjaxVO;
import cn.wow.support.utils.Contants;

/**
 * 共享控制器
 * @author zhenjunzhuo
 * 2017-1-5
 */
public class CommonController {
	
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
}
