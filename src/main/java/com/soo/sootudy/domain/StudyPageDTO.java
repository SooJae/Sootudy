package com.soo.sootudy.domain;

import java.util.List;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@ToString
@Slf4j
public class StudyPageDTO {
 
	private List<StudyVO> list;
	
}
