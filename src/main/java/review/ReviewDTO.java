package review;

import lombok.Builder;
import lombok.Data;
import java.sql.Timestamp;

@Data
@Builder
public class ReviewDTO {
	private int id;
	private String customer_id;
	private String customer_name;
	private int product_id;
	private String detail;
	private Timestamp createDate;
	private Timestamp updateDate;
}
