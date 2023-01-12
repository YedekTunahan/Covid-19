
import Foundation

class WebService {
    
    
    
    func downloadCountry(url:URL,completion:@escaping ([Country]?) -> ()) { //Escaping  ile bizim fonsiyonumuzun bittiğinde neyin döndürüleceğini söylemiş oluyoruz.Veri gelmesi uzun sürebilir bu yüzden Escaping ile method bittikden sonra değer döndür demiş olmak için kullanırız.
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let countryList = try? JSONDecoder().decode([Country].self, from: data)  // Byte olarak alınan veriler Json formatında Dictionary şekline tekrar dönüştürülür.Böylece Bilgilere ulaşıp kullanabiliriz.
                
                
                if let countryList = countryList {
                    completion(countryList) //Nesnemiz başarıyla alındıysa döndür diyoruz.
                }
            }
        }.resume()
    }
    
    
    func parse (url:URL,completion: @escaping ([Detail]) -> () ) {
        
        URLSession.shared.dataTask(with: url) { data , response , error in
            
            if let  error = error {
                
                print(error.localizedDescription)
                
                
            }else if data == data {
                do{
                    let result = try? JSONDecoder().decode(DataProvider.self, from: data!)
                    
                    if let mydata = result {
                        //print(mydata)
                        completion(mydata.dataProvider!)
                    }
                }catch{
                    print("error json in parsing")
                }
            }
          
        }.resume()
        }
}

