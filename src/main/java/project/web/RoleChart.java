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

public class RoleChart{
	
	public static JFreeChart createBarChart(){
		Connection cn;
		JFreeChart chart = null;
		try{
			DefaultCategoryDataset dataset = new DefaultCategoryDataset( );
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
					"root","c0nygre");
			PreparedStatement st = cn.prepareStatement("SELECT role, COUNT(*) AS 'Number of Roles Filled'  "
					+ "FROM vacancy v JOIN candidate c  WHERE v.vacancyid = c.vacancyid "
					+ "GROUP BY role");
			ResultSet rs = st.executeQuery();
			while(rs.next()){ 
				dataset.addValue(new Double(rs.getDouble(2)), rs.getString(1), "" );
			}
			
			
			chart = ChartFactory.createBarChart(
					"Hires Per Role", // chart title
					"Role",
					"No. of Hires",
					dataset,
					PlotOrientation.VERTICAL,
					true,             // include legend
					true,
					false);
			
			
			
			cn.close();
			int width = 640;   
			int height = 480;  
			File pieChart = new File( "role_chart.jpeg" ); 
			ChartUtilities.saveChartAsJPEG( pieChart , chart , width , height );
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