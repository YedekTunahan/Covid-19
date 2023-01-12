
import Foundation

struct CountrySuper{
    let List : [Detail]
    var recovered:Int = 0
    var m = 0

    func takeIndex()->Int{
        return self.List.count
    }
    func returnData(indexPath:Int) -> Child {
        var data = List[indexPath]
        return Child(singleVariable: data)
    }
    func totalDeath() -> Int{
        return List[(List.count - 1)].cnt_death
    }
    
    mutating func totalRecovered() -> Int {
        
        for i in List {
            
            if i.cnt_recovered > m || i.cnt_recovered == m {
                self.m = i.cnt_recovered
            }
        }
        
        recovered = self.m
        return recovered 
    }
    
    func totalConfirmed() -> Int {
        return List[(List.count - 1)].cnt_confirmed
    }
    
}

struct Child{
    let singleVariable:Detail
    
    var date : String {
        
        return self.singleVariable.date_stamp
    }
    var death : Int {
        return self.singleVariable.cnt_death
    }
    var recovered : Int {
        return self.singleVariable.cnt_recovered
    }
    var confirmed : Int {
        return self.singleVariable.cnt_confirmed
    }
}
