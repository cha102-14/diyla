package com.cha102.diyla.articleModel;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class TestArt {
    public static void main(String[] args) {

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        ArtVO artVO = session.get(ArtVO.class,2);

        System.out.println(artVO.getArtTitle());

        HibernateUtil.shutdown();
    }
}
