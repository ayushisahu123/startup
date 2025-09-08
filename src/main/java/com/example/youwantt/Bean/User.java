package com.example.youwantt.Bean;

import org.springframework.web.multipart.MultipartFile;

public class User {
    private int id;
    private String role;
    private String name;
    private String username;
    private String password;
    private String mobileNumber;
    private String email;
    private String businessName; // ✅ yeh property exist honi chahiye
    private String confirmPassword; // added
    private String address; // added
    private String category; // added
    private MultipartFile licenseFile; // added to handle file upload

    // Getters and Setters

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getBusinessName() {
        return businessName;
    }
    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }

    public MultipartFile getLicenseFile() {
        return licenseFile;
    }
    public void setLicenseFile(MultipartFile licenseFile) {
        this.licenseFile = licenseFile;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
