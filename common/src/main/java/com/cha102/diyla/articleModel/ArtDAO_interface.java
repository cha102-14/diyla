package com.cha102.diyla.articleModel;

import org.hibernate.Session;

import java.util.List;

import static com.cha102.diyla.articleModel.HibernateUtil.getSessionFactory;

public interface ArtDAO_interface {

    public int insert(ArtVO artVO);

    public void update(ArtVO artVO);

    public boolean updateStatus(ArtVO artVO);

    public int deleteById(Integer artno);

    public List<ArtVO> findByMemId(Integer memId);

    public ArtVO findByArtNo(Integer ArtNo);

    public List<ArtVO> getAll();

    public List<ArtVO> getAllNoCheck();
    public List<ArtVO> getAllCheck();

    default Session getSession() {
//        return getSessionFactory().openSession();
        return getSessionFactory().getCurrentSession();
    }
}


