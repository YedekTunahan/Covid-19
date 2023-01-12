
import SwiftUI
import Charts

struct Amount: Identifiable {
    var month: String
    var amount: Double
    var id = UUID()
}


struct denemeUI: View {
    
    var data: [Amount] = [
        .init(month: "March", amount: 100.00),
        .init(month: "April", amount: 200.00),
        .init(month: "May", amount: 120.00)
    ]

    var body: some View {
      
        Chart {
            BarMark(
                x: .value("Shape Type", data[0].type),
                y: .value("Total Count", data[0].count)
            )
            BarMark(
                 x: .value("Shape Type", data[1].type),
                 y: .value("Total Count", data[1].count)
            )
            BarMark(
                 x: .value("Shape Type", data[2].type),
                 y: .value("Total Count", data[2].count)
            )
        }
    }
}

struct denemeUI_Previews: PreviewProvider {
    static var previews: some View {
        denemeUI()
    }
}
