//
//  ContentView.swift
//  guessTheFlag
//
//  Created by Ajit Kawale on 21/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["India","France","Estonia","Germany","Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreTitle=""
    @State private var showingScore = false
    @State private var score: Int = 0
    @State private var questionCount: Int = 0
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black] , startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                
                VStack (spacing: 30) {
                    
                    VStack{
                        Text("Question: \(questionCount + 1)")
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            
                        }
                        label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
               Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding(25)
            }
            .alert(scoreTitle,isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
                
            }
            message:{Text("Your score is \(score) ")
            }
        }
    
        func flagTapped(_ number: Int){
            questionCount = questionCount + 1
            
            
            if number == correctAnswer{
                scoreTitle = "Correct"
                score = score + 1
            }else{
                scoreTitle = "Wrong! That's the flag of \(countries[number])"
            }
            showingScore = true
        }
        
        func askQuestion(){
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }

#Preview {
    ContentView()
}
