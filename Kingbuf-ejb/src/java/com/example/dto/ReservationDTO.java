package com.example.dto;

import java.time.LocalDateTime;
import java.util.List;

public class ReservationDTO {
    private Integer reservationID;
    private String cusFullName;
    private String cusPhone;
    private LocalDateTime arrivalTime;
    private LocalDateTime createdAt;
    private Integer numAdults;
    private Integer numChildren;
    private String note;
    private String status;
    private List<TableDTO> tablesList;

    public static class TableDTO {
        private String tableNumber;

        public TableDTO(String tableNumber) { this.tableNumber = tableNumber; }
        public String getTableNumber() { return tableNumber; }
        public void setTableNumber(String tableNumber) { this.tableNumber = tableNumber; }
    }

    // Getters và Setters
    public Integer getReservationID() { return reservationID; }
    public void setReservationID(Integer reservationID) { this.reservationID = reservationID; }
    public String getCusFullName() { return cusFullName; }
    public void setCusFullName(String cusFullName) { this.cusFullName = cusFullName; }
    public String getCusPhone() { return cusPhone; }
    public void setCusPhone(String cusPhone) { this.cusPhone = cusPhone; }
    public LocalDateTime getArrivalTime() { return arrivalTime; }
    public void setArrivalTime(LocalDateTime arrivalTime) { this.arrivalTime = arrivalTime; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public Integer getNumAdults() { return numAdults; }
    public void setNumAdults(Integer numAdults) { this.numAdults = numAdults; }
    public Integer getNumChildren() { return numChildren; }
    public void setNumChildren(Integer numChildren) { this.numChildren = numChildren; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public List<TableDTO> getTablesList() { return tablesList; }
    public void setTablesList(List<TableDTO> tablesList) { this.tablesList = tablesList; }
}