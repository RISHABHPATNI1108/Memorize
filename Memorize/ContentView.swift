//
//  ContentView.swift
//  Memorize
//
//  Created by RISHABH PATNI on 18/02/22.
//

import SwiftUI

struct ContentView: View {
    
    enum EmoticonType {
        case tracel, flags, animals
    }
    
    @State var emojiType = EmoticonType.tracel
    
    var travelEmojis = [
        "🚘" , "🛺" , "🏎" , "🚌", "🚀" , "⛴", "🚖", "🚛", "🚗", "🚜", "🚎", "🚕", "🚙", "🚑", "🚓", "🚒", "🚐", "🛻", "🚚" , "🛵", "🚊", "🚤", "🛩"
    ]
    
    var animalEmojis = [
        "🐶" , "🐱" , "🐭", "🐹" , "🐰" , "🦊" , "🐻", "🐼", "🐻‍❄️" , "🐨" , "🐯" , "🦁" , "🐮" , "🐷" , "🐽" , "🐸" , "🐒"
    ]
    
    var flagsEmoji = [
        "🏳️" , "🏴" , "🏴‍☠️" , "🏁" , "🚩" , "🏳️‍🌈" , "🏳️‍⚧️" , "🇺🇳", "🇦🇫" , "🇦🇽" , "🇦🇱" , "🇩🇿" , "🇦🇸" , "🇦🇩" , "🇦🇴" , "🇦🇮" , "🇦🇶" , "🇦🇬" , "🇦🇷" , "🇦🇲" , "🇮🇳" , "🇬🇪" , "🇨🇦"
    ]
    
    @State var selectedEmojis: [String] = [
        "🚘" , "🛺" , "🏎" , "🚌", "🚀" , "⛴", "🚖", "🚛", "🚗", "🚜", "🚎", "🚕", "🚙", "🚑", "🚓", "🚒", "🚐", "🛻", "🚚" , "🛵", "🚊", "🚤", "🛩"
    ]
    
    var body: some View {
        
        VStack {
            
            Text("Memorize").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 95))]) {
                    ForEach(selectedEmojis, id: \.self ,content: {
                        emoji in
                        MemoryCard(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }.foregroundColor(.red)
            
            Spacer()
            
            HStack {
                Spacer()
                vehicles
                Spacer()
                animalss
                Spacer()
                flags
                Spacer()
            }.padding(.all)
            
        }
        .padding(.horizontal)
        
    }
    
    var vehicles: some View {
        Button( action: {
            selectedEmojis = travelEmojis.shuffled()
            emojiType = EmoticonType.tracel
        }, label: {
            if emojiType == EmoticonType.tracel {
                VStack {
                    Image(systemName: "car.fill")
                    Text("Vehicles").font(.caption)
                }.foregroundColor(.orange)
            } else {
                VStack {
                    Image(systemName: "car.fill")
                    Text("Vehicles").font(.caption)
                }
            }
        })
    }
    
    var animalss: some View {
        Button( action: {
            selectedEmojis = animalEmojis.shuffled()
            emojiType = EmoticonType.animals
        }, label: {
            if emojiType == EmoticonType.animals {
                VStack {
                    Image(systemName: "ant.fill")
                    Text("Animals").font(.caption)
                }.foregroundColor(.orange)
            } else {
                VStack {
                    Image(systemName: "ant.fill")
                    Text("Animals").font(.caption)
                }
            }
        })
    }
    
    var flags: some View {
        Button( action: {
            selectedEmojis = flagsEmoji.shuffled()
            emojiType = EmoticonType.flags
        }, label: {
            if emojiType == EmoticonType.flags {
                VStack {
                    Image(systemName: "flag.fill")
                    Text("Flags").font(.caption)
                }.foregroundColor(.orange)
            } else {
                VStack {
                    Image(systemName: "flag.fill")
                    Text("Flags").font(.caption)
                }
            }
        })
    }
    
}

struct MemoryCard: View {
    
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let roundedRect = RoundedRectangle(cornerRadius: 25.0)
            
            if isFaceUp {
                roundedRect.fill().foregroundColor(.white)
                roundedRect.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                roundedRect.fill()
            }
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().preferredColorScheme(.dark)
    }
}
