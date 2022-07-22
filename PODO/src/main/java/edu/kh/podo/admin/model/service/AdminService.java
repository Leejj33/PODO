package edu.kh.podo.admin.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.podo.member.model.vo.Member;

public interface AdminService {


	Map<String, Object> inquiryList(int cp, int boardCode);

	int insertBoard(Map<String, Object> paramMap);

	Map<String, Object> searchBoardList(Map<String, Object> paramMap);

	int adminDelete(String deleteValue);

}
