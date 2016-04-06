package com.xxx.pojo;

/**
 * 影片POJO
 * @author HotStrong
 *
 */
public class Film extends BaseDomain {
	
	// Fields
	private String fname;
	
	// Constructors
	/** default constructor */
	public Film() {
	}
	
	// Property accessors
	public String getFname() {
		return this.fname;
	}
	
	public void setFname(String fname) {
		this.fname = fname;
	}

}