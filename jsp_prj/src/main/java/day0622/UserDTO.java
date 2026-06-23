package day0622;

import lombok.NoArgsConstructor;



public class UserDTO {
	private String name;
	private String email;
	private int age;
	
	
	public UserDTO(String name, String email, int age) {
		
		this.name = name;
		this.email = email;
		this.age = age;
		System.out.println("인자있는 생성자");
	}

	public UserDTO() {
		super();
		System.out.println("기본 생성자");
	}
	
	@Override
	public String toString() {
		return "UserDTO [name=" + name + ", email=" + email + ", age=" + age + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	
	
}
