package com.kh.ensemble.admin.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ensemble.admin.model.dao.AdminDAO;
import com.kh.ensemble.admin.model.vo.Room;
import com.kh.ensemble.admin.model.vo.Sales;
import com.kh.ensemble.admin.model.vo.StudioAttachment;
import com.kh.ensemble.board.model.vo.Pagination;
import com.kh.ensemble.member.model.vo.Member;
import com.kh.ensemble.reservation.model.vo.Option;
import com.kh.ensemble.reservation.model.vo.Rv;
import com.kh.ensemble.board.exception.InsertAttachmentException;
import com.kh.ensemble.board.exception.SaveFileException;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public Member login(Member inputMember) {
		String encPw = bCryptPasswordEncoder.encode(inputMember.getMemberPw());
		
		Member loginMember = dao.login(inputMember.getMemberId());
		
		if(loginMember != null) {
	         if (!bCryptPasswordEncoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
	            loginMember = null;
	         } else {
	            loginMember.setMemberPw(null);
	         }
	         
	      }
		
		return loginMember;
	}

	@Override
	public List<Member> memberList(Pagination pg) {
		return dao.memberList(pg);
	}

	@Override
	public Pagination getMemberPagination() {
		return dao.getMemberListCount();
	}

	@Override
	public Pagination getRoomPagination() {
		return dao.getRoomListCount();
	}

	@Override
	public List<Room> roomList(Pagination pagination) {
		return dao.roomList(pagination);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertRoom(Room room, List<MultipartFile> images, String webPath, String savePath) {
		room.setRoomAbout(replaceParameter(room.getRoomAbout()));
		room.setRoomConfig(replaceParameter(room.getRoomConfig()));
		room.setRoomAbout(room.getRoomAbout().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		
		int roomNo = dao.insertRoom(room);
		
		if (roomNo>0) {
			List<StudioAttachment> atList = new ArrayList<StudioAttachment>();
			
			for(int i=0; i<images.size(); i++) {
				if(!images.get(i).getOriginalFilename().equals("")) {
					
					String fileName = room.getRoomHref()+"_"+rename(images.get(i).getOriginalFilename());
					
					StudioAttachment a = new StudioAttachment();
					a.setFileLevel(i);
					a.setFileName(fileName);
					a.setFilePath(webPath);
					a.setRoomNo(roomNo);
					
					if(i<3) {
						a.setFileType(1);
					}else {
						a.setFileType(2);
					}
					atList.add(a);

				}
			}
			
			if (!atList.isEmpty()) {
				int result = dao.insertAttachment(atList);
				System.out.println("atList.size() : "+atList.size());
				System.out.println("result : "+result);
				
				if(atList.size()==result) {
					// ????????? ????????? ??????(transferTo())
					for(int i=0; i<atList.size(); i++) {
						try {
							images.get(atList.get(i).getFileLevel())
							.transferTo(new File(savePath+"/"+atList.get(i).getFileName()));
							// images ?????? ???????????? ????????? ?????? ????????? ????????? ????????? ????????? ????????? ??????
							
						}catch(Exception e) {
							e.printStackTrace();
							throw new SaveFileException();
							// ????????? ????????? -> @Transactional??? ????????? -> ?????? ??????
						}
					}
				}else {
					throw new SaveFileException();
				}
			}
			
		}
		
		return roomNo;
	}

	@Override
	public int updateRoomStatus(Room room) {
		return dao.updateRoomStatus(room);
	}

	@Override
	public Room selectRoom(int roomNo) {
		Room room = dao.selectRoom(roomNo);
		room.setRoomAbout(room.getRoomAbout().replaceAll("<br>", "\r\n"));
		return room;
	}

	
	@Override
	public int countRooms() {
		return dao.countRooms();
	}

	@Override
	public int updateRoom(Room room, List<MultipartFile> images, String webPath, String savePath) {
		room.setRoomAbout(replaceParameter(room.getRoomAbout()));
		room.setRoomConfig(replaceParameter(room.getRoomConfig()));
		room.setRoomAbout(room.getRoomAbout().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		
		int result = dao.updateRoom(room);
		
		if(result>0) {
			List<StudioAttachment> atList = new ArrayList<StudioAttachment>();
			
			for(int i=0; i<images.size(); i++) {
				if(!images.get(i).getOriginalFilename().equals("")) {
					
					String fileName = room.getRoomHref()+"_"+rename(images.get(i).getOriginalFilename());
					
					StudioAttachment a = new StudioAttachment();
					a.setFileLevel(i);
					a.setFileName(fileName);
					a.setFilePath(webPath);
					a.setRoomNo(room.getRoomNo());
					
					if(i<3) {
						a.setFileType(1);
					}else {
						a.setFileType(2);
					}
					atList.add(a);
				}
			}
			
			for(StudioAttachment a : atList) {
				result = dao.updateStudioAttachment(a);
				if(result==0) {
					result =dao.insertAttachment(a);
					if(result==0) {
						throw new InsertAttachmentException();
					}
				}
			}
			for(int i=0; i<atList.size(); i++) {
				try {
					images.get(atList.get(i).getFileLevel()).transferTo(new File(savePath+"/"+atList.get(i).getFileName()));
				}catch(Exception e) {
					e.printStackTrace();
					throw new SaveFileException();
				}
			}
		}
		
		return result;
	}
	

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteRooms(String rooms) {
		return dao.deleteRooms(rooms);
	}
	
	// ????????? ????????? ???????????? ?????? ?????? ?????????
	public static String replaceParameter(String param) {
	   String result = param;
	   if(param != null) {
	         result = result.replaceAll("&", "&amp;");
	         result = result.replaceAll("<", "&lt;");
	         result = result.replaceAll(">", "&gt;");
	         result = result.replaceAll("\"", "&quot;");
	   }
	      
	   return result;
	}
	
	// ????????? ?????? ?????????
	private String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
			
		int ranNum = (int)(Math.random()*100000); // 5?????? ?????? ?????? ??????
			
		String str = "_" + String.format("%05d", ranNum);
			
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
			
		return date + str + ext;
	}

	//?????? ?????? pagination
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg = dao.getListCount(pg);
		
		System.out.println(selectPg);
		
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Rv> selectReservationList(Pagination pagination) {
	
		
		return dao.selectReservationList(pagination);
	}

	///???????????? ????????? 
	@Override
	public Rv selectReservation(int rvNo) {
		
		
		return dao.selectReservation(rvNo);
	}

	@Override
	public List<Option> adminSelectOption() {
		return dao.adminSelectOption();
	}

	@Override
	public List<Sales> selectSalesList() {
		return dao.selectSalesList();
	}

	@Override
	public List<Integer> getSalesByDay(int roomNo) {
		return dao.getSalesByDay(roomNo);
	}

	@Override
	public List<Rv> selectMainRvList() {
		return dao.selectMainRvList();
	}

	@Override
	public int updateRvStatus(Rv rv) {
		return dao.updateRvStatus(rv);
	}

	@Override
	public int modifyRv(Rv rv) {
		
	int result = dao.modifyRv(rv);
		
		if(result>0) {
			
		 dao.deleteSelectOptionList(rv);
		
		return result;
			
		}else {
			return 0;
		}
		
	}

	@Override
	public int setOptionNo(int optionNo,  int rvNo) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("optionNo", optionNo);
		map.put("rvNo",rvNo);
		
		return dao.setOptionNo(map);
	}

	@Override
	public List<Option> selectedOption(int rvNo) {
		// TODO Auto-generated method stub
		return dao.selectedOption(rvNo);
		
	}

	@Override
	public List<Room> selectRoomList() {
		// TODO Auto-generated method stub
		return dao.selectRoomList();
	}

	@Override
	public Member selectMember(Rv rv) {
		// TODO Auto-generated method stub
		return dao.selectMember(rv);
	}

	

	
	
	
	

}
