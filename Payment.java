
package com.learn.mycart1.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "payment")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String paymentMethodType;
    private String cardNumber;
    private String expirationDate;
    private String securityCode;

 
    
   //constructor
    public Payment(int id, String paymentMethodType, String cardNumber, String expirationDate, String securityCode) {
        this.id = id;
        this.paymentMethodType = paymentMethodType;
        this.cardNumber = cardNumber;
        this.expirationDate = expirationDate;
        this.securityCode = securityCode;
        
    }

    public Payment(String paymentMethodType, String cardNumber, String expirationDate, String securityCode) {
        this.paymentMethodType = paymentMethodType;
        this.cardNumber = cardNumber;
        this.expirationDate = expirationDate;
        this.securityCode = securityCode;
    }

    public Payment() {
    }
    

    // getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPaymentMethodType() {
        return paymentMethodType;
    }

    public void setPaymentMethodType(String paymentMethodType) {
        this.paymentMethodType = paymentMethodType;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getSecurityCode() {
        return securityCode;
    }

    public void setSecurityCode(String securityCode) {
        this.securityCode = securityCode;
    }

    
    

    @Override
    public String toString() {
        return "Payment{" + "id=" + id + ", paymentMethodType=" + paymentMethodType + ", cardNumber=" + cardNumber + ", expirationDate=" + expirationDate + ", securityCode=" + securityCode + '}';
    }
    
    
    
 
}

