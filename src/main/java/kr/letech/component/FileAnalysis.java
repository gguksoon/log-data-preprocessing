package kr.letech.component;

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
		}
		
		String str = "119.203.228.173 - - [11/Feb/2022:13:17:59 +0900] \"POST /letech/aprv/aprv02Ajax.do HTTP/1.1\" 200 1982";
		List<Regex> regexList = lpp.getRegex();
		for(Regex regex : regexList) {
			Pattern p = Pattern.compile(regex.getRegex());
			Matcher m = p.matcher(str);
			while(m.find()) {
				System.out.println(regex.getColumnName() + " ==> " + m.group(1));
			}
		}
		
		return null;  
	}
	
	private int createTable(Lpp lpp) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		try {
			// STEP 1: Register JDBC driver
			Class.forName("org.h2.Driver");

			// STEP 2: Open a connection
			conn = DriverManager.getConnection("jdbc:h2:mem:testdb", "sa", "");

			// STEP 3: Execute a query
			stmt = conn.createStatement();
			String sql = "CREATE TABLE " + lpp.getTableName() + " (";
			sql += "SEQ NUMBER AUTO_INCREMENT PRIMARY KEY";
			for(Regex regex : lpp.getRegex()) {
				sql += ", " + regex.getColumnName() + " VARCHAR(4000)";
			}
			sql += ");";
			
			stmt.executeUpdate(sql);

			// STEP 4: Clean-up environment
			stmt.close();
			conn.close();
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			} // nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			} // end finally try
		} // end try
		return 1;
	}
}
