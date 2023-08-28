package com.cha102.diyla.tokenModel;

import org.hibernate.Session;

import java.util.List;

import static com.cha102.diyla.articleModel.HibernateUtil.getSessionFactory;

public interface TokenDAO_interface{

    public int insert(TokenVO tokenVO);

    public void update(TokenVO tokenVO);

    public int delete(Integer tokenNo);

    public TokenVO findByTokenId(Integer tokenNo);
    public List<TokenVO> findByMemId(Integer memId);
    public Integer findByMemIdTotal(Integer memId);

    public List<TokenVO> getAll();

    default Session getSession() {
        return getSessionFactory().getCurrentSession();
    }
}
