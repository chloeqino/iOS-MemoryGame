//
//  ContentView.swift
//  Memorize
//
//  Created by Chloe Chen on 3/26/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
   
    var body: some View {
        //        return Text("Hello, IOS")
        //            .fontWeight(.bold)
        //            .foregroundColor(Color.pink)
        //            .padding()
        VStack {
            Text("Memorize")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(viewModel.cards) {
                        card in CardView(card:card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
                
                
                
            }.foregroundColor(.pink)
            Spacer()
//            HStack{
//                remove
//                Spacer()
//                Button {
//
//
//                } label: {
//                    Text("Shuffle")
//                }
//
//                Spacer()
//                add
//            }
//            .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
//            .font(.largeTitle)
            
        }.padding(.horizontal)
        
    }
    
  
        
        
        
    
}

struct CardView:View{
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack(alignment:.center){
            let shape =  RoundedRectangle(cornerRadius: 20.0)
            
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
                
            }else{
                shape.fill()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.portrait)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}
