//
//  Home.swift
//  WelcomScreen
//
//  Created by 张亚飞 on 2021/6/15.
//

import SwiftUI

struct Home: View {
    
    @State var currentIndex: Int = 1
    
    var body: some View {
        
        VStack{
            
            //Custom Page Tab Bar...
            //Or Carousel Slider...
            TabView(selection: $currentIndex) {
                
                ForEach(1...3, id: \.self) { index in
                    
                    GeometryReader { proxy -> AnyView in
                        
                        let minX = proxy.frame(in: .global).minX
                        let width = UIScreen.main.bounds.width
                        let progress = -minX / (width * 2)
                        var scale = progress > 0 ? 1 - progress : 1 + progress
                        
                        scale = scale < 0.7 ? 0.7 : scale
                        
                        print(scale)
                         return AnyView (
                            
                            VStack {
                                
                                Image("p\(index + 11)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 20)
                                    .frame(maxHeight: .infinity, alignment: .center)
                                    
                                    
                                
                                Text("Pet Adoption")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                                
                                Text("Instance method 'tableStyle' requires that 'PageTabViewStyle' conform to 'TableStyle'")
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                
                            }
                                .frame(maxHeight: .infinity, alignment: .center)
                                .scaleEffect(scale)
                         )
                        
                    }
                    .tag(index)
                }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Custom Tab Indicator
            CustomTabIndicatorVie(count: 3, current: $currentIndex)
                .padding(.vertical)
                .padding(.top)
            
            
            //login buttons
            VStack(spacing: 15){
                
                Button {
                    
                } label: {
                    
                    HStack {
                        
                        Image(systemName: "applelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                        
                        Text("Sign up with Apple")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.vertical, 13)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    )
                }
                
                Button {
                    
                } label: {
                    
                    HStack {
                        
                        Image(systemName: "network")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                        Text("Sign up with google")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.vertical, 13)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    )
                }
                
                Button {
                    
                } label: {
                    
                    HStack {
                        
                        Image(systemName: "envelope")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                        Text("Sign up with email")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.vertical, 13)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    )
                }
                
                HStack{
                    
                    Text("Already have an account?")
                        .foregroundColor(.white)
                    
                    Button {
                        
                    } label: {
                        
                        Text("login")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .underline(true, color: Color.white)
                    }

                }
                .padding(.top, 30)

            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg").ignoresSafeArea())
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct CustomTabIndicatorVie: View {
    
    var count: Int
    @Binding var current: Int
    
    var body: some View {
        
        HStack {
            
            ForEach(0..<count, id: \.self) { index in
                
                ZStack {
                    
                    if (current - 1) == index {
                        
                        Circle()
                            .fill(Color.black)
                    }
                    else {
                        
                        Circle()
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1.5)
                            )
                    }
                    
                }
                .frame(width: 10, height: 10)
            }
        }
    }
}
