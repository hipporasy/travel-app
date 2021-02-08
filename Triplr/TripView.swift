//
//  TripView.swift
//  Triplr
//
//  Created by Marasy Phi on 8/2/21.
//

import SwiftUI

struct TripView: View {
    
    @Environment(\.presentationMode) var presentedMode: Binding<PresentationMode>
    
    @State var selectedIndex: Int = 0
    
    var leadingButton: some View {
        
        Button(action: {
            presentedMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.darkText)
        }
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("My Thailand Trip")
                .font(.primary(.bold, size: 28))
                .foregroundColor(.darkText)
            Text("My Thailand Trip")
                .font(.primary(.medium))
                .foregroundColor(.lightText)
            
            PagerView(dataSource: ["Activities", "Photo"], selectedIndex: $selectedIndex)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    DateView(date: "03 May 2020")
                    ActivityView(type: .flight, time: "04:09 PM", place: "Lisbon Portle Airport \n - Lajes Airport")
                    ActivityView(type: .car, time: "06:33 AM", place: "Lisbon Portle Airport \n - Lajes Airport")
                    ArrivalView(image: "collage.1", star: "5.0", place: "Lisbon Portle Airport \n - Lajes Airport")
                    DateView(date: "04 May 2020")
                    ActivityView(type: .sleep, time: "04:09 PM", place: "Lisbon Portle Airport \n - Lajes Airport")
                    ArrivalView(image: "collage.3", star: "5.0", place: "Lisbon Portle Airport \n - Lajes Airport")
                    ActivityView(type: .eating, time: "06:33 AM", place: "Lisbon Portle Airport \n - Lajes Airport")
                    ArrivalView(image: "collage.2", star: "5.0", place: "Lisbon Portle Airport \n - Lajes Airport")
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: leadingButton)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

struct ArrivalView: View {
    
    let image: String
    let star: String
    let place: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 100)
                .clipShape(RoundedCorner(radius: 12, corners: [.bottomLeft, .topLeft]))
            Spacer()
                .frame(width: 20, alignment: .center)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(star)
                        .foregroundColor(.primaryColor)
                        .font(.primary(.medium))
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                
                Text(place)
                    .font(.primary(.regular, size: 12))
                    .foregroundColor(.darkText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineSpacing(4)

            }
        }
        .background(Color.primaryLight)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
}

struct ActivityView: View {
    
    enum `Type`: String {
        case flight, car, sleep, eating
        
        var image: String {
            return "ic.\(rawValue)"
        }
    }
    let type: Type
    let time: String
    let place: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Text(time)
                .font(.primary(.semiBold, size: 13))
                .frame(width: 65, height: 40, alignment: .center)
                .padding(.leading, 4)
            Image(type.image)
                .resizable()
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(type.rawValue.capitalized)
                    .font(.primary(.medium))
                    .foregroundColor(.primaryColor)
                Text(place)
                    .lineSpacing(4)
                    .font(.primary(.regular, size: 12))
                    .foregroundColor(.darkText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(8)
            .background(Color.primaryLight)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
}

struct DateView: View {
    
    let date: String
    
    var body: some View {
        HStack {
            Image(systemName: "calendar")
            Text(date)
                .font(.primary(.medium))
        }
        .foregroundColor(.primaryColor)
        .padding(8)
        .background(Color.primaryLight)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}

struct PagerView : View {

    let dataSource: [String]
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            ForEach(dataSource.indices, id: \.self) { index in
                VStack {
                    Text(dataSource[index])
                        .foregroundColor(index == selectedIndex ? .primaryColor : .darkText)
                    (index == selectedIndex ? Color.primaryColor : .clear)
                        .frame(width: 20, height: 2, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .onTapGesture {
                    selectedIndex = index
                }
                .frame(maxWidth: .infinity)
                
            }
        }
        .padding(.top)
        .padding(.bottom)
    }
    
}

struct TripViewPreview: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            TripView()
        }
    }
    
}
