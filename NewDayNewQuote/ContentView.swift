//
//  ContentView.swift
//  NewDayNewQuote
//
//  Created by Sazza on 16/3/22.
//

import SwiftUI

struct ContentView: View {
    var quote = ["Hello","world","Hola"]
    var body: some View {
        VStack {
            Text("Shuffled")
            List{
                ForEach(isNewDay() ? quote.shuffled() : quote,id:\.self){ quot in
                    Text(quot)
                }
            }
            Text("Not Shuffled")
            List{
                ForEach(quote,id:\.self){ quot in
                    Text(quot)
                }
            }
        }
    }
}

func isNewDay()-> Bool{
    
    let currentDate = Date()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    let currentDateString = dateFormatter.string(from: currentDate)
    
    if let lastSaved  = UserDefaults.standard.string(forKey: "lastDate"){// last saved date
        
        
        if lastSaved == currentDateString{
            return true
        }else{
            
            UserDefaults.standard.setValue(currentDateString, forKey: "lastDate")
            return false
            
        }
    }else{
        
        UserDefaults.standard.setValue(currentDateString, forKey: "lastDate")
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
