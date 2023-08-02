//
//  PaymentInfo.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.04.2023.
//

import SwiftUI

struct PaymentInfo: View {
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    @ObservedObject private var vm = UserManager()
    @Environment(\.presentationMode) var presentationMode
    
    @State var cardNumber: String = ""
    @State var cardDate: String = ""
    @State var cardCode: String = ""
    
    @State private var showAlert = false
    @State private var showEmptyFieldsAlert = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading){
                HStack{
                    Text("Payment Info")
                        .font(.title.bold())
                    Spacer()
                    Image(systemName: "lock")
                        .font(.system(size: 20))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 24)
                
                Form {
                    Section(header: Text("Card Number").foregroundColor(self.scheme == .dark ? .white : .black)) {
                        TextField("Enter your card number", text: $cardNumber)
                    }
                    
                    Section(header: Text("Card Due Date").foregroundColor(self.scheme == .dark ? .white : .black)) {
                        TextField("Enter your card due date", text: $cardDate)
                    }
                    
                    Section(header: Text("CVV code").foregroundColor(self.scheme == .dark ? .white : .black)) {
                        SecureField("Enter your CVV numer", text: $cardCode)
                    }
                }
                
                Button {
                    if cardNumber.isEmpty || cardDate.isEmpty || cardCode.isEmpty {
                        showEmptyFieldsAlert = true
                    } else {
                        showAlert = true
                    }
                } label: {
                    ButtonView(title: "Save", imageName: "checkmark.seal.fill", color: .blue, cornerRadius: 10, width: proxy.size.width - 100, height: 48, fontSize: 24)
                        .padding(.leading, 50)
                }
                .accentColor(.white)
                
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Processing Request"),
                    message: Text("Your request is being processed."),
                    dismissButton: .default(Text("OK"), action: dismissView)
                )
            }
            .alert(isPresented: $showEmptyFieldsAlert) {
                Alert(
                    title: Text("Incomplete Fields"),
                    message: Text("Please fill in all the fields."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .padding(.vertical, 16)
        }
    }
    
    func dismissView() {
            presentationMode.wrappedValue.dismiss()
    }
}

struct PaymentInfo_Previews: PreviewProvider {
    static var previews: some View {
        PaymentInfo().preferredColorScheme(.dark)
    }
}
