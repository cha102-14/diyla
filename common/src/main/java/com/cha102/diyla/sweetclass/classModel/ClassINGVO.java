package com.cha102.diyla.sweetclass.classModel;

public class ClassINGVO {


        private int classId;
        private int ingId;
        private int ingNums;

        // Default constructor
        public ClassINGVO() {
        }

        // Constructor with all fields
        public ClassINGVO(int classId, int ingId, int ingNums) {
            this.classId = classId;
            this.ingId = ingId;
            this.ingNums = ingNums;
        }

        // Getters and Setters for all fields
        public int getClassId() {
            return classId;
        }

        public void setClassId(int classId) {
            this.classId = classId;
        }

        public int getIngId() {
            return ingId;
        }

        public void setIngId(int ingId) {
            this.ingId = ingId;
        }

        public int getIngNums() {
            return ingNums;
        }

        public void setIngNums(int ingNums) {
            this.ingNums = ingNums;
        }
}
