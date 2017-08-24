package com.highjump.epareport.beans;

public class Unit extends BaseModel {

    private String name;
    private String number;
    private String contact;

    public String getName() {
        return name;
    }

    public String getNumber() {
        return number;
    }

    public String getContact() {
        return contact;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
}
