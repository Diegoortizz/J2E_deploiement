package Modele;

import javax.sql.DataSource;

public class DataSourceFactory {

    public static DataSource getDataSource() {
        org.apache.derby.jdbc.EmbeddedDataSource es = new org.apache.derby.jdbc.EmbeddedDataSource();
        es.setCreateDatabase("create");
        es.setDatabaseName("embedded_sample");
        return es;
    }

}
