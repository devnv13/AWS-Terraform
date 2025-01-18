import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class HelloPod {
    public static void main(String[] args) {
        String podName = System.getenv("POD_NAME");
        System.out.println("Pod Name: " + podName);
        System.out.println("Java Version: " + System.getProperty("java.version"));

        // MySQL connection parameters
        String jdbcUrl = "jdbc:mysql://mysql-service.demo.svc.cluster.local:3306/demo?useSSL=false&allowPublicKeyRetrieval=true";
        String username = "demo_user";
        String password = "demo_password";

        while (true) { // Keep the application running
            try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
                System.out.println("Connected to the MySQL database!");

                // Create a table
                String createTableSQL = "CREATE TABLE IF NOT EXISTS test_data (id INT AUTO_INCREMENT PRIMARY KEY, message VARCHAR(255))";
                connection.createStatement().execute(createTableSQL);

                // Insert data
                String insertSQL = "INSERT INTO test_data (message) VALUES (?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertSQL)) {
                    preparedStatement.setString(1, "Hello from Pod: " + podName);
                    preparedStatement.executeUpdate();
                }

                // Retrieve data
                String selectSQL = "SELECT * FROM test_data";
                try (ResultSet resultSet = connection.createStatement().executeQuery(selectSQL)) {
                    while (resultSet.next()) {
                        System.out.println("ID: " + resultSet.getInt("id") + ", Message: " + resultSet.getString("message"));
                    }
                }
            } catch (Exception e) {
                System.err.println("Database connection failed: " + e.getMessage());
                e.printStackTrace();
            }

            try {
                // Sleep to prevent constant retries and keep the application alive
                Thread.sleep(60000); // Sleep for 60 seconds
            } catch (InterruptedException e) {
                System.err.println("Application interrupted: " + e.getMessage());
                break;
            }
        }
    }
}
