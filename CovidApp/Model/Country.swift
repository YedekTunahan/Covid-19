
import Foundation

struct Country:Decodable{
   
    var country:String
    var population:String?
    var sq_km_area:Double?
    var life_expectancy:String?
    var elevation_in_meters:String?
    var continent:String?
    var abbreviation:String?
    var location:String?
    var iso:String?
    var capital_city:String?
}


struct DataProvider:Codable{
    var dataProvider : [Detail]?
}
struct Detail:Codable {
    
    var date_stamp : String = ""
    var cnt_confirmed : Int = 0
    var cnt_death: Int = 0
    var cnt_recovered: Int = 0
     
}
