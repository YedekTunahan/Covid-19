
import UIKit
import SwiftUI

class DetailViewController: UIViewController {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelNumberOfPatients: UILabel!
    @IBOutlet weak var labelNumberOfRecoveredPatients: UILabel!
    @IBOutlet weak var labelNumberOfDeath: UILabel!
    
    var data = PostData() // Sayfalara Bilgileri Nesne olarak yollamak için  
    var cityData:CitysData? = nil
    var cityArray:[CitysData] = []
    var location:[Location] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        labelName.text = data.name!
        labelNumberOfPatients.text = "Toplam Hasta: \(String(data.numberOfPatients!))"
        labelNumberOfRecoveredPatients.text = "Toplam İyileşen: \(String(data.numberOfRecoveredPatients!))"
        labelNumberOfDeath.text = "Toplam Ölen: \(String(data.numberOfDeath!))"

        cityData = CitysData(name: data.name!, numberOfDeath: data.numberOfDeath!, id: UUID(),numberOfPatients:data.numberOfPatients!,numberOfRecoveredPatients:data.numberOfRecoveredPatients!)
        cityArray.append(cityData!)
        
        location = data.location
    }
    
    // MARK: - Navigation
 
    @IBAction func Total(_ sender: Any) {
        
        let newView = UIHostingController(rootView: TotalCases(data: cityArray))
        navigationController?.pushViewController(newView, animated: true)
    }
    
    @IBAction func recoveredButton(_ sender: Any) {
        let newView = UIHostingController(rootView: TotalRecovered(data: cityArray))
        
        navigationController?.pushViewController(newView, animated: true)
        print("recoveredButton - DetailViewController  Çalışdı...")
        
    }
    
    @IBAction func deathButton(_ sender: Any) {
        let newView = UIHostingController(rootView: TotalDeath2(data: cityArray))
        
        navigationController?.pushViewController(newView, animated: true)
    }
    
    @IBAction func MapButton(_ sender: Any) {
        self.performSegue(withIdentifier: "page4", sender: nil)
    }
    //MARK: Gönderilecek verileri değişlenlere atatığımız kısımlar
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "page4"{
                let destinationVC = segue.destination as! MapViewController // oluşturdugumuz 2. sayfa dan nesne oluşturup buradan oraya bu degısken uzerınden verı yollarız
     
               //destinationVC.name = firstDetail
            
                destinationVC.location  = location
                destinationVC.data = cityArray
                    
        }
    }
    
}
