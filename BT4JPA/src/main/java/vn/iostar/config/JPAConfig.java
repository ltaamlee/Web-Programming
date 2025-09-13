package vn.iostar.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    private static final EntityManagerFactory FACTORY;

    static {
        try {
            FACTORY = Persistence.createEntityManagerFactory("JPA");
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static EntityManager getEntityManager() {
        return FACTORY.createEntityManager();
    }
}

//package vn.iostar.config;
//
//import jakarta.persistence.EntityManager;
//import jakarta.persistence.EntityManagerFactory;
//import jakarta.persistence.Persistence;
//
//public class JPAConfig {
//    private static final EntityManagerFactory FACTORY;
//
//    static {
//        try {
//            FACTORY = Persistence.createEntityManagerFactory("JPA");
//            System.out.println("EntityManagerFactory created successfully!");
//        } catch (Throwable ex) {
//            System.err.println("Failed to create EntityManagerFactory: " + ex);
//            throw new ExceptionInInitializerError(ex);
//        }
//    }
//
//    public static EntityManager getEntityManager() {
//        return FACTORY.createEntityManager();
//    }
//
//    // Phương thức main để kiểm tra
//    public static void main(String[] args) {
//        try {
//            EntityManager em = JPAConfig.getEntityManager();
//            System.out.println("EntityManager created successfully: " + em);
//            em.close();
//        } catch (Exception e) {
//            System.err.println("Error creating EntityManager: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
//}
