//
//  ContentView.swift
//  Triplr
//
//  Created by Marasy Phi on 30/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 0
    @State var isPresented: Bool = false
    var body: some View {
        VStack {
            Spacer()
            PagingView(selectedIndex: $selectedIndex, maxIndex: 2) {
                SplashView(image: "splash.1", title: "Connect with Tutorists", description: "Connect with people of faith locally & globally. Discover Chat & Engage")
                SplashView(image: "splash.2", title: "Discover new things", description: "Explore new things through our app. Discover initiary & other stuffs")
                SplashView(image: "splash.3", title: "Share your moments", description: "Share your trip initiary with others. Let's make the travel fun & enjoyable")
            }
            Spacer()
            HStack {
                PageControlView(selectedIndex: $selectedIndex, maxIndex: 2)
                Spacer()
                Button(action: {
                    if selectedIndex == 2 {
                        isPresented.toggle()
                        return
                    }
                    selectedIndex += 1
                }) {
                    Image(systemName: selectedIndex == 2 ? "checkmark" : "arrow.right")
                        .foregroundColor(.white)
                }
                .frame(width: 48, height: 48, alignment: .center)
                .background(Color.primaryColor)
                .clipShape(Circle())
                .fullScreenCover(isPresented: $isPresented, content: {
                    MasterView()
                })
            }
            .padding()
        }
    }
}

struct SplashView: View {
    
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Image(image)
                .frame(maxWidth: .infinity)
            VStack(alignment: .leading, spacing: 14) {
                Text(title)
                    .font(.primary(.bold, size: 28))
                    .foregroundColor(.darkText)
                Text(description)
                    .font(.primary(.regular))
                    .foregroundColor(.lightText)
                    .lineSpacing(5)
                    .padding(.trailing, 50)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
    
}

struct PageControlView : View {
    
    @Binding var selectedIndex: Int
    let maxIndex: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                RoundedRectangle(cornerRadius: 8)
                    .fill(selectedIndex == index ? Color.primaryColor : .secondaryColor)
                    .frame(width: 10, height: 2)
            }
        }
    }
    
}

struct PagingView<Content>: View where Content: View {
    
    @Binding var selectedIndex: Int
    let maxIndex: Int
    let content: () -> Content
    
    @State private var _offset: CGFloat = .zero
    @State private var _isDragging = false
    
    init(selectedIndex: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping() -> Content) {
        self._selectedIndex = selectedIndex
        self.maxIndex = maxIndex
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    self.content()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
            }
            .content.offset(x: self.offset(in: geometry), y: 0)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                DragGesture().onChanged { value in
                    _isDragging = true
                    _offset = -CGFloat(self.selectedIndex) * geometry.size.width + value.translation.width
                }
                .onEnded { value in
                    let predictedEndOffset = -CGFloat(self.selectedIndex) * geometry.size.width + value.predictedEndTranslation.width
                    let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                    self.selectedIndex = clampedIndex(from: predictedIndex)
                    withAnimation(.easeOut) {
                        _isDragging = false
                    }
                }
            )
        }
        .clipped()
    }
    
    func offset(in geometry: GeometryProxy) -> CGFloat {
        if _isDragging {
            return max(min(self._offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        }
        return -CGFloat(self.selectedIndex) * geometry.size.width
    }
    
    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.selectedIndex - 1), self.selectedIndex + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
