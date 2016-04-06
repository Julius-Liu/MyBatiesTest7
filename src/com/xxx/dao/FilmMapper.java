package com.xxx.dao;

import java.util.List;
import java.util.Map;

import com.xxx.pojo.Film;

/**
 * 影片Mapper
 * @author HotStrong
 *
 */
public interface FilmMapper {
	
	/**
	 * 
	 * @return
	 */
	public List<Film> getAllFilm();
	
	/**
	 *
	 * @return
	 */
	public Film getFilmById(int id);
	
	/**
	 * 功能：组合查询
	 * @param params
	 * @return
	 */
	public List<Film> getAllFilmOrder(Map<String, Object> params);
	
	/**
	 * 功能：添加影片
	 * @param film
	 */
	public void insertFilm(Film film);
	
	/**
	 * 功能：修改影片
	 * @param film
	 */
	public void updateFilm(Film film);
	
	/**
	 * 功能：删除影片
	 * @param id
	 */
	public void deleteFilm(int id);
	
}
