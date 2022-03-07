package kr.letech.component;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

import kr.letech.domain.Lpp;
import kr.letech.domain.Regex;

@Component
public class FileAnalysis {

	/**
	 * @param Map{required, regex, columnName} in regexList
	 * @return
	 */
	public Map<String, String> fileAnalysis(Lpp lpp) {
		try {
			this.createTable(lpp);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
		LineNumberReader reader = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			reader = new LineNumberReader(new FileReader("C:\\Users\\msjo\\Desktop\\test_log_files\\localhost_access_log.2022-02-14.txt"));
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection("jdbc:h2:mem:testdb", "sa", "");
			stmt = conn.createStatement();
			String str;
			try {
				while ((str = reader.readLine()) != null) {
					List<Regex> regexList = lpp.getRegex();
					String sqlKey = "";
					String sqlValue = "";
					int count = 0;
					for(Regex regex : regexList) {
						Pattern p = Pattern.compile(regex.getRegex());
						Matcher m = p.matcher(str);
						while(m.find()) {
							if(count++ != 0) {
								sqlKey += ",";
								sqlValue += ",";
							}
							sqlKey += regex.getColumnName();
							if(m.group(1).isEmpty()) {
								sqlValue += "null";
							} else {
								sqlValue += "'" + m.group(1) + "'";
							}
						}
						String sql = "INSERT INTO " + lpp.getTableName() + "(" + sqlKey + ") VALUES (" + sqlValue + ");";
						stmt.executeUpdate(sql);
						System.out.println(sql);
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			} 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (stmt != null) stmt.close(); } catch (SQLException se) {} 
			try { if (conn != null)	conn.close(); } catch (SQLException se) {}
			try { if (reader != null) reader.close(); } catch (IOException e) {}
		} 
		
		return null;  
	}
	
	private int createTable(Lpp lpp) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("org.h2.Driver");

			conn = DriverManager.getConnection("jdbc:h2:mem:testdb", "sa", "");

			stmt = conn.createStatement();
			String sql = "CREATE TABLE " + lpp.getTableName() + " (";
			sql += "SEQ NUMBER AUTO_INCREMENT PRIMARY KEY";
			for(Regex regex : lpp.getRegex()) {
				sql += ", " + regex.getColumnName() + " VARCHAR(4000)";
			}
			sql += ");";
			
			stmt.executeUpdate(sql);
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		} finally {
			try { if (stmt != null) stmt.close(); } catch (SQLException se) {} 
			try { if (conn != null)	conn.close(); } catch (SQLException se) {}
		} 
		return 1;
	}
}
