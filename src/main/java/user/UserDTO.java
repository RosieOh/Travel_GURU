package user;

import lombok.Builder;
import lombok.Data;
import java.sql.Timestamp;

@Data
@Builder
public class UserDTO {
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String auth;
	private long kakaoId;
	private long naverId;
	private Timestamp createDate;
}
