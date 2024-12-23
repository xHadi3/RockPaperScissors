//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Hadi on 22/06/1446 AH.
//

import SwiftUI



struct ContentView: View {
    
    let movesList = ["Rock" , "Paper", "Scissors"]
    let resultList = ["Win", "Lose", "Draw"]
    
    
    
    @State private var aiMove = Int.random(in: 0...2)
    @State private var shouldwin: Bool = Bool.random()
    @State private var showingEndGameScore = false
    @State private var score = 0
    @State private var questionNumber = 1
    
    
    var body: some View {
        VStack {
            Spacer()
            Text("The Ai move is \(movesList[aiMove])").font(.title).foregroundColor(.white)
            Text(shouldwin ? "Try to win" : "Try to Lose").font(.title).foregroundColor(.white)
            Spacer()
            ForEach(movesList , id: \.self)  { move in
                Button(move){
                    checkMoves(PlayerMove: move, aiMove: movesList[aiMove])
                }.buttonStyle(.bordered)
                    .frame(maxWidth: 300, maxHeight: 60)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(10)
            }
            Spacer()
            VStack{
                Text("Number of Question: \(questionNumber)").font(.title)
                Text("Your Score: \(score)").font(.title)
            }
                .padding(20)
            .foregroundColor(.secondary)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
           
            Spacer()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        .padding()
        .background(LinearGradient(colors: [.blue,.gray], startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
        .alert("GameOver",isPresented: $showingEndGameScore){
            Button("Restart", action: restart)
        }message: {
            Text("You got \(score) out of 10  Good Job :)")
        }
        
    }
    
    
    func checkMoves (PlayerMove:String , aiMove:String){
        if questionNumber == 10 {
            showingEndGameScore = true
            return
        }
        if(aiMove == "Rock"){
            if(PlayerMove == "Scissors"){
                if shouldwin{
                    score -= 1
                }else{
                    score += 1
                }
            }
            else if(PlayerMove == "Paper" ){
                if shouldwin{
                    score += 1
                }else{
                    score -= 1
                }
            }
            else if(PlayerMove == "Rock"){
                if shouldwin{
                    score += 0
                }
                else{
                    score += 0
                }
            }
        }else if(aiMove == "Paper"){
            if(PlayerMove == "Scissors"){
                if shouldwin{
                    score += 1
                } else{
                    score -= 1
                }
                
            }
            else if(PlayerMove == "Paper" ){
                
                score += 0
            }
            else if(PlayerMove == "Rock"){
                if shouldwin{
                    score -= 1
                } else{
                    score += 1
                }
                
            }
        }else if( aiMove == "Scissors"){
            if(PlayerMove == "Scissors"){
                    score += 0
            }
            else if(PlayerMove == "Paper" ){
                if shouldwin{
                    score -= 1
                } else{
                    score += 1
                }
                
            }
            else if(PlayerMove == "Rock"){
                if shouldwin{
                    score += 1
                } else{
                    score -= 1
                }
                }
            }
       
        questionNumber += 1
        updateAi()
        
    }
    func updateAi(){
        aiMove = Int.random(in: 0...2)
        shouldwin.toggle()
    }
    
    func restart(){
        score = 0
        questionNumber = 0
        aiMove = Int.random(in: 0...2)
        shouldwin.toggle()
        
    }
    
}
       
        
        
        #Preview {
            ContentView()
        }


