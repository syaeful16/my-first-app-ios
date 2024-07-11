//
//  StoreMainView.swift
//  AShopApp
//
//  Created by Syaefulloh Arnas on 27/06/24.
//

import SwiftUI

struct StoreMainView: View {
    @State private var productList: [Product] = []
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(productList, id: \.id) { product in
                            NavigationLink(value: product) {
                                ProductItemView(productList: product)
                            }
                        }
                    }
                    .padding()
                    .navigationDestination(for: Product.self) { product in
                        DetailProductView(productData: product)
                            .toolbar(.hidden, for: .tabBar)
                    }
                }
            }
        }
        .task {
            await loadData()
        }
        .alert(isPresented: Binding<Bool>(
            get: { errorMessage != nil },
            set: { if !$0 { errorMessage = nil } }
        )) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage ?? ""),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    private func loadData() async {
        do {
            let products = try await ProductData.shared.fetchData()
            self.productList = products
            print("Product List in View: \(products)")
        } catch {
            self.errorMessage = error.localizedDescription
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(alignment: .center) {
            HStack(spacing: 4) {
                Image(systemName: "shekelsign.square.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .bgSplash)
                Text("AShop")
            }
            .font(.title)
            Spacer()
            HStack(spacing: 15){
                Image(systemName: "cart")
                Image(systemName: "bell")
                Image(.img1)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .font(.title3)
        }
        .padding(15)
    }
}

#Preview {
    StoreMainView()
}
