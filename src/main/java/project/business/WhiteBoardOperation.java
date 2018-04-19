package project.business;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import project.business.WhiteBoard;
import project.dao.*;

@Component
public class WhiteBoardOperation {
	
	
	private WhiteBoardData data;
	
		@Autowired
		public WhiteBoardOperation(WhiteBoardData data){
			this.data = data;
		}
		
		public List<WhiteBoard>getProducts(){
			return data.getAllWhiteBoard();
		}
}
