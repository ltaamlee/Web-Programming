package vn.iostart.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnect {
	private final String serverName = "localhost";
	private final String dbName = "USERSDB";
	private final String instance = "";
	private final String portNumber = "1433";

	public Connection getConnectW() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + "\\" + ":" + portNumber
				+ ";integratedSecurity=true;encrypt=true;trustServerCertificate=true;databaseName=" + dbName;

		if (instance == null || instance.trim().isEmpty())
			url = "jdbc:sqlserver://" + serverName + ":" + portNumber
					+ ";integratedSecurity=true;encrypt=true;trustServerCertificate=true;databaseName=" + dbName;

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url);
	}

	public static void main(String[] args) {
//		try {
//			System.out.println(new DBConnect().getConnectW());
//			System.out.println("Kết nối thành công!");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		try (Connection conn = new DBConnect().getConnectW();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM Users")) {

			System.out.println("ID | Email | Username | FullName | Password | Avatar | RoleID | Phone | CreatedDate");
			System.out.println("---------------------------------------------------------------");

			while (rs.next()) {
				int id = rs.getInt("id");
				String email = rs.getString("email");
				String userName = rs.getString("userName");
				String fullName = rs.getString("fullName");
				String password = rs.getString("password");
				String avatar = rs.getString("avatar");
				int roleId = rs.getInt("roleid");
				String phone = rs.getString("phone");
				java.sql.Timestamp createdDate = rs.getTimestamp("createdDate");

				System.out.printf("%d | %s | %s | %s | %s | %s | %d | %s | %s%n", id, email, userName, fullName,
						password, avatar, roleId, phone, createdDate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
