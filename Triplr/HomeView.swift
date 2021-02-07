//
//  HomeView.swift
//  Triplr
//
//  Created by Marasy Phi on 7/2/21.
//

import SwiftUI

struct HomeView: View {
    
    var leadingTitle: some View {
        Text("Triplr")
            .font(.primary(.semiBold, size: 18))
            .foregroundColor(.darkText)
    }
    
    init() {
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .darkText
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        VStack {
            StoryView()
                .padding(.top)
                .padding(.bottom)
            
            ScrollView {
                ForEach(Trip.dummies) { eachTrip in
                    NavigationLink(destination: Color.primary) {
                        TripContentView(trip: eachTrip)
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: leadingTitle, trailing: Image(systemName: "bell"))
    }
    
}

struct StoryView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                VStack(spacing: 12) {
                    Image(systemName: "plus")
                        .frame(width: 58, height: 58)
                        .background(Color.secondaryColor)
                        .clipShape(Circle())
                    
                    Text("Your Story")
                        .font(.primary(.medium, size: 13))
                }
                
                ForEach(Story.dummies) { eachStory in
                    VStack(spacing: 12) {
                        Image(eachStory.user.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 58, height: 58)
                            .clipShape(Circle())
                        Text(eachStory.user.name)
                            .font(.primary(.medium, size: 13))
                    }
                    .onTapGesture {
                        // View Story
                    }
                }
              
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
    
}

struct TripContentView: View {
    
    let trip: Trip
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 14) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.primaryColor)
                    .cornerRadius(20)
                
                Text(trip.title)
                    .font(.primary(.semiBold, size: 16))
                    .foregroundColor(.darkText)
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            Divider()
                .background(Color.lightGrey)
                .padding(.trailing)
                .padding(.leading)
            
            HStack {
                Image(trip.user.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 58, height: 58)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 8) {
                    Text(trip.user.name)
                        .font(.primary(.semiBold))
                        .foregroundColor(.darkText)
                    Text(trip.user.address)
                        .font(.primary(.medium, size: 13))
                        .foregroundColor(.lightText)
                }
                
            }
            .padding()
            
            HStack {
                Image(systemName: "bell")
                Text("Playing")
                    .font(.primary(.medium))
            }
            .foregroundColor(.primaryColor)
            .padding(8)
            .background(Color.primaryColor.opacity(0.1))
            .cornerRadius(16)
            .padding(.leading)
            
            if trip.images.count >= 3 {
                CollageView(images: trip.images)
            } else {
                ForEach(trip.images, id: \.self) { eachIamge in
                    Image(eachIamge)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.leading)
                        .padding(.trailing)
                }
            }
            
            
            Text(trip.description)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.darkText)
                .lineSpacing(10.0)
                .font(.primary(.medium))
                .padding()
            
            HStack(spacing: 32) {
                Button(action: { }) {
                    HStack {
                        Image(systemName: "heart")
                        Text(trip.heartCount.description)
                            .font(.primary(.regular))
                    }
                    .foregroundColor(.darkText)
                }
                
                Button(action: { }) {
                    HStack {
                        Image(systemName: "text.bubble")
                        Text(trip.commentCount.description)
                            .font(.primary(.regular))
                    }
                    .foregroundColor(.darkText)
                }
                Spacer()
                ZStack {
                    Image("suzy")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 26, height: 26)
                        .clipShape(Circle())
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.white, lineWidth: 1.5))
                        .offset(x: -26, y: 0)
                    Image("rose")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 26, height: 26)
                        .clipShape(Circle())
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.white, lineWidth: 1.5))
                        .offset(x: -13, y: 0)
                    Image("iu")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 26, height: 26)
                        .clipShape(Circle())
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.white, lineWidth: 1.5))
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 3)
    }
    
}

struct CollageView: View {
    
    let images: [String]
    
    var body: some View {
        HStack {
            Image(images.first!)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.6)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack {
                Image(images[1])
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                ZStack {
                    Image(images[2])
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Color.black.opacity(0.3)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("\(images.count.description)+")
                        .foregroundColor(.white)
                        .font(.primary(.semiBold, size: 20))
                }
            }
        }
        .padding()
    }
    
}

struct HomeViewPreview: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
    
}
