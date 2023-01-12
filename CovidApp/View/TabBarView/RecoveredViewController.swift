
import Charts
import UIKit
import SwiftUI

//MARK: Burası sadece swiftUI  sayfasını  staryboard da açabilmek için var.
class RecoveredPatients: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}



//SWİFTUI ile grafik oluşturmak istemezsem UIKit ile oluşturursam aşağıdaki kodu çalıştırırım
/*
 class RecoveredPatients: UIViewController,ChartViewDelegate{
     var lineChart = LineChartView()
     var selectTotal : String?
     
     
     override func viewDidLoad() {
         super.viewDidLoad()

    
         lineChart.delegate = self
        
         //label.text = selectTotal
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         
         lineChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
         
         lineChart.center = view.center
         view.addSubview(lineChart)
         
         
         
 //MARK: VERİLERİ EKLEME KISMI GÜZEL KOD OLMASI ICIN KOD UZADI ENTRİES ARRAYI OLUSTURDUK
         var entries = [ChartDataEntry]()
         for m in 0..<10 {
             //entries.append(ChartDataEntry(x: Double(m), y: Double(m)))
             entries.append(ChartDataEntry(x: 10, y: 2))
         }
         
         let set = LineChartDataSet(entries:
         entries)
         
         set.colors = ChartColorTemplates.joyful() // renklı grafık olması ıcın
         let data = LineChartData(dataSet: set)
         
         lineChart.data = data
         
        
     }
 }
 */
