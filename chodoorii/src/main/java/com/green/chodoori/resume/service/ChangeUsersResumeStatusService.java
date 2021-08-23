package com.green.chodoori.resume.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.chodoori.main.domain.UserInfoDto;
import com.green.chodoori.main.repository.MainRepository;
import com.green.chodoori.main.web.domain.SessionUserInfo;
import com.green.chodoori.resume.domain.ResumeDto;
import com.green.chodoori.resume.repository.ResumeRepository;

@Service
public class ChangeUsersResumeStatusService {

	
	@Autowired
	MainRepository mainRepo;
	
	@Autowired
	ResumeRepository resumeRepo;
	
	public void changeStatus(Integer check, HttpSession session) {
		SessionUserInfo sessionUser = (SessionUserInfo) session.getAttribute("userInfo");
		UserInfoDto user = mainRepo.findById(sessionUser.getId()).get();
		ResumeDto resume = null;
		
		user.setCheck_detail(check);

		
		if(check ==0) {
			 resume = (ResumeDto) session.getAttribute("temp");
				resume.setUser(user);
				resumeRepo.saveResumeDto(resume);
				session.removeAttribute("temp"); // 위 form 메소드에서 임시로 저장한 resume 지우기.

		}
		
		else if(check ==1) {
			 resume = resumeRepo.findByIdForResume(sessionUser.getId()).get();
			 resumeRepo.deleteResumeDto(resume);
				
		}
		
				
		sessionUser.setCheck(check);
		session.setAttribute("userInfo", sessionUser);
	}
	
	
	
}
