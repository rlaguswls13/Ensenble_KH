package com.kh.ensemble.common.schedule;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.ensemble.board.model.service.BoardService;

@Component
public class ImageDeleteScheduler {

	@Autowired
	private BoardService serviceB;

	@Autowired
	private ServletContext servletContext;

	@Scheduled(cron = "* */10 * * * *")
	public void deleteImage() {

		String savePathNormalCS = servletContext.getRealPath("/resources/images/board/normalCS");
		String savePathNotice = servletContext.getRealPath("/resources/images/board/notice");
		String savePathFAQ = servletContext.getRealPath("/resources/images/board/FAQ");
		String savePathReview = servletContext.getRealPath("/resources/images/board/review");

		File[] serverFileListNormalCS = new File(savePathNormalCS).listFiles();
		File[] serverFileListNotice = new File(savePathNotice).listFiles();
		File[] serverFileListFAQ  = new File(savePathFAQ).listFiles();
		File[] serverFileListReview = new File(savePathReview).listFiles();
		
		
		Date oneDayAgo = new Date(System.currentTimeMillis() - ( 24 * 60 * 60 * 1000 ));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		String standard = sdf.format(oneDayAgo);

		List<File> list = new ArrayList<File>();		
		boolean flag = true;
		int stopper = 0;
		File[] serverFileList = serverFileListNormalCS;
			do{
				for(File f : serverFileList) {
					String fileName = f.getName();
					fileName.substring(0, 10).compareTo(standard);
					if(fileName.substring(0, 10).compareTo(standard) < 0 ) {	
						list.add(f);
					}			
				}
				
				List<String> dbList = serviceB.selectDBList(standard);
				if( !list.isEmpty() && dbList.isEmpty() ) {
					for(File f : list) {
						if( dbList.indexOf( f.getName() ) < 0  ) {
							System.out.println(f.getName() + " 삭제");
							f.delete(); 
						}
					}
				}
				
				if(stopper == 1) serverFileList = serverFileListNotice;
				else if(stopper == 2) serverFileList = serverFileListFAQ;
				else if(stopper == 3) serverFileList = serverFileListReview;
				else if(stopper == 4) flag = false;
				stopper++;
			}while(flag);
	}
}
