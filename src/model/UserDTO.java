package model;

public class UserDTO {
	
	String userType;
	String userNo;
	String userId;
	String userPwd;
	String birthDt;
	String gender;
	String email;
	String contact; //연락처
	String stYmdhms; //가입
	String endYmshms; //변경 
	String userNm;
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getStYmdhms() {
		return stYmdhms;
	}
	public void setStYmdhms(String stYmdhms) {
		this.stYmdhms = stYmdhms;
	}
	public String getEndYmshms() {
		return endYmshms;
	}
	public void setEndYmshms(String endYmshms) {
		this.endYmshms = endYmshms;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	
	public UserDTO() {

	}
	
	public UserDTO(String userType, String userNo, String userId, String userPwd, String birthDt, String gender,
			String email, String contact, String stYmdhms, String endYmshms, String userNm) {
		super();
		this.userType = userType;
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.birthDt = birthDt;
		this.gender = gender;
		this.email = email;
		this.contact = contact;
		this.stYmdhms = stYmdhms;
		this.endYmshms = endYmshms;
		this.userNm = userNm;
	}

	
}
