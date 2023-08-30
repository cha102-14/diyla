package com.cha102.diyla.sweetclass.teaModel;

public class TeaSpecialityVO {

        private int teaId;
        private int speId;

        // Default constructor
        public TeaSpecialityVO() {
        }

        // Constructor with all fields
        public TeaSpecialityVO(int teaId, int speId) {
            this.teaId = teaId;
            this.speId = speId;
        }

        // Getters and Setters for all fields
        public int getTeaId() {
            return teaId;
        }

        public void setTeaId(int teaId) {
            this.teaId = teaId;
        }

        public int getSpeId() {
            return speId;
        }

        public void setSpeId(int speId) {
            this.speId = speId;
        }

}
