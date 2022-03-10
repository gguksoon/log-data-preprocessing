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
		LineNumberReader reader = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			reader = new LineNumberReader(new FileReader(lpp.getFilePath()));
			String url = null;
			if("MariaDB".equals(lpp.getDbType())) {
				url = "jdbc:mariadb://" + lpp.getDbUrl() + ":" + lpp.getDbPort() + "/" + lpp.getDbName(); // jdbc:mariadb://10.10.250.105:23306/lpp
				Class.forName("org.mariadb.jdbc.Driver");
			} else if("H2".equals(lpp.getDbType())) {
				url = "jdbc:h2" + ":" + lpp.getDbName(); // jdbc:h2:mem:testdb
				Class.forName("org.h2.Driver");
			}
			conn = DriverManager.getConnection(url, lpp.getDbUser(), lpp.getDbPass());
			stmt = conn.createStatement();
			
			stmt.executeUpdate("DROP TABLE IF EXISTS " + lpp.getTableName());
			String sql = "CREATE TABLE IF NOT EXISTS " + lpp.getTableName() + " (";
			sql += "SEQ INT(20) AUTO_INCREMENT PRIMARY KEY";
			for(Regex regex : lpp.getRegex()) {
				sql += ", " + regex.getColumnName() + " TEXT";
			}
			sql += ")";
			
			stmt.executeUpdate(sql);
			
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
					}
					String sql2 = "INSERT INTO " + lpp.getTableName() + "(" + sqlKey + ") VALUES (" + sqlValue + ");";
					System.out.println(str);
					System.out.println(reader.getLineNumber() + " ==> " + sql2);
					stmt.executeUpdate(sql2);
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
	
}
