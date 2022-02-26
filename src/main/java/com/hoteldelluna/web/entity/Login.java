package com.hoteldelluna.web.entity;

public class Login {
	
	private String id;
	private String pwd;
	private String rePwd;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private int isdel;
	
	public Login() {}
	
	

	public Login(String id, String pwd, String rePwd, String name, String birth, String gender, String email,
			String phone, int isdel) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.rePwd = rePwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.isdel = isdel;
	}



	public int getIsdel() {
		return isdel;
	}



	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRePwd() {
		return rePwd;
	}

	public void setRePwd(String rePwd) {
		this.rePwd = rePwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Login [id=" + id + ", pwd=" + pwd + ", rePwd=" + rePwd + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", email=" + email + ", phone=" + phone + "]";
	}

	
	
}
