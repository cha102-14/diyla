package com.cha102.diyla.articleModel;


import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.PersistenceContext;
import java.util.List;

public class ArtDAO implements ArtDAO_interface {
    @PersistenceContext
    private Session session;


    @Override
    public int insert(ArtVO artVO) {
        session = getSession();
        try {
            Transaction transaction = getSession().beginTransaction();
            session.persist(artVO);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return 1;
    }

    @Override
    public void update(ArtVO artVO) {
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            if (artVO != null) {
                session.merge(artVO);
            }
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

    @Override
    public boolean updateStatus(ArtVO artVO) {
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            ArtVO newArt = session.get(ArtVO.class, artVO.getArtNo());
            newArt.setArtStatus(artVO.getArtStatus());
            transaction.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return false;
    }

    @Override
    public int deleteById(Integer artno) {
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            ArtVO artVO = session.get(ArtVO.class, artno);
            if (artVO != null) {
                session.remove(artVO);
                transaction.commit();
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return -1;
        }
    }

    @Override
    public List<ArtVO> findByMemId(Integer memId) {
        final String sql = "select * from article where MEM_ID = :memId";
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            List<ArtVO> artlist = session.createNativeQuery(sql, ArtVO.class)
                    .setParameter("memId", memId).getResultList();
            transaction.commit();
            return artlist;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }

    public ArtVO findByArtNo(Integer ArtNo) {
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            ArtVO artVO = session.get(ArtVO.class, ArtNo);
            transaction.commit();
            return artVO;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }

    @Override
    public List<ArtVO> getAll() {
        final String hql = "FROM ArtVO ORDER BY artTime";
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            List<ArtVO> artlist = session.createQuery(hql, ArtVO.class).getResultList();
            transaction.commit();
            return artlist;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }

    @Override
    public List<ArtVO> getAllNoCheck() {
        final String hql = "FROM ArtVO WHERE artStatus = 0 ";
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            List<ArtVO> artlist = session.createQuery(hql, ArtVO.class).getResultList();
            transaction.commit();
            return artlist;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }

    @Override
    public List<ArtVO> getAllCheck() {
        final String hql = "FROM ArtVO WHERE artStatus = 1 or artStatus = 2";
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            List<ArtVO> artlist = session.createQuery(hql, ArtVO.class).getResultList();
            transaction.commit();
            return artlist;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }

}
