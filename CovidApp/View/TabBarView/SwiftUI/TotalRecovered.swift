import SwiftUI
import Charts



struct TotalRecovered: View {
    var data: [CitysData] = [
        
    ]

    var body: some View {
        VStack{
            
            Chart{
                
                ForEach(data) { shape in
                    
                    BarMark(
                        x: .value("City", shape.name!),
                        y: .value("Total Count", shape.numberOfRecoveredPatients!)
                        
                        
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

struct TotalRecovered_Previews: PreviewProvider {
    static var previews: some View {
        TotalRecovered()
    }
}
