package com.xxx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.xxx.dao.LogMapper;
import com.xxx.pojo.Admin;
import com.xxx.pojo.Log;

/**
 * 日志记录业务逻辑接口实现类
 * @author HotStrong
 */
public class LogServiceImpl implements LogService{
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private LogMapper logMapper;
	
	public void log(Log log) {
		logMapper.insert(log);
	}
	
	/**
	 * 获取登录管理员ID
	 * 
	 * @return
	 */
	public Long loginUserId() {

		if(SecurityContextHolder.getContext() == null){
			return null;
		}
		
		if(SecurityContextHolder.getContext().getAuthentication() == null){
			return null;
		}
		
		UserDetails userDetails = (UserDetails) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal();
		
		if(userDetails == null){
			return null;
		}
		
		//获取登录管理员帐号名
		String userName = userDetails.getUsername();
		
		if(userName == null || userName.equals("")){
			return null;
		}
		
		// 根据管理员帐号名获取帐号ID
		Admin admin = this.adminService.findAdminByNickname(userName);
		
		if(admin == null){
			return null;
		}
		
		return admin.getId();
	}
	
}
