package com.dota2.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dota2.dao.MesMapper;
import com.dota2.dao.SkillMapper;
import com.dota2.pojo.Comment;
import com.dota2.pojo.Skill;
@Service
public class MesServiceImpl implements MesService{
	@Autowired
	private MesMapper mesMapper;
	public List<Comment> findAll() {
		return mesMapper.findAll();
	}
	public void delete(Integer id,Date date) {
		mesMapper.delete(id,date);
	}
	public void recover(Integer id, Date date) {
		mesMapper.recover(id,date);
	}
	public void deleteAll(Integer[] ids,Date date) {
		mesMapper.deleteAll(ids,date);
	}
	//恢复多个
	public void recoverAll(Integer[] ids, Date date) {
		mesMapper.recoverAll(ids,date);
	}
	//查询
	public List<Comment> search(String condition) {
		return mesMapper.search(condition);
	}

	
}
