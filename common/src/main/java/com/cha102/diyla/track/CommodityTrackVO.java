package com.cha102.diyla.track;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Table(name = "COMMODITY_TRACK")
@Entity
public class CommodityTrackVO implements Serializable {

    @Id
    @Column(name = "TRACK_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer trackId;

    @Column(name = "MEM_ID",nullable = false)
    private Integer memId;

    @Column(name = "COM_NO",nullable = false)
    private Integer comNO;

    public Integer getTrackId() {
        return trackId;
    }

    public void setTrackId(Integer trackId) {
        this.trackId = trackId;
    }

    public Integer getMemId() {
        return memId;
    }

    public void setMemId(Integer memId) {
        this.memId = memId;
    }

    public Integer getComNO() {
        return comNO;
    }

    public void setComNO(Integer comNO) {
        this.comNO = comNO;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommodityTrackVO that = (CommodityTrackVO) o;
        return Objects.equals(trackId, that.trackId) && Objects.equals(memId, that.memId) && Objects.equals(comNO, that.comNO);
    }

    @Override
    public int hashCode() {
        return Objects.hash(trackId, memId, comNO);
    }
}
