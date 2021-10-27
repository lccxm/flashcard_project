//
//  HomeView.swift
//  FlashCards
//
//  Created by Willian Magnum Albeche on 26/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var sortKey = 0
    
    var options = ["Last Seen", "Hardest","Alphabet","Biggest"]
    var body: some View {
        
        VStack {
            VStack{
                    HStack{
                        Text("Your FlashCards Decks")
                            .font(.title)
                            .bold()
                            .padding(.leading)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Sort by: ")
                        Picker("Sort by", selection: $sortKey) {
                            ForEach(0..<options.count) {
                                Text(self.options[$0])
                                    .foregroundColor(.black)
                            }
                            
                        }
                        .padding(.horizontal, 3)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.012, brightness: 0.869)/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                        .cornerRadius(5)
                        .pickerStyle(MenuPickerStyle())
                        
                        Spacer()
                        Button("See all"){
                            print("Print tudo")
                        }
                        .padding(.trailing)
                    }
                    .padding(.leading)
                ScrollView(.horizontal) {
                    HStack(){
                        
                            VStack(){
                                
                                Button {
                                    print("new card")
                                } label: {
                                    ZStack {
                                        Image("buttonNewCard")
                                        HStack {
                                            Image(systemName:"plus")
                                                .resizable()
                                                .foregroundColor(Color.black)
                                                .scaledToFit()
                                                .frame(width: 25, height: 25)
                                            
                                            Text("New \n Card")
                                                .font(.system(size: 16.0))
                                                .fontWeight(.bold)
                                                .lineLimit(2)
                                                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                        }
                                    }
                                }
            
                                Button {
                                    print("new deck")
                                } label : {
                                    ZStack {
                                        Image("buttonNewDeck")
                                        HStack(alignment: .center, spacing: 0.0) {
                                            Text("New \n Deck")
                                                .font(.system(size: 16.0))
                                                .fontWeight(.bold)
                                                .lineLimit(2)
                                                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                            
                                            Image(systemName:"plus")
                                                .resizable()
                                                .foregroundColor(Color.black)
                                                .scaledToFit()
                                                .frame(width: 25, height: 25)
                                            
                                        }
                                        .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y:  -10)
                                    }
                                }
                            }
                            .padding(-2.0)
                        
                            HStack(){
                                ForEach(0..<10){ i in
                                    EmptyView()
                                    Button {
                                        //action
                                    } label: {
                                        ZStack {
                                            //Image("AllDecksDeckBackground")
                                            //    .padding(.top, UIScreen.main.bounds.height * 0.1)
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(Color.red)
                                                .frame(width: UIScreen.main.bounds.width * 0.270, height: UIScreen.main.bounds.height * 0.2)
                                                .shadow(radius: 10)
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(Color.blue)
                                                .frame(width: UIScreen.main.bounds.width * 0.285, height: UIScreen.main.bounds.height * 0.2)
                                                .padding(.bottom, UIScreen.main.bounds.height * 0.015)
                                                .shadow(radius: 10)
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(Color.green)
                                                .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.2)
                                                .padding(.bottom, UIScreen.main.bounds.height * 0.030)
                                                .shadow(radius: 10)
                                            VStack {
                                                Text("+")
                                                    .font(.title)
                                                Text("Algum deck")
                                            }
                                            .padding(.bottom, UIScreen.main.bounds.height * 0.030)
                                            .foregroundColor(Color.black)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.25)
                                }
                            }
                            .background(Color.red)
                        }
                    }
                    
                    
            }.background(Color(hue: 0.739, saturation: 0.422, brightness: 0.585))
            Divider()
                .frame(height: 10)
            VStack{
                Text("Carrosel")
            }
        }
            
  
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
