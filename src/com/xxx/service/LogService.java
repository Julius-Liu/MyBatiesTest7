package com.xxx.service;

import org.springframework.transaction.annotation.Transactional;
import com.xxx.pojo.Log;
/**
 * 日志记录业务逻辑接口
 */
public interface LogService {
	
	/**
	 * 日志记录
	 * @param log
	 */
	@Transactional
	public void log(Log log);
	
	/**
	 * 获取登录管理员ID
	 */
	public Long loginUserId();
}
