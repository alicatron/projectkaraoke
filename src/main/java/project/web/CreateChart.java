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
import org.jfree.data.general.DefaultPieDataset;

public class CreateChart{
	
	public static JFreeChart createPieChart(){
		Connection cn;
		JFreeChart chart = null;
		try{
			DefaultPieDataset dataset = new DefaultPieDataset( );
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
					"root","c0nygre");
			PreparedStatement st = cn.prepareStatement("SELECT r.email as 'Recruiter', COUNT(*) as 'Number of Hires' "
					+ "FROM recruiter r JOIN candidate c WHERE r.recruiterid = c.recruiterid "
					+ "GROUP BY r.email");
			ResultSet rs = st.executeQuery();
			while(rs.next()){ 
				dataset.setValue(rs.getString(1), new Double( rs.getDouble(2) ) );
			}
			
			
			chart = ChartFactory.createPieChart(
					"Number of Hires", // chart title
					dataset,          // data
					true,             // include legend
					true,
					false);
			cn.close();
			int width = 640;   /* Width of the image */
			int height = 480;  /* Height of the image */ 
			File pieChart = new File( "number_hires.jpeg" ); 
			ChartUtilities.saveChartAsJPEG( pieChart , chart , width , height );
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

