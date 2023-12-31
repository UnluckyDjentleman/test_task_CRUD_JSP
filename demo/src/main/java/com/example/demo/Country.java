package com.example.demo;

public class Country {
    public String country_id;
    public String country_name;
    public String country_flag;

    public Country() {
    }

    public Country(String country_id, String country_name, String country_flag) {
        this.country_id = country_id;
        this.country_name = country_name;
        this.country_flag = country_flag;
    }

    public String getCountry_id() {
        return country_id;
    }

    public void setCountry_id(String country_id) {
        this.country_id = country_id;
    }

    public String getCountry_name() {
        return country_name;
    }

    public void setCountry_name(String country_name) {
        this.country_name = country_name;
    }

    public String getCountry_flag() {
        return country_flag;
    }

    public void setCountry_flag(String country_flag) {
        this.country_flag = country_flag;
    }
}
