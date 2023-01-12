
import Foundation

// Identifiable : Otomatik ID oluşturabilmek için kullanılır ...

//MARK: Seçilen Ülkenin  Şehirlerindeki bilgileri alıp diger sayfalara nesne olarak yollayabilmek için oluşturulan sınıf
struct CitysData: Identifiable   {
    
    var name: String?
    var numberOfDeath: Int?
    var numberOfPatients: Int?
    var numberOfRecoveredPatients : Int?
    var id = UUID()
   
    init(){
        
    }
    
    init(name:String,numberOfDeath:Int,id:UUID,numberOfPatients:Int,numberOfRecoveredPatients:Int){
        self.name = name
        self.numberOfDeath = numberOfDeath
        self.numberOfPatients = numberOfPatients
        self.numberOfRecoveredPatients = numberOfRecoveredPatients
        self.id = id
    }
}


