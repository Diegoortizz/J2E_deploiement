/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Modele.DataSourceFactory;
import Modele.DAO;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.apache.derby.tools.ij;

/**
 *
 * @author Matthias
 */
@WebListener()
public class ApplicationListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            if (!databaseExists()) {
                initializeDatabase();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ApplicationListener.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    private boolean databaseExists() throws SQLException {
        DAO dao = new DAO(DataSourceFactory.getDataSource());
        return dao.allProd_Code() != null;
    }

    private void initializeDatabase() {

        Logger.getLogger("ProjetJEE").log(Level.INFO, "Creating databse from SQL script");
        try {
            Connection connection = DataSourceFactory.getDataSource().getConnection();
            int result = ij.runScript(connection, this.getClass().getResourceAsStream("export.sql"), "UTF-8", System.out, "UTF-8");
            if (result == 0) {
                Logger.getLogger("ProjetJEE").log(Level.INFO, "Database succesfully created");
            } else {
                Logger.getLogger("ProjetJEE").log(Level.SEVERE, "Errors creating database");
            }

        } catch (UnsupportedEncodingException | SQLException e) {
            Logger.getLogger("ProjetJEE").log(Level.SEVERE, "Errors creating database");
            Logger.getLogger("ProjetJEE").log(Level.SEVERE, null, e);
        }

    }
}
