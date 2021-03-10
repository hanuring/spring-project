package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service	
public class upload {
	
	public boolean fileUpload(MultipartHttpServletRequest mRequest) {
		
		boolean isUpload = false;
		
		String uploadPath = "C:/NCS/workspace(spring)/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/";		// 업로드 경로
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			String originalFileName = mFile.getOriginalFilename();
			String homedir = uploadPath;
			
			File path1 = new File(homedir);
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			String savaFileName = originalFileName;
			
			if(savaFileName != null && !savaFileName.equals("")) {
				
				try {
					mFile.transferTo(new File(homedir+"/"+savaFileName));
					isUpload = true;
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}	// while문 end
		
		return isUpload;
	}	// fileUpload() 메서드 end

	// 지원님 추가
	public boolean noticeFileUpload(MultipartHttpServletRequest mRequest) {
		
		boolean isUpload = false;
		
		String uploadPath = "C:\\NCS\\workspace(spring)\\00_Spring_Project_210215\\src\\main\\webapp\\resources\\notice_file";// 업로드 경로
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			String originalFileName = mFile.getOriginalFilename();
			String homedir = uploadPath;
			
			File path1 = new File(homedir);
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			String savaFileName = originalFileName;
			
			if(savaFileName != null && !savaFileName.equals("")){
				
				try {
					mFile.transferTo(new File(homedir+"/"+savaFileName));
					isUpload = true;
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}	// while문 end
		
		return isUpload;
	}	// fileUpload() 메서드 end
	
	
}

