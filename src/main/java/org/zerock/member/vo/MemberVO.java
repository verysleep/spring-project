package org.zerock.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String photo;
	private Date birth;
	private String tel;
	private String email;
	private Date regDate; // 회원 가입일
	private Date conDate; // 최근 접속일
	private String status;
	private Long newMsgCnt;
	private Integer gradeNo;
	private String gradeName; // grade
	
}
