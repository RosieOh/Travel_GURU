package cart;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartDTO {
	private int id;
	private String user_id ;
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_category;
	private String product_summary;
	private String product_imgUrl_1;
}
