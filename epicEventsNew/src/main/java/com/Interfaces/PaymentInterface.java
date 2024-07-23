package com.Interfaces;

import java.sql.SQLException;
import java.util.List;

import com.model.payment.Payment;
import com.model.payment.PaymentDetails;
import com.model.payment.UserPaymentData;
import com.model.services.Services;

public interface PaymentInterface {
	
	public int addPayment(Payment pay) throws ClassNotFoundException;
	
	public List<UserPaymentData> getUserPayments() throws SQLException;
	
	public int deletePayment(UserPaymentData delPay) throws ClassNotFoundException;
	
	public List<PaymentDetails> getUserPaymentsDetails();
	
	public int updatePayment(PaymentDetails upPay) throws ClassNotFoundException;
	
	public List<Services> viewServices() throws ClassNotFoundException;
	
}
