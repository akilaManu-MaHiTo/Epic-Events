package com.model;

public class SessionManager {

	   private static int usersID;
	   private static int detailsID;
	   private static double paymentPrice;

	   
	    /**
	 * @return the detailsID
	 */
	public static int getDetailsID() {
		return detailsID;
	}

	/**
		 * @return the paymentPrice
		 */
		public static double getPaymentPrice() {
			return paymentPrice;
		}

		/**
		 * @param paymentPrice the paymentPrice to set
		 */
		public static void setPaymentPrice(double paymentPrice) {
			SessionManager.paymentPrice = paymentPrice;
		}

	/**
	 * @param detailsID the detailsID to set
	 */
	public static void setDetailsID(int detailsID) {
		SessionManager.detailsID = detailsID;
	}

		public static int getUsersID() {
	        return usersID;
	    }

	    public static void setUsersID(int usersID) {
	        SessionManager.usersID = usersID;
	    }
}

