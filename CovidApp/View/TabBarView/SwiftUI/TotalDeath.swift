//
//  TotalDeath.swift
//  CovidApp
//
//  Created by Tunahan on 1/2/23.
//

import SwiftUI
import Charts


struct TotalDeath2: View {
    
    var data: [CitysData] = [ ]
    //Buradakilerin hepsi bir nesne]
    var body: some View {
        
        VStack{
                Chart{
                    //RuleMark(y:.value("Global", 80000)).foregroundStyle(Color.mint).lineStyle(StrokeStyle(lineWidth: 1))
                    ForEach(data) { shape in
                        
                        BarMark(
                            x: .value("City", shape.name!),
                            y: .value("Total Count", shape.numberOfDeath!)
                            
                            
                        ).foregroundStyle(
                            .linearGradient(
                                colors: [.blue, .green],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        BarMark(
                            x: .value("City", "X"),
                            y: .value("Total Count", 10000)
                        )
                        BarMark(
                            x: .value("City", "X2"),
                            y: .value("Total Count", 20000)
                        )
                        BarMark(
                            x: .value("City", "X3"),
                            y: .value("Total Count", 50000)
                        )
                       
                    }
                }
                    
            
        }
    }
}

struct TotalDeath_Previews: PreviewProvider {
    static var previews: some View {
        TotalDeath2()
    }
}
