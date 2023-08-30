package com.cha102.diyla.sweetclass.ingModel;

public class IngStorageVO {

        private int ingId;
        private String brand;
        private int ingNums;
        private String ingName;
        private int status;
        private int servingSize;

        // Default constructor
        public IngStorageVO() {
        }

        // Constructor with all fields
        public IngStorageVO(int ingId, String brand, int ingNums, String ingName, int status, int servingSize) {
            this.ingId = ingId;
            this.brand = brand;
            this.ingNums = ingNums;
            this.ingName = ingName;
            this.status = status;
            this.servingSize = servingSize;
        }

        // Getters and Setters for all fields
        public int getIngId() {
            return ingId;
        }

        public void setIngId(int ingId) {
            this.ingId = ingId;
        }

        public String getBrand() {
            return brand;
        }

        public void setBrand(String brand) {
            this.brand = brand;
        }

        public int getIngNums() {
            return ingNums;
        }

        public void setIngNums(int ingNums) {
            this.ingNums = ingNums;
        }

        public String getIngName() {
            return ingName;
        }

        public void setIngName(String ingName) {
            this.ingName = ingName;
        }

        public int getStatus() {
            return status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

        public int getServingSize() {
            return servingSize;
        }

        public void setServingSize(int servingSize) {
            this.servingSize = servingSize;
        }

}
