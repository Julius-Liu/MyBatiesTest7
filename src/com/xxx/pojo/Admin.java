package com.xxx.pojo;

/**
 * 管理员POJO
 * @author HotStrong
 *
 */
public class Admin extends BaseDomain {

	/**
	 * 管理员帐号
	 */
	private String nickname;
	
	/**
	 * 管理员密码
	 */
	private String passwd;
	
	/**
	 * 联系电话
	 */
	private String phoneno;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	
}
