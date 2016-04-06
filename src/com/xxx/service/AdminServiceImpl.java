package com.xxx.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.xxx.dao.AdminMapper;
import com.xxx.pojo.Admin;

public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	public Admin findAdminByNickname(String userName) {
		return adminMapper.findAdminByNickname(userName);
	}

}
