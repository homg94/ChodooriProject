package com.green.chodoori.developer.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.chodoori.developer.domain.ResumeDto;
import com.green.chodoori.developer.domain.SharedMyResumeInfoDto;
import com.green.chodoori.developer.domain.SharedMyResumeInfoDtoRepo;
import com.green.chodoori.developer.repository.ResumeRepository;
import com.green.chodoori.developer.service.ChangeUsersResumeStatusService;
import com.green.chodoori.developer.service.ResumeDtoCreator;
import com.green.chodoori.error.ResumeNotFoundError;
import com.green.chodoori.main.domain.AlramDto;
import com.green.chodoori.main.domain.AlramDtoRepo;
import com.green.chodoori.main.domain.UserInfoDto;
import com.green.chodoori.main.repository.MainRepository;
import com.green.chodoori.main.service.ExtractSessionInfoService;
import com.green.chodoori.main.web.domain.SessionUserInfo;
import com.green.chodoori.util.mail.MailServiceInterface;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/resume")
public class ResumeController {

	@Autowired
	ResumeDtoCreator resumeCreator;
	
	@Autowired
	ExtractSessionInfoService sessionExtractor;

	@Autowired
	MainRepository mainRepo;
	
	@Autowired
	ResumeRepository resumeRepo;
	
	@Autowired
	AlramDtoRepo alramRepo;

	@Autowired
	SharedMyResumeInfoDtoRepo smRepo; // ?????? ??????????????? ????????? ??????

	@Autowired
	MailServiceInterface mail;

	@Autowired
	ChangeUsersResumeStatusService userStatusService;

	@GetMapping("/display")
	public String displayMyResume(HttpSession session, Model model) {

		SessionUserInfo sessionInfo = sessionExtractor.extractSessionUserInfo(session);
		UserInfoDto user = sessionExtractor.extractUserInfoDtoFromSessionInfo(session);
		Optional<ResumeDto> resume = resumeRepo.findByIdForResume(sessionInfo.getId());

		System.out.println(user.getName());
		
		if (resume.isPresent()) {

			String templateNumber = resume.get().getTemplate_kind();
			String template = "/resume/template/templateSample" + templateNumber;

			log.info("????????? ?????? : {}", template);

			model.addAttribute("user",user);
			model.addAttribute("resume", resume.get());

			return template;

		} else {
			throw new ResumeNotFoundError("???????????? ???????????? ????????????");
		}

	}

	@GetMapping("/remove")
	@Transactional
	public String removeMyResume(HttpSession session) {

		SessionUserInfo sessionInfo = sessionExtractor.extractSessionUserInfo(session);

		Optional<ResumeDto> resume = resumeRepo.findByIdForResume(sessionInfo.getId());

		resumeRepo.deleteResumeDto(resume.get());

		mainRepo.findById(sessionInfo.getId()).get().setCheck_detail(1);

		sessionInfo.setCheck(1);

		session.setAttribute("userInfo", sessionInfo);

		return "redirect:/resume/";
	}

	@GetMapping("/edit")
	@Transactional
	public String editMyResume(HttpSession session) {

		
		return "/resume/edit/resumeEditChoice";

	}
	
	@GetMapping("/edit/form")
	public String templateFormPage(@RequestParam("template")String template,Model model, HttpSession session) {
		SessionUserInfo user = sessionExtractor.extractSessionUserInfo(session);
		ResumeDto dto = resumeRepo.findByIdForResume(user.getId()).get();
		
		model.addAttribute("template",template);
		model.addAttribute("resume",dto);
		
		return "/resume/edit/resumeEditForm";
	}
	
	
	@PostMapping("/edit/form")
	public String templageFormInputCheck(HttpSession session,
										@RequestParam(required = false) String template_kind, 
										@RequestParam(required = false) String introduction_header,
										@RequestParam(required = false) String introduction_main,
										@RequestParam(required = false) MultipartFile introduction_img_path,
										@RequestParam(required = false) String[] skil_set,									
										@RequestParam(required = false) String blog_address,
										@RequestParam(required = false) String github_address,
										@RequestParam(required = false) String instagram_address,
										@RequestParam(required = false) String facebook_address,
										@RequestParam(required = false, defaultValue = "off") String disclosure,
										@RequestParam(required = false) MultipartFile portfolio_first_img,
										@RequestParam(required = false) String portfolio_first_name,
										@RequestParam(required = false) String portfolio_first_github,
										@RequestParam(required = false) String portfolio_first_desc,
										@RequestParam(required = false) MultipartFile portfolio_second_img,
										@RequestParam(required = false) String portfolio_second_name,
										@RequestParam(required = false) String portfolio_second_github,
										@RequestParam(required = false) String portfolio_second_desc,
										@RequestParam(required = false) MultipartFile portfolio_third_img,
										@RequestParam(required = false) String portfolio_third_name,
										@RequestParam(required = false) String portfolio_third_github,
										@RequestParam(required = false) String portfolio_third_desc,
										Model model) throws IllegalStateException, IOException {
		
		
	

		ResumeDto resume = resumeCreator.resumeDtoCreator(template_kind, introduction_header, introduction_main, 
														introduction_img_path, skil_set, blog_address, 
														github_address, instagram_address, facebook_address, 
														disclosure, portfolio_first_img, portfolio_first_name, 
														portfolio_first_github, portfolio_first_desc, portfolio_second_img, 
														portfolio_second_name, portfolio_second_github, portfolio_second_desc, 
														portfolio_third_img, portfolio_third_name, portfolio_third_github, 
														portfolio_third_desc);
										
		resume.getSkill_dto().makeSkillSetList();
		
		
		
		SessionUserInfo sessionUser = (SessionUserInfo) session.getAttribute("userInfo");
		UserInfoDto user = mainRepo.getById(sessionUser.getId());
		

		session.setAttribute("temp", resume);
		
	
		model.addAttribute("resume",resume);
		model.addAttribute("preview","on");
		model.addAttribute("user",user);
		
		String templateName = "/resume/edit/template/templateSample"+template_kind;
				
		return templateName;
	}
	
	@GetMapping("/edit/form/confirm")
	public String confirmResume(HttpSession session,RedirectAttributes rttr) {
		rttr.addFlashAttribute("director", "edit");
		userStatusService.changeStatus(1, session);
		
		userStatusService.changeStatus(0, session);
	
		return "redirect:/resume";
	}
	
	


	// ?????? ?????? ????????? ?????? ????????? ??????

	@GetMapping("/share")
	public String shareForm() {
		log.info("?????? ????????? ??????");
		return "/resume/resumeShare";
	}

	@PostMapping("/share/mail")
	public String shareMyResumeByEmail(HttpServletRequest req,@RequestParam("to") String to, @RequestParam("what") String what,
			HttpSession session, RedirectAttributes rttr) throws UnsupportedEncodingException, MessagingException {

		
		SessionUserInfo sessionInfo = sessionExtractor.extractSessionUserInfo(session);

		String towhom = req.getParameter("toUser");
		String fromwhom = req.getParameter("fromUser");
		AlramDto alram = new AlramDto();
		
		SharedMyResumeInfoDto myInfo = new SharedMyResumeInfoDto();

		alram.setFromwhom(fromwhom);
		alram.setTowhom(towhom);
		alram.setRegisterDate(new Date());
		alram.setMessage(fromwhom+"?????? ???????????? ???????????????.");
		
		myInfo.setRegisterDate(new Date());
		myInfo.setUserInfoDto(mainRepo.getById(sessionInfo.getId()));
		mail.sendMailForSharingMyResume(to, what, sessionInfo.getId());

		rttr.addFlashAttribute("director", "share");
		
		alramRepo.save(alram);
		smRepo.save(myInfo);
		return "redirect:/resume";


	}

	@GetMapping("/share/mail/{userId}")
	public String displayMyResumeByEmail(@PathVariable String userId, Model model) {

		System.out.println("??????????????? ???");
		
		ResumeDto myInfo = resumeRepo.findByIdForResume(userId).get();
		UserInfoDto user = mainRepo.findById(userId).get();
		String templateKind = "/resume/template/templateSample" + myInfo.getTemplate_kind();
		
		model.addAttribute("user",user);
		model.addAttribute("resume", myInfo);

		return templateKind;
	}

	@Scheduled(cron = "0 0 * * * ?")//1???????????? ??????
	public void delete() {
		List<SharedMyResumeInfoDto> smdto = smRepo.findAll();
		// ?????? id????????? ??????
		Calendar calender = Calendar.getInstance(); // ????????? ?????? ??????
		long todayMil = calender.getTimeInMillis(); // ????????????
		long oneday = 24 * 60 * 60 * 1000; // ?????? ??????
		Calendar idcal = Calendar.getInstance();

		for(int i=0;i<smdto.size();i++) {
			SharedMyResumeInfoDto dto = smdto.get(i);
			Date registerdate = dto.getRegisterDate(); 
			
			idcal.setTime(registerdate);
			
			long timediff = todayMil - idcal.getTimeInMillis();// ?????????????????? regidate??? ??? ??????
			int daydiff = (int) (timediff / oneday);
			if(daydiff > 1) {
				smRepo.delete(dto);
				log.info("{},?????????????????? ????????? ???????????? ?????? ???????????????.",dto.getUserInfoDto());
			}
		}
	}
}
