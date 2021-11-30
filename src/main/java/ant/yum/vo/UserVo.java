package ant.yum.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class UserVo {
	
	private int uNo;
	private String uPassword;
	private String Uname;
	private String uRRN;
	private String uJob;
	private String uAuth;
	private String uPhone;
	private String uGender;
}
