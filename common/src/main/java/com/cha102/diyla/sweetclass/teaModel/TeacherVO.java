package com.cha102.diyla.sweetclass.teaModel;

public class TeacherVO {

        private int teaId;
        private int empId;
        private String teaName;
        private int teaGender;
        private String teaPhone;
        private String teaIntro;
        private byte[] teaPic;
        private String teaEmail;
        private int teaStatus;

        // Default constructor
        public TeacherVO() {
        }

        // Constructor with all fields
        public TeacherVO(int teaId, int empId, String teaName, int teaGender, String teaPhone, String teaIntro,
                       byte[] teaPic, String teaEmail, int teaStatus) {
            this.teaId = teaId;
            this.empId = empId;
            this.teaName = teaName;
            this.teaGender = teaGender;
            this.teaPhone = teaPhone;
            this.teaIntro = teaIntro;
            this.teaPic = teaPic;
            this.teaEmail = teaEmail;
            this.teaStatus = teaStatus;
        }

        // Getters and Setters for all fields
        public int getTeaId() {
            return teaId;
        }

        public void setTeaId(int teaId) {
            this.teaId = teaId;
        }

        public int getEmpId() {
            return empId;
        }

        public void setEmpId(int empId) {
            this.empId = empId;
        }

        public String getTeaName() {
            return teaName;
        }

        public void setTeaName(String teaName) {
            this.teaName = teaName;
        }

        public int getTeaGender() {
            return teaGender;
        }

        public void setTeaGender(int teaGender) {
            this.teaGender = teaGender;
        }

        public String getTeaPhone() {
            return teaPhone;
        }

        public void setTeaPhone(String teaPhone) {
            this.teaPhone = teaPhone;
        }

        public String getTeaIntro() {
            return teaIntro;
        }

        public void setTeaIntro(String teaIntro) {
            this.teaIntro = teaIntro;
        }

        public byte[] getTeaPic() {
            return teaPic;
        }

        public void setTeaPic(byte[] teaPic) {
            this.teaPic = teaPic;
        }

        public String getTeaEmail() {
            return teaEmail;
        }

        public void setTeaEmail(String teaEmail) {
            this.teaEmail = teaEmail;
        }

        public int getTeaStatus() {
            return teaStatus;
        }

        public void setTeaStatus(int teaStatus) {
            this.teaStatus = teaStatus;
        }


}
