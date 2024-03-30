//
//  ProfilePaymentsView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-18.
//
import SwiftUI

struct ProfilePaymentsView: View {
    @State private var isCardSelected = true
    @State private var showPaymentSuccessAlert = false
    @State private var showPaymentErrorAlert = false
    
    @State private var cardNumber = ""
    @State private var expiryMonth = ""
    @State private var expiryYear = ""
    @State private var cvv = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    isCardSelected.toggle()
                }) {
                    Text(isCardSelected ? "Credit Card" : "Select Credit Card")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isCardSelected ? Color("PrimaryColor") : Color.gray.opacity(0.8))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Button(action: {
                    isCardSelected.toggle()
                }) {
                    Text(isCardSelected ? "Cash on Delivery" : "Cash")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isCardSelected ? Color.gray.opacity(0.8) : Color("SecondaryColor"))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            
            if isCardSelected {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Card Number")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("**** **** **** ****", text: $cardNumber)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                        .padding(.horizontal)
                    
                    HStack {
                        VStack {
                            Text("Expiry Date")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack {
                                TextField("MM", text: $expiryMonth)
                                    .keyboardType(.numberPad)
                                    .frame(width: 40)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                    .padding(.horizontal)
                                Text("/")
                                    .foregroundColor(.gray)
                                TextField("YY", text: $expiryYear)
                                    .keyboardType(.numberPad)
                                    .frame(width: 40)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                    .padding(.horizontal)
                            }
                        }
                        
                        VStack {
                            Text("CVV")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            TextField("***", text: $cvv)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Button(action: {
                if isCardSelected {
                    if cardNumber.isEmpty || expiryMonth.isEmpty || expiryYear.isEmpty || cvv.isEmpty {
                        showPaymentErrorAlert = true
                    } else {
                        showPaymentSuccessAlert = true
                    }
                } else {
                    showPaymentSuccessAlert = true
                }
            }) {
                Text(isCardSelected ? "Pay with Credit Card" : "Pay Cash on Delivery")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isCardSelected ? Color("PrimaryColor") : Color("SecondaryColor"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showPaymentSuccessAlert) {
                Alert(title: Text("Payment Successful"),
                      message: Text("Your order has been placed."),
                      dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showPaymentErrorAlert) {
                Alert(title: Text("Payment Error"),
                      message: Text("Please fill in all card details."),
                      dismissButton: .default(Text("OK")))
            }
            .padding()
            .navigationTitle("Payments")
        }
        .padding()
        .background(Color("BackgroundColor"))
        .foregroundColor(Color("TextColor"))
    }
}
