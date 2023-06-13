package board;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardDTO {
	private int id;
	private String user_id;
	private String user_name;
	private String title;
	private String content;
	private int viewCount;
	private boolean isDeleted;
	private String createDate;
	private String updateDate;
	private String deleteDate;
}
