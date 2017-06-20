package cn.wow.common.domain;

import java.util.Date;

/**
 * 用户
 * 
 * @author zhenjunzhuo 2016-07-26
 */
public class Account {
	private Long id;
	// 用户名
	private String userName;
	// 昵称
	private String nickName;
	// 登录密码
	private String password;
	// 手机号码
	private String mobile;
	// 创建时间
	private Date createTime;
	// 是否被封号：Y-是，N-否
	private String lock = "N";

	public String getLock() {
		return lock;
	}

	public void setLock(String lock) {
		this.lock = lock;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile == null ? null : mobile.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}