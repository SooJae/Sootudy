package com.soo.sootudy.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@AllArgsConstructor
public class StudyPageDTO {
 
	private int total;
	private List<StudyVO> list;
	
}
