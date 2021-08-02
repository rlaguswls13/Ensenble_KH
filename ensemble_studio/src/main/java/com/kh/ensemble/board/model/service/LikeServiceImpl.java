package com.kh.ensemble.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ensemble.board.model.dao.LikeDAO;

@Service
public class LikeServiceImpl implements LikeService {
	@Autowired
	private LikeDAO dao;
}
