package com.example.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;

public class ReservationRequest implements Serializable {

    @JsonProperty("Cus_FullName")  // Ánh xạ trường JSON 'Cus_FullName' với thuộc tính 'cusFullName'
    private String Cus_FullName;

    @JsonProperty("Cus_Phone")  // Ánh xạ trường JSON 'Cus_Phone' với thuộc tính 'cusPhone'
    private String Cus_Phone;

    @JsonProperty("ArrivalTime")  // Ánh xạ trường JSON 'ArrivalTime' với thuộc tính 'arrivalTime'
    private String ArrivalTime;

    @JsonProperty("NumAdults")  // Ánh xạ trường JSON 'NumAdults' với thuộc tính 'numAdults'
    private String NumAdults;

    @JsonProperty("NumChildren")  // Ánh xạ trường JSON 'NumChildren' với thuộc tính 'numChildren'
    private String NumChildren;

    @JsonProperty("Note")  // Ánh xạ trường JSON 'Note' với thuộc tính 'note'
    private String Note;

    // Getters và Setters
    public String getCus_FullName() {
        return Cus_FullName;
    }

    public void setCus_FullName(String cusFullName) {
        this.Cus_FullName = cusFullName;
    }

    public String getCus_Phone() {
        return Cus_Phone;
    }

    public void setCus_Phone(String cusPhone) {
        this.Cus_Phone = cusPhone;
    }

    public String getArrivalTime() {
        return ArrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.ArrivalTime = arrivalTime;
    }

    public String getNumAdults() {
        return NumAdults;
    }

    public void setNumAdults(String numAdults) {
        this.NumAdults = numAdults;
    }

    public String getNumChildren() {
        return NumChildren;
    }

    public void setNumChildren(String numChildren) {
        this.NumChildren = numChildren;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String note) {
        this.Note = note;
    }

    // toString() để dễ debug
    @Override
    public String toString() {
        return "ReservationRequest{"
                + "cusFullName='" + Cus_FullName + '\''
                + ", cusPhone='" + Cus_Phone + '\''
                + ", arrivalTime='" + ArrivalTime + '\''
                + ", numAdults='" + NumAdults + '\''
                + ", numChildren='" + NumChildren + '\''
                + ", note='" + Note + '\''
                + '}';
    }
}
