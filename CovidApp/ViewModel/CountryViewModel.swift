

import Foundation


struct CountryListViewModel {
    let countryList : [Country] //Country Nesnesi içerisinde barındırması gereken yani Type'ı Country olacak bir array tanımlarız.Çünkü Biz veriyi bu şekilde alıyoruz  "Service" Klasöründe
    
    // Verilerin tutulduğu array uzunluğunu döndüren fonksıyon  TableView'de kullanmak için oluşturuldu
    
    func numberOfRowsInsection () -> Int {
        
        return self.countryList.count
    }
    
    // Şimdi Oluşturduğumuz liste "CountryListViewModel (countryList)"  ile "CountryViewModel (country)"  nesnemizi bir birine baglamamız gerekiyor index olarak
    //Yukarıda tanımlamış olduğumuz Array'e verileri attık bizde View'da sadece buradaki Nesnenin isimine ihtiyacımız olduğu için İndex'De bulunan nesnenin Ülke isimini alabilmek için yani  Bu fonksiyonun döndürmesini istediğim değer Girilen İndex'e göre nesnenin Ülke isimini döndürmesi
    
    func countryIndex(_ index:Int) -> CountryViewModel {
        
        let country = self.countryList[index]
        return CountryViewModel(country: country)
    }
    
    // Ülke kısaltmasını döndüren fonksiyon
    func countryAbbreviationIndex(_ index:Int) -> CountryViewModel {
        
        let country = self.countryList[index]
        return CountryViewModel(country: country)
    }
}

struct CountryViewModel {
    
    let country:Country?
    
    //Buradaki class yardımıyla ulaşım saglarız view da
    
    var countryfrom:String {
        return self.country!.country
    }
    
    var abbreviation:String {
        return self.country!.abbreviation ?? "nill"
    }
    
}
