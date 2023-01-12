

import Foundation
//MARK: Segue ile diğer sayfalara veri yollamak için oluşturulan Sınıfımız
struct PostData {
    
    var name : String?
    var numberOfDeath: Int?
    var numberOfRecoveredPatients:Int?
    var numberOfPatients:Int?
    var location:[Location] = []
    
    init(){
        
    }
    init(name:String,numberOfDeath:Int,numberOfRecoveredPatients:Int,numberOfPatients:Int,location:[Location]){
        self.name = name
        self.numberOfDeath = numberOfDeath
        self.numberOfRecoveredPatients = numberOfRecoveredPatients
        self.numberOfPatients = numberOfPatients
        self.location = location
        
    }
}
