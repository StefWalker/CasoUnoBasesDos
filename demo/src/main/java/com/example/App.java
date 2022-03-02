package com.example;

import java.sql.*;

// Clase encargada de ejecutar cada Thread, Cada hilo Ejectuta el Query 1 Completandolo con uno de los 10 cantones distintos
class Multithreading extends Thread {
    String pCanton;
    static final String DB_URL = "jdbc:sqlserver://localhost:1433;" +
                                 "databaseName=CasoBases;" +
                                 "encrypt=true;trustServerCertificate=true";
    static final String USER = "sa";
    static final String PASS = "login1234";
    static final String QUERY = "SELECT COUNT(D.IdDeliverable), PA.Nombre, C.Nombre " +
	                            "FROM Deliverables D " + 
	                            "INNER JOIN Cantones C " +
	                            "ON C.IdCanton = D.IdCanton " +
	                            "INNER JOIN Actions A " +
	                            "ON A.IdAction = D.IdAction " +
	                            "INNER JOIN Plans P " +
	                            "ON P.IdPlan = A.IdPlan " +
	                            "INNER JOIN Parties PA " +
	                            "ON PA.IdPartido = P.IdPartido " +
	                            "WHERE C.Nombre = '";
    static final String QUERYGroup = " GROUP BY PA.Nombre, C.Nombre ";

    // Funcion encargada de ejecutar el hilo y enviar el Queary a la DB y solicitar los datos 
    // con ayuda de Jdbc
    public void run()
    {
        try {
            // Displaying the thread that is running
            
            try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(QUERY + pCanton + QUERYGroup);) {
        // Extract data from result set
                while (rs.next()) {
                    // Retrieve by column name
                    System.out.println("Entregables: " + rs.getInt(1) + ", Partido: " + 
                                        rs.getString(2) + ", Canton: " + 
                                        rs.getString(3) );
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        catch (Exception e) {
            // Throwing an exception
            System.out.println("Exception is caught");
        }
    }
}

public class App 
{
    
    static final String[] CANTONES = {"Acosta' ","Moravia' ","Buenos Aires' ","Esparza' ","Cartago' ","Alajuela' ","Flores' ","Limon' ","Heredia' ","Turrialba' "};

    public static void main( String[] args )
    {
    // Open a connection
        long start = System.currentTimeMillis();
        int n = 10; // Number of threads
        for (int i = 0; i < n; i++) {
            Multithreading object
                = new Multithreading();
            object.pCanton = CANTONES[i];
            object.start();
        }
        long finish = System.currentTimeMillis();
        long timeElapsed = finish - start;

        System.out.print("Tiempo transcurrido: ");
        System.out.println(timeElapsed);
    }
}

