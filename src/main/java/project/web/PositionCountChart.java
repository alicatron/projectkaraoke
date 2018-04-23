package project.web;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.NumberTickUnit;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

public class PositionCountChart{
	
	public static JFreeChart createBarChart(){
		Connection cn;
		JFreeChart chart = null;
		try{
			DefaultCategoryDataset dataset = new DefaultCategoryDataset( );
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
					"root","c0nygre");
			PreparedStatement st = cn.prepareStatement("SELECT numofpositions, practice  "
					+ "FROM vacancy "
					+ "GROUP BY practice");
			ResultSet rs = st.executeQuery();
			while(rs.next()){ 
				dataset.addValue(new Double(rs.getDouble(1)), rs.getString(2), " " );
			}
			
			
			chart = ChartFactory.createBarChart(
					"Vacancies Per Practice", // chart title
					"Practice" ,
					"No. Roles Required",
					dataset,
					PlotOrientation.VERTICAL,
			        true,true,false);
			
			cn.close();
			int width = 640;   
			int height = 480;  
			File barChart = new File( "bar.jpeg" ); 
			ChartUtilities.saveChartAsJPEG( barChart , chart , width , height );
			return chart;
		}
		catch (ClassNotFoundException ex) {
			System.out.println(ex.getMessage());
		}
		catch(SQLException ex){
			System.out.println(ex.getMessage());
		}
		catch(IOException ex){
			System.out.println(ex.getMessage());
		}
		return chart;
	}
}