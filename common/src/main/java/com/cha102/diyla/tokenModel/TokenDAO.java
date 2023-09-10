package com.cha102.diyla.tokenModel;

import com.cha102.diyla.articleModel.ArtVO;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.type.IntegerType;

import javax.persistence.PersistenceContext;
import java.util.List;

public class TokenDAO implements TokenDAO_interface {
    @PersistenceContext
    private Session session;

    @Override
    public int insert(TokenVO tokenVO) {
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            session.persist(tokenVO);
            transaction.commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return -1;
        }
    }

    @Override
    public void update(TokenVO tokenVO) {

    }

    @Override
    public int delete(Integer tokenNo) {
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            ArtVO artVO = session.get(ArtVO.class, tokenNo);
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
    public TokenVO findByTokenId(Integer tokenNo) {
        return null;
    }

    @Override
    public Integer findByMemIdTotal(Integer memId) {
        final String sql = "SELECT sum(token_Count) as total FROM Token WHERE mem_Id = :memId";
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            Integer total = (Integer) getSession().createNativeQuery(sql)
                    .setParameter("memId", memId)
                    .addScalar("total", IntegerType.INSTANCE)  // 告訴 Hibernate 返回整數類型
                    .uniqueResult();
            transaction.commit();
            return total;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return null;
    }

    @Override
    public List<TokenVO> findByMemId(Integer memId) {
        final String sql = "SELECT * FROM Token WHERE mem_Id = :memId";
        session = getSession();
        try {
            Transaction transaction = session.beginTransaction();
            List<TokenVO> list = getSession().createNativeQuery(sql, TokenVO.class)
                    .setParameter("memId", memId)
                    .getResultList();
            transaction.commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return null;
    }


    @Override
    public List<TokenVO> getAll() {
        return null;
    }
}
