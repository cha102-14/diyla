package com.cha102.diyla.sweetclass.classModel;

import java.sql.Timestamp;

public class ClassReserveVO {


        private int reserveId;
        private int classId;
        private int memId;
        private int headcount;
        private int status;
        private Timestamp createTime;
        private int totalPrice;

        // Default constructor
        public ClassReserveVO() {
        }

        // Constructor with all fields
        public ClassReserveVO(int reserveId, int classId, int memId, int headcount, int status, Timestamp createTime, int totalPrice) {
            this.reserveId = reserveId;
            this.classId = classId;
            this.memId = memId;
            this.headcount = headcount;
            this.status = status;
            this.createTime = createTime;
            this.totalPrice = totalPrice;
        }

        // Getters and Setters for all fields
        public int getReserveId() {
            return reserveId;
        }

        public void setReserveId(int reserveId) {
            this.reserveId = reserveId;
        }

        public int getClassId() {
            return classId;
        }

        public void setClassId(int classId) {
            this.classId = classId;
        }

        public int getMemId() {
            return memId;
        }

        public void setMemId(int memId) {
            this.memId = memId;
        }

        public int getHeadcount() {
            return headcount;
        }

        public void setHeadcount(int headcount) {
            this.headcount = headcount;
        }

        public int getStatus() {
            return status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

        public Timestamp getCreateTime() {
            return createTime;
        }

        public void setCreateTime(Timestamp createTime) {
            this.createTime = createTime;
        }

        public int getTotalPrice() {
            return totalPrice;
        }

        public void setTotalPrice(int totalPrice) {
            this.totalPrice = totalPrice;
        }


}
