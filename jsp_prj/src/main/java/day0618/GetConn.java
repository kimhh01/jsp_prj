package day0618;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GetConn {
	public Connection getConn() throws SQLException{
		Connection con = null;
		// 1. JDNI 사용객체를 생성한다. 
		try {
			Context ctx = new InitialContext();
			// 2. Tomcat에 DBCP에서 DataSource를 얻음 
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
			// 3. DataSource에서 connection 얻기 
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
}	
