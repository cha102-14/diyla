package com.cha102.diyla.sweetclass.classModel;
import java.sql.Date;

public class ClassVO {

        private int classId;
        private int category;
        private int teaId;
        private Date regEndTime;
        private Date classDate;
        private int classSeq;
        private byte[] classPic;
        private int classLimit;
        private int price;
        private String intro;
        private String className;
        private int headcount;
        private int classStatus;

        // Default constructor
        public ClassVO() {
        }

        // Constructor with all fields
        public ClassVO(int classId, int category, int teaId, Date regEndTime, Date classDate, int classSeq,
                       byte[] classPic, int classLimit, int price, String intro, String className, int headcount,
                       int classStatus) {
            this.classId = classId;
            this.category = category;
            this.teaId = teaId;
            this.regEndTime = regEndTime;
            this.classDate = classDate;
            this.classSeq = classSeq;
            this.classPic = classPic;
            this.classLimit = classLimit;
            this.price = price;
            this.intro = intro;
            this.className = className;
            this.headcount = headcount;
            this.classStatus = classStatus;
        }

        // Getters and Setters for all fields
        public int getClassId() {
            return classId;
        }

        public void setClassId(int classId) {
            this.classId = classId;
        }

        public int getCategory() {
            return category;
        }

        public void setCategory(int category) {
            this.category = category;
        }

        public int getTeaId() {
            return teaId;
        }

        public void setTeaId(int teaId) {
            this.teaId = teaId;
        }

        public Date getRegEndTime() {
            return regEndTime;
        }

        public void setRegEndTime(Date regEndTime) {
            this.regEndTime = regEndTime;
        }

        public Date getClassDate() {
            return classDate;
        }

        public void setClassDate(Date classDate) {
            this.classDate = classDate;
        }

        public int getClassSeq() {
            return classSeq;
        }

        public void setClassSeq(int classSeq) {
            this.classSeq = classSeq;
        }

        public byte[] getClassPic() {
            return classPic;
        }

        public void setClassPic(byte[] classPic) {
            this.classPic = classPic;
        }

        public int getClassLimit() {
            return classLimit;
        }

        public void setClassLimit(int classLimit) {
            this.classLimit = classLimit;
        }

        public int getPrice() {
            return price;
        }

        public void setPrice(int price) {
            this.price = price;
        }

        public String getIntro() {
            return intro;
        }

        public void setIntro(String intro) {
            this.intro = intro;
        }

        public String getClassName() {
            return className;
        }

        public void setClassName(String className) {
            this.className = className;
        }

        public int getHeadcount() {
            return headcount;
        }

        public void setHeadcount(int headcount) {
            this.headcount = headcount;
        }

        public int getClassStatus() {
            return classStatus;
        }

        public void setClassStatus(int classStatus) {
            this.classStatus = classStatus;
        }
    }

