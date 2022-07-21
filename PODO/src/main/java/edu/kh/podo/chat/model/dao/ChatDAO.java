package edu.kh.podo.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatRoom;
import edu.kh.podo.member.model.vo.Member;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 채팅방 목록 조회 DAO
	 * @param memberNo
	 * @return chatRoomList
	 */
	public List<ChatList> selectChatRoomList(int memberNo) {
		return sqlSession.selectList("chatMapper.selectChatRoomList", memberNo);
	}

	/** 상대방 채팅 정보 조회 DAO
	 * @param map
	 * @return otherDetail
	 */
	public List<ChatList> selectOtherDetail(Map<String, Object> map) {
		return sqlSession.selectList("chatMapper.selectOtherDetail", map);
	}

	/** 내 채팅 정보 조회 (대화 내용 / 시간만) DAO
	 * @param map
	 * @return myDetail
	 */
	public List<ChatList> selectMyDetail(Map<String, Object> map) {
		return sqlSession.selectList("chatMapper.selectMyDetail", map);
	}
	
	/** 채팅방이 이미 존재하는지 조회 DAO
	 * @param map
	 * @return result
	 */
	public int selectChatRoom(Map<String, Object> map) {
		return sqlSession.selectOne("chatMapper.selectChatRoom", map);
	}	

	/** 채팅방 만들기 DAO
	 * @param map
	 * @return result
	 */
	public int createChat(Map<String, Object> map) {
		int result = sqlSession.insert("chatMapper.createChat", map);
		
		if (result > 0) {
			return (int)map.get("chatNo");
		}
		
		return 0;
	}

	public void joinChat(Map<String, Object> map) {
		sqlSession.insert("chatMapper.joinChat", map);
	}

}
