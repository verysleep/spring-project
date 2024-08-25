package org.zerock.boardreply.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReplyVO {

	private Long rno;
	private Long no;
	private String content;
	private String id;
	private String name; // by. member T
	private Date writeDate;
	
}
