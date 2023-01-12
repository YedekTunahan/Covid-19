//
//  TotalCases.swift
//  CovidApp
//
//  Created by Tunahan on 1/2/23.
//

import SwiftUI
import Charts

struct TotalCases: View {    
    var data:[CitysData] = []
    var body: some View {
          
        VStack{
            Chart{
                ForEach(data) { shape in
                    BarMark(
                        x: .value("City", shape.name!),
                        y: .value("Total Count", shape.numberOfPatients!)
                        
                        
                    ).foregroundStyle(
                        .linearGradient(
                            colors: [.blue, .green],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    //Alt daki 3 tane veri Local veri Görsel açıdan konuldu. Array'de 1 tane veri olduğu için
                    
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

struct TotalCases_Previews: PreviewProvider {
    static var previews: some View {
        
        TotalCases()
    }
}
