package com.xxx.dao;

import com.xxx.pojo.Admin;

/**
 * 管理员Mapper访问接口
 * @author HotStrong
 *
 */
public interface AdminMapper {
	
	/**
	 * 获取指定帐号名的管理员
	 * @param userName
	 * @return
	 */
	 public Admin findAdminByNickname(String userName);
}
