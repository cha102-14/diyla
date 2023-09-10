package com.cha102.diyla.tokenModel;

import java.util.List;

public interface TokenService_interface {

    public TokenVO addToken(Integer tokenCount,Byte tokenGetUse,Integer memId);

    public TokenVO deleteToken(Integer tokenNo);

    public TokenVO updateToken(Integer tokenCount,Byte tokenGetUse);

    public List<TokenVO> getAllTokenByMemId(Integer memId);
    public Integer getTokenTotalByMemId(Integer memId);

    public List<TokenVO> getTokenAll();
}
