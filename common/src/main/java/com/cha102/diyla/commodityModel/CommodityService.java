package com.cha102.diyla.commodityModel;

import java.util.Base64;
import java.util.List;

public class CommodityService {
    CommodityDao dao = new CommodityDaoImpl();

    public int insert(CommodityVO commodityVO) {
        return dao.insert(commodityVO);
    }

    public List<CommodityVO> getAll() {
        List<CommodityVO> commodityVOS = dao.getAll();
        for (CommodityVO commodityVO : commodityVOS) {
            setShowPic(commodityVO);
        }
        return commodityVOS;
    }

    public List<CommodityVO> getAllState() {
        List<CommodityVO> commodityVOS = dao.getAllState();
        for (CommodityVO commodityVO : commodityVOS) {
            setShowPic(commodityVO);
        }
        return commodityVOS;
    }

    public CommodityVO findByID(Integer comNO) {
        CommodityVO commodityVO = dao.findByID(comNO);
        setShowPic(commodityVO);
        return commodityVO;
    }

    public List<CommodityVO> findByNameKeyword(String keyword) {
        List<CommodityVO> commodityVOS = dao.findByNameKeyword(keyword);
        for (CommodityVO commodityVO : commodityVOS) {
            setShowPic(commodityVO);
        }
        return commodityVOS;
    }

    public List<CommodityVO> findByComClass(Integer comClassNO) {
        List<CommodityVO> commodityVOS = dao.findByComClass(comClassNO);
        for (CommodityVO commodityVO : commodityVOS) {
            setShowPic(commodityVO);
        }
        return commodityVOS;
    }

    public CommodityVO updateCommodity(CommodityVO commodity) {

        CommodityVO commodityVO = dao.update(commodity);
        setShowPic(commodityVO);
        return commodityVO;

    }

    private static void setShowPic(CommodityVO commodityVO) {
        commodityVO.setShowPic("data:image/png;base64," + Base64.getEncoder().encodeToString(commodityVO.getComPic()));
    }
}
