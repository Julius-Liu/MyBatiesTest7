package com.xxx.web.struts.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xxx.pojo.Film;
import com.xxx.service.FilmService;

@SuppressWarnings("serial")
public class FilmAction extends ActionSupport implements ModelDriven<Film> {

	//业务逻辑对象
	@Autowired
	private FilmService filmService;
	
	//封装查询结果
	private List<Film> filmList;
	
	//封装页面提交的表单数据
	private Film film = new Film();
	
	/**
	 * 获取所有的电影
	 * @return
	 * @throws Exception
	 */
	public String findFilm() throws Exception {
		
		this.filmList = this.filmService.getAllFilm();
		this.outputJson(this.filmList);
		
		return null;
	}
	
	/**
	 * 根据影片ID获取影片信息
	 * @return
	 * @throws Exception
	 */
	public String detailFilm() throws Exception {
		int id = film.getId().intValue();
		Film film = this.filmService.getFilmById(id);
		this.film.setFname(film.getFname());
		return SUCCESS;
	}
	
	/**
	 * 添加影片
	 * @return
	 * @throws Exception
	 */
	public String insertFilm() {
		
		String result = "发布影片成功！";
		try {
			
			this.filmService.insertFilm(film);
			
		} catch (Exception e) {
			
			result = "发布影片失败！";
			
		}
		
		this.outputJson(result);
		
		return null;
	}
	
	/**
	 * 修改影片
	 * @return
	 * @throws Exception
	 */
	public String updateFilm() {
		
		String result = "修改影片成功！";
		try {
			
			this.filmService.updateFilm(film);
			
		} catch (Exception e) {
			
			result = "修改影片失败！";
			
		}
		
		this.outputJson(result);
		
		return null;
	}
	
	/**
	 * 删除影片
	 * @return
	 * @throws Exception
	 */
	public String deleteFilm() {
		
		String result = "删除影片成功！";
		try {
			
			
			int id = film.getId().intValue();
			this.filmService.deleteFilm(id);
			
		}catch (Exception e) {
			
			result = "删除影片失败！";
		}
		
		this.outputJson(result);
		
		return null;
	}
	
	/**
	 * 输出JSON信息
	 * @param jsonObj
	 */
	private void outputJson(Object jsonObj){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		
		try {
			
			PrintWriter pw = response.getWriter();
			//将Java对象转换为JSON字符串
			String gsonStr = new Gson().toJson(jsonObj);
			//输出JSON字符串
			pw.print(gsonStr);
			
			pw.flush();
			pw.close();
			
		} catch (IOException e) {
			System.out.println("输出GSON出错：" + e);
		}
	}
	
	public Film getModel() {
		return film;
	}

	public List<Film> getFilmList() {
		return filmList;
	}

	public void setFilmList(List<Film> filmList) {
		this.filmList = filmList;
	}

}
