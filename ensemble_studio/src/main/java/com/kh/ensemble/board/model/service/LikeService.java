package com.kh.ensemble.board.model.service;

import com.kh.ensemble.board.model.vo.Like;

public interface LikeService {

	Like selectLike(Like like);
	
	int addLike(Like like);
	
	int deleteLike(Like like);

	int deleteSecessionLike(Integer secessionMemberNo);
	

}
