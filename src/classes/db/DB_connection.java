/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package classes.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Brandon1
 */
public class DB_connection {
    
    private static Connection db_connection;
            
    public static Connection instance()
    {
        if(db_connection == null)
        {
            try {
                DriverManager.registerDriver( new oracle.jdbc.driver.OracleDriver() );
                System.out.print("About to create db connection.\n");
                Connection vDatabaseConnection =
                        DriverManager.getConnection (
                                "jdbc:oracle:thin:@localhost:1521:XE",
                                "hospital",
                                "hospital"
                        );
                System.out.print("Connection successful.\n\n");
                db_connection = vDatabaseConnection;
                return vDatabaseConnection;
            } catch (SQLException ex) {            
                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "An error occured while fetching the data. Please try again.");
                return null;
            }
        }
        else
        {
            System.out.print("The connection has already been established.\n\n");
            return db_connection;
        }
    }
}
