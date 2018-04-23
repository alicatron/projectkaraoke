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
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;


public class CreateChart{
	
	public static JFreeChart createBarChart(){
		Connection cn;
		JFreeChart chart = null;
		
		try{
			DefaultCategoryDataset dataset = new DefaultCategoryDataset( );
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
					"root","c0nygre");
			PreparedStatement st = cn.prepareStatement("SELECT r.email as 'Recruiter', COUNT(*) as 'Number of Hires' "
					+ "FROM recruiter r JOIN candidate c WHERE r.recruiterid = c.recruiterid "
					+ "GROUP BY r.email");
			ResultSet rs = st.executeQuery();
			while(rs.next()){ 
				dataset.addValue(new Double(rs.getDouble(2)), rs.getString(1), " " );
				
			}
			
			chart = ChartFactory.createBarChart(
					"Hires Per Recruiter", // chart title
					"Recruiter" ,
					"Number Of Hires",
					dataset,
					PlotOrientation.VERTICAL,
			        true,true,false);
			cn.close();
			
			
			int width = 640;   
			int height = 480;  
			File BarChart = new File( "numberhires.jpeg" ); 
			ChartUtilities.saveChartAsJPEG( BarChart, chart, width , height );
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

