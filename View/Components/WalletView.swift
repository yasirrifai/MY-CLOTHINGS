//
//  WalletView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-24.
//
import SwiftUI

class PaymentMethod: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var cardNumber: String
    var validThrough: String
    var cvv: String
    
    init(name: String, cardNumber: String, validThrough: String, cvv: String) {
        self.name = name
        self.cardNumber = cardNumber
        self.validThrough = validThrough
        self.cvv = cvv
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PaymentMethod, rhs: PaymentMethod) -> Bool {
        return lhs.id == rhs.id
    }
}

class WalletManager: ObservableObject {
    @Published var paymentMethods: [PaymentMethod] = [
        PaymentMethod(name: "Cash", cardNumber: "", validThrough: "", cvv: ""),
        PaymentMethod(name: "MY-CLOTHINGS Credits", cardNumber: "", validThrough: "", cvv: "")
    ]
    
    func addPaymentMethod(paymentMethod: PaymentMethod) {
        paymentMethods.append(paymentMethod)
    }
    
    func deletePaymentMethod(at indexSet: IndexSet) {
        paymentMethods.remove(atOffsets: indexSet)
    }
}

struct WalletView: View {
    @StateObject private var walletManager = WalletManager()
    @State private var isAddPaymentMethodSheetPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(walletManager.paymentMethods) { paymentMethod in
                        PaymentMethodRow(paymentMethod: paymentMethod)
                    }
                    .onDelete(perform: walletManager.deletePaymentMethod)
                }
                .listStyle(InsetGroupedListStyle())
                
                Button(action: {
                    isAddPaymentMethodSheetPresented = true
                }) {
                    Label("Add Payment Method", systemImage: "plus")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Wallet")
            .sheet(isPresented: $isAddPaymentMethodSheetPresented) {
                AddPaymentMethodView(walletManager: walletManager)
            }
        }
    }
}

struct PaymentMethodRow: View {
    let paymentMethod: PaymentMethod
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(paymentMethod.name)
                .font(.headline)
            if !paymentMethod.cardNumber.isEmpty {
                Text("Card Number: \(paymentMethod.cardNumber)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct AddPaymentMethodView: View {
    @ObservedObject var walletManager: WalletManager
    @State private var newPaymentMethodName = ""
    @State private var newPaymentMethodCardNumber = ""
    @State private var newPaymentMethodValidThrough = ""
    @State private var newPaymentMethodCVV = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Payment Method Details")) {
                    TextField("Name", text: $newPaymentMethodName)
                    TextField("Card Number", text: $newPaymentMethodCardNumber)
                        .keyboardType(.numberPad)
                    TextField("Valid Through", text: $newPaymentMethodValidThrough)
                    TextField("CVV", text: $newPaymentMethodCVV)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    Button(action: {
                        let newPaymentMethod = PaymentMethod(name: newPaymentMethodName,
                                                             cardNumber: newPaymentMethodCardNumber,
                                                             validThrough: newPaymentMethodValidThrough,
                                                             cvv: newPaymentMethodCVV)
                        walletManager.addPaymentMethod(paymentMethod: newPaymentMethod)
                        newPaymentMethodName = ""
                        newPaymentMethodCardNumber = ""
                        newPaymentMethodValidThrough = ""
                        newPaymentMethodCVV = ""
                    }) {
                        Text("Add Payment Method")
                    }
                }
            }
            .navigationTitle("Add Payment Method")
            .navigationBarItems(trailing: Button(action: {
                           presentationMode.wrappedValue.dismiss()
                       }) {
                           Image(systemName: "xmark")
                               .foregroundColor(.red)
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 24, height: 24)
                       })
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
