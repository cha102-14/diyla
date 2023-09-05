package com.cha102.diyla.tokenModel;

import java.util.List;

public class TokenService implements TokenService_interface {

    private TokenDAO_interface dao;

    public TokenService() {
        dao = new TokenDAO();
    }
    @Override
    public TokenVO addToken(Integer tokenCount, Byte tokenGetUse, Integer memId) {
        TokenVO tokenVO = new TokenVO();
        tokenVO.setTokenCount(tokenCount);
        tokenVO.setTokenGetUse(tokenGetUse);
        tokenVO.setMemId(memId);

        dao.insert(tokenVO);
        return tokenVO;
    }

    @Override
    public TokenVO deleteToken(Integer tokenNo) {
        return null;
    }

    @Override
    public TokenVO updateToken(Integer tokenCount, Byte tokenGetUse) {
        return null;
    }

    @Override
    public List<TokenVO> getAllTokenByMemId(Integer memId) {
        return dao.findByMemId(memId);
    }

    @Override
    public Integer getTokenTotalByMemId(Integer memId) {
        return dao.findByMemIdTotal(memId);
    }

    @Override
    public List<TokenVO> getTokenAll() {
        return null;
    }
}
