package model;

public class Refund {
    private int id;
    private String referenceNo;
    private String mobileNo;
    private String refundRemarks;
    private String timestamp;
    private String status;

    // Constructors
    public Refund() {}

    public Refund(String referenceNo, String mobileNo, String refundRemarks, String status) {
        this.referenceNo = referenceNo;
        this.mobileNo = mobileNo;
        this.refundRemarks = refundRemarks;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getReferenceNo() { return referenceNo; }
    public void setReferenceNo(String referenceNo) { this.referenceNo = referenceNo; }
    public String getMobileNo() { return mobileNo; }
    public void setMobileNo(String mobileNo) { this.mobileNo = mobileNo; }
    public String getRefundRemarks() { return refundRemarks; }
    public void setRefundRemarks(String refundRemarks) { this.refundRemarks = refundRemarks; }
    public String getTimestamp() { return timestamp; }
    public void setTimestamp(String timestamp) { this.timestamp = timestamp; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}