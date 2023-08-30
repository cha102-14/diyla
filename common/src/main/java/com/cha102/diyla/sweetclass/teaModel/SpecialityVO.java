package com.cha102.diyla.sweetclass.teaModel;

public class SpecialityVO {


        private int speId;
        private String speName;

        // Default constructor
        public SpecialityVO() {
        }

        // Constructor with all fields
        public SpecialityVO(int speId, String speName) {
            this.speId = speId;
            this.speName = speName;
        }

        // Getters and Setters for all fields
        public int getSpeId() {
            return speId;
        }

        public void setSpeId(int speId) {
            this.speId = speId;
        }

        public String getSpeName() {
            return speName;
        }

        public void setSpeName(String speName) {
            this.speName = speName;
        }

}
