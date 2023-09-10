package com.cha102.diyla.commodityCommentModel;

import com.cha102.diyla.member.MemberService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class CommodityCommentService {

    private CommodityCommentRepository commodityCommentRepository;
    private MemberService memberService= new MemberService();
    public CommodityCommentService(CommodityCommentRepository commodityCommentRepository) {
        this.commodityCommentRepository = commodityCommentRepository;
    }

    public List<CommodityCommentVO> getAllByComNo(Integer comNo,String sort) {
        List<CommodityCommentVO> commodityCommentVOS=null;

        switch (sort) {
            case "" :
                commodityCommentVOS = commodityCommentRepository.findAllByComNo(comNo);
                break;

            case "asc" :
                commodityCommentVOS = commodityCommentRepository.findAllByComNoOrderByRatingAsc(comNo);
                break;

            case "desc" :
                commodityCommentVOS = commodityCommentRepository.findAllByComNoOrderByRatingDesc(comNo);
                break;
        }

        commodityCommentVOS.forEach(commodityCommentVO -> {
            commodityCommentVO.setMemName(memberService.selectMem(commodityCommentVO.getMemId()).getMemName());
            commodityCommentVO.setCommentTime(getDate(commodityCommentVO.getComTime()));
            commodityCommentVO.setStar(getStar(commodityCommentVO.getRating()));
        });
        return commodityCommentVOS;

    }

    @Transactional(rollbackFor = SQLException.class)
    public void deleteByComCommentNo(Integer comCommentNo) {
        commodityCommentRepository.deleteByComCommentNo(comCommentNo);
    }


    public void save(CommodityCommentVO commodityCommentVO) {
        commodityCommentRepository.save(commodityCommentVO);
    }

    private String getDate(Timestamp timestamp) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.format(timestamp);

    }

    private String getStar(Integer rating) {
        String star = "";
        for (int i = 0; i < rating; i++) {
            star = star + "★";
        }
        return star;
    }

    private void setAverager(List<CommodityCommentVO> commodityCommentVOS) {
        double sum = 0;
        for (CommodityCommentVO commodityCommentVO:commodityCommentVOS) {
            sum += commodityCommentVO.getRating();
        }
        CommodityCommentVO.average = new DecimalFormat("#.0").format(sum / commodityCommentVOS.size());
    }

}
