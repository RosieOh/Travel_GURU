package product;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductDTO {
	private int id;
	private String name;
	private int price;
	private String category;
	private String summary;
	private String content;
	private String imgUrl_1;
	private String imgUrl_2;
	private String imgUrl_3;
	private String imgUrl_4;
}
