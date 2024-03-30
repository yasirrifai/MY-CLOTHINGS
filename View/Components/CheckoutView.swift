//
//  CheckoutView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-24.
//
import SwiftUI

struct CheckoutView: View {
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var cartManager: ShoppingCartViewModel

    let products: [ProductModel] 
    @StateObject var walletManager = WalletManager()
    
    @State private var selectedPaymentMethod: PaymentMethod?
    @State private var customerName = ""
    @State private var shippingAddress = ""
    @State private var isUsingMyClothingsCredit = false
    @State private var showAlert = false
    @State private var navigateToBottomNavigationBar = false

    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    Section(header: Text("Product Details")) {
                        ForEach(cartManager.products) { cartItem in
                            ProductRows(product: cartItem)
                        }
                    }
                    
                    Section(header: Text("Customer Details")) {
                        TextField("Name", text: $customerName)
                        TextField("Shipping Address", text: $shippingAddress)
                    }
                    
                    PaymentMethodSection(selectedPaymentMethod: $selectedPaymentMethod, isUsingMyClothingsCredit: $isUsingMyClothingsCredit)
                        .environmentObject(walletManager)
                }
                .listStyle(GroupedListStyle())
                .padding(.vertical)

                Button(action: {
                    showAlert = true
                    handlePayment()
                    
                    
                }) {
                    Text("Pay now")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Order Placed"), message: Text("Thank you for your purchase!"), dismissButton: .default(Text("OK")) {
                        navigateToBottomNavigationBar = true
                        mode.wrappedValue.dismiss()
                    
                    })
                }
                .padding(.horizontal)
                .padding(.bottom)
               
                

            }
            .navigationTitle("Checkout")
            .padding()
                    }
    }
    private func handlePayment() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showAlert = false
                cartManager.clearCart()
            }
        }

}

struct PaymentMethodSection: View {
    @Binding var selectedPaymentMethod: PaymentMethod?
    @Binding var isUsingMyClothingsCredit: Bool
    @EnvironmentObject var walletManager: WalletManager
    
    var body: some View {
        Section(header: Text("Payment Method")) {
            Toggle("Use MY CLOTHINGS Credits", isOn: $isUsingMyClothingsCredit)
            
            Picker("Payment Method", selection: $selectedPaymentMethod) {
                ForEach(walletManager.paymentMethods) { paymentMethod in
                    Text(paymentMethod.name).tag(paymentMethod)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .disabled(isUsingMyClothingsCredit)
        }
    }
}
