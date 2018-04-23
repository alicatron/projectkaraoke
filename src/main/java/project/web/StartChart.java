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
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

public class StartChart{
	
	public static JFreeChart createBarChart(){
		Connection cn;
		JFreeChart chart = null;
		try{
			DefaultCategoryDataset dataset = new DefaultCategoryDataset( );
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
					"root","c0nygre");
			PreparedStatement st = cn.prepareStatement("select startDate, count(*) as 'Number of Starters'  "
					+ "from candidate where startDate = StartDate "
					+ "GROUP BY startDate");
			ResultSet rs = st.executeQuery();
			while(rs.next()){ 
				dataset.addValue(new Double( rs.getDouble(2) ), rs.getDate(1), "" );
			}
			
			
			chart = ChartFactory.createBarChart(
					"Start Date",
					"Date",
					"No. of Starters",
					dataset,
					PlotOrientation.VERTICAL,
					true,             // include legend
					true,
					false);
			cn.close();
			int width = 640;   
			int height = 480;  
			File barChart = new File( "start_date.jpeg" ); 
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