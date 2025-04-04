package com.example.dto;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Table {
    private int tableID;
    private int tableNumber;
    private int capacity;
    private String location;
    private String status;

    // Constructor
    public Table(int tableID, int tableNumber, int capacity, String location, String status) {
        this.tableID = tableID;
        this.tableNumber = tableNumber;
        this.capacity = capacity;
        this.location = location;
        this.status = status;
    }

    // Getters & Setters
    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public int getTableNumber() {
        return tableNumber;
    }

    public void setTableNumber(int tableNumber) {
        this.tableNumber = tableNumber;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    // toString() để hiển thị dữ liệu dễ dàng
    @Override
    public String toString() {
        return "Table{" +
                "tableID=" + tableID +
                ", tableNumber=" + tableNumber +
                ", capacity=" + capacity +
                ", location='" + location + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
