package com.xxx.service;

import com.xxx.pojo.Admin;

/**
 * 管理员信息业务逻辑接口
 * @author HotStrong
 *
 */
public interface AdminService {
	
	/**
	 * 获取指定指定帐号名的管理员
	 * @param userName
	 * @return
	 */
	 public Admin findAdminByNickname(String userName);
}
