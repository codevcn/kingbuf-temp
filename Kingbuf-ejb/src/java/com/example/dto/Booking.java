package com.example.dto;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Date;
import java.util.List;

public class Booking {

    private int reservationID;
    private String cusFullName;
    private String cusPhone;
    private Date arrivalTime;
    private Date createdAt;
    private int numAdults;
    private int numChildren;
    private String note;
    private String status;
    private String reason;
    private List<Table> tablesList;

    public Booking(int reservationID, String cusFullName, String cusPhone, Date arrivalTime, Date createdAt, int numAdults, int numChildren, String note, String reason, String status, List<Table> tablesList) {
        this.reservationID = reservationID;
        this.cusFullName = cusFullName;
        this.cusPhone = cusPhone;
        this.arrivalTime = arrivalTime;
        this.createdAt = createdAt;
        this.numAdults = numAdults;
        this.numChildren = numChildren;
        this.note = note;
        this.reason = reason;
        this.status = status;
        this.tablesList = tablesList;
    }

    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public String getCusFullName() {
        return cusFullName;
    }

    public void setCusFullName(String cusFullName) {
        this.cusFullName = cusFullName;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public Date getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Date arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getNumAdults() {
        return numAdults;
    }

    public void setNumAdults(int numAdults) {
        this.numAdults = numAdults;
    }

    public int getNumChildren() {
        return numChildren;
    }

    public void setNumChildren(int numChildren) {
        this.numChildren = numChildren;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Table> getTablesList() {
        return tablesList;
    }

    public void setTablesList(List<Table> tablesList) {
        this.tablesList = tablesList;
    }

    public String toStringJSON() {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "{}"; // Trả về JSON rỗng nếu có lỗi
        }
    }

    @Override
    public String toString() {
        return "Booking{" + "reservationID=" + reservationID + ", cusFullName=" + cusFullName + ", cusPhone=" + cusPhone + ", arrivalTime=" + arrivalTime + ", createdAt=" + createdAt + ", numAdults=" + numAdults + ", numChildren=" + numChildren + ", note=" + note + ", status=" + status + ", reason=" + reason + ", tablesList=" + tablesList + '}';
    }
}
