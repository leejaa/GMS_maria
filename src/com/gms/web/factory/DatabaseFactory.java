package com.gms.web.factory;
import com.gms.web.constant.Database;
import com.gms.web.constant.Vendor;
import com.gms.web.domain.DatabaseBean;

public class DatabaseFactory {
	public static DatabaseBean createDatabase(
			Vendor vendor,String username,String password){
		String driver="",url="";
		switch (vendor) {
		case ORACLE:
			driver=Database.ORACLE_DRIVER;
			url=Database.ORACLE_URL;
			break;
		case DB2:
			driver=Database.DB2_DRIVER;
			url=Database.DB2_URL;
			break;
		case MSSQL:
			driver=Database.MSSQL_DRIVER;
			url=Database.MSSQL_URL;
			break;
		case MYSQL:
			driver=Database.MYSQL_DRIVER;
			url=Database.MYSQL_URL;
			break;
		case MARIADB:
			driver=Database.MARIADB_DRIVER;
			url=Database.MARIADB_URL;
			break;
		default:
			break;
		}
		return new DatabaseBean(driver, url, username, password);
	}
}
