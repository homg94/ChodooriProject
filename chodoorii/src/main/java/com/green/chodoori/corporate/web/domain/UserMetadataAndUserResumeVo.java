package com.green.chodoori.corporate.web.domain;

import java.util.List;

import com.green.chodoori.developer.domain.ResumeDto;
import com.green.chodoori.main.domain.IndividualSginUpMetadataFormVo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserMetadataAndUserResumeVo {

	private ResumeDto resume;
	private IndividualSginUpMetadataFormVo metadata;
	private PageableVo pageable;
	
}
