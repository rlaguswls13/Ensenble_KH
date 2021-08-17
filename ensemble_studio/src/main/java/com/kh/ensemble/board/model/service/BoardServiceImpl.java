package com.kh.ensemble.board.model.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ensemble.board.exception.SaveFileException;
import com.kh.ensemble.board.model.dao.boardDAO;
import com.kh.ensemble.board.model.vo.Attachment;
import com.kh.ensemble.board.model.vo.Board;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.board.model.vo.Search;
import com.kh.ensemble.board.model.vo.Type;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private boardDAO dao;
	
	// 전체 게시글 수 + 게시판 이름 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg;
		selectPg = dao.getListCount(pg);
		
		return new Pagination(pg.getCurrentPage(),selectPg.getListCount(),
							pg.getBoardTypeNo(), selectPg.getBoardName(),
							pg.getBoardCTNo(), pg.getBoardCTNm());
	}
	// 게시판 pagination
	@Override
	public List<Board> selectBoardList(Pagination pagination) {
		return dao.selectBoardList(pagination);		
	}
		
	// 전체 게시글 수 + 게시판 이름 조회(검색)
	@Override
	public Pagination getSearchPagination(Search search, Pagination pg) {
		Pagination selectPg;
		selectPg = dao.getSearchListCount(search);
		return new Pagination(pg.getCurrentPage(),selectPg.getListCount(),
							pg.getBoardTypeNo(), selectPg.getBoardName(),
							pg.getBoardCTNo(), pg.getBoardCTNm());
	}
	// 게시판 pagination(검색)
	@Override
	public List<Board> selectSearchBoardList(Search search, Pagination pagination) {
		return dao.selectSearchBoardList(search, pagination);	
	}
	
	// 게시글 상세조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectBoard(int loginMemberNo, int boardNo) {
		
		Board board = dao.selectBoard(boardNo);
		
		if(board != null) {
			if(board.getMemberNo() != loginMemberNo) {
				dao.increaseReadCount(boardNo);
				board.setBoardReadCount(board.getBoardReadCount() + 1);
			}
		}			
		return board;
	}
	
		
	
	// 특정 게시판 카테고리 조회
	@Override
	public List<Type> selectType(int boardTypeNo) {
		return dao.selectType(boardTypeNo);
	}
	@Override
	public Type selectboardType(int boardTypeNo) {
		return dao.selectboardType(boardTypeNo);
	}
	
	// 파일 서버 저장(1)
	@Override
	public String uploadFile(MultipartFile file, String savePath) {
		
		String fileName = rename(file.getOriginalFilename());
		String realPath = savePath + fileName;
			
			try {
				file.transferTo(new File(realPath));
				return fileName;
			} catch (Exception e) {
				e.printStackTrace();
				throw new SaveFileException();	
			}
	}
	// 파일 서버 저장(2)
	@Override
	public String uploadFile(String url, String savePath) {
		try {
			String fileName = saveImgFromUrl(url, savePath, null);
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			throw new SaveFileException();	
		}
	}
	
	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(Board board) {
		return dao.insertBoard(board);
	}
	// 파일 정보 DB 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertAt(List<Attachment> atList) {
		dao.insertAt(atList);
	}
		

	// 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateBoard(Board board) {
		return dao.updateBoard(board);
	}
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateAt(List<Attachment> atList) {
		dao.deleteAttachment(atList.get(0).getBoardNo());
		dao.insertAt(atList);
	}
	@Override
	public void updateAt(int boardNo) {
		dao.deleteAttachment(boardNo);
	}
	
	// 게시글 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteBoard(int boardNo) {
		
		int result = 0;
		
		Attachment sResult = dao.selectAttachment(boardNo);	
		
		if(sResult != null) {
			result = dao.deleteAttachment(boardNo);
			if(result != 0) result = dao.deleteBoard(boardNo);
		} else result = dao.deleteBoard(boardNo);
		
		return result;
	}
	
	// 게시글 답변	
	@Override
	public int answerCS(int boardNo) {
		return dao.answerCS(boardNo);
	}
	
	// 파일명 변경 메소드
	private String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000);
		
		String str = "_" + String.format("%05d", ranNum);
		String ext = null;
		
		// url이미지 이름 설정
		String regex = "^http[s]?:.*";
		boolean flag = Pattern.matches(regex, originFileName);
		
		if(!flag) {
			ext = originFileName.substring(originFileName.lastIndexOf("."));
			return date + str + ext;
		}else {
			return date + str;
		}
	}
	
	
	// 이미지 URL 파일 저장
	private String saveImgFromUrl(String url, String savePath, String reFileName) throws Exception {
		
		InputStream in = null;
		OutputStream out = null;
		URL reUrl = new URL(url);
		
		try {

			// 헤더에서 파일 확장자 가져오기(content-type)
			URLConnection urlConn = reUrl.openConnection();
			String conType = urlConn.getContentType();
			String conT[] = conType.split("/");
			
			// 파일네임 정하기
			reFileName = rename(url);

			in = urlConn.getInputStream();
			out = new FileOutputStream(savePath + "/" + reFileName + "." + conT[1]);
			
			// 서버 저장
			while (true) {
				int data = in.read();
				if (data == -1) break;
				out.write(data);			
			}
			
			in.close();
			out.close();
			
			String fileName = reFileName + "." + conT[1];
			return fileName;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new SaveFileException();
		} finally {
			if (in != null) in.close();
			if (out != null) out.close();
		}
	}
}
