package com.cha102.diyla.commodityCommentModel;

import com.cha102.diyla.member.MemberService;
import org.springframework.stereotype.Service;

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

    public List<CommodityCommentVO> getAllByComNo(Integer comNo) {
        List<CommodityCommentVO> commodityCommentVOS = commodityCommentRepository.findAllByComNo(comNo);
        commodityCommentVOS.forEach(commodityCommentVO -> {
            commodityCommentVO.setMemName(memberService.selectMem(commodityCommentVO.getMemId()).getMemName());
            commodityCommentVO.setCommentTime(getDate(commodityCommentVO.getComTime()));
            commodityCommentVO.setStar(getStar(commodityCommentVO.getRating()));
        });
        return commodityCommentVOS;

    }

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
