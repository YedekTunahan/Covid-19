
import UIKit

class ViewController: UIViewController {
    
    
    //for Get
    let url = URL(string: "https://raw.githubusercontent.com/M-Media-Group/country-json/master/src/countries-master.json")!
    let api=URL(string:"https://public.richdataservices.com/rds/api/query/covid19/jhu_country/select?cols=date_stamp,cnt_confirmed,cnt_death,cnt_recovered&where=(iso3166_1=TR)&format=amcharts&limit=5000")!
    
    private var countryListViewModel:CountryListViewModel! // initialize yapmamız lazım bunuda getData da yapıyoruz.
    private var countrySuper:CountrySuper!
    var myDataCount = [Detail]()

    //Tableview-SearchBar Nesneleri
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    //Search
    var search = [String]()
    var searchResultCountries = [String]()
    var areYouMakingaCall = false
    
   
  
    //for Navigation
    var name:String?
    var totalDeath:Int?
    var totalPatients:Int?
    var totalRecoveredPatients:Int?
    var data:PostData? = nil
    
    // Local Map Location
    
    var location:[Location] = [Location]() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
           
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        getData()
        
        // Location'u local olarak verdim API den böyle bir kaynak alamıyoruz.
        location = [
            .init(latitudeDelta:39.933753 ,longitude: 32.863003),
        ]
    }
    
    func getData(){
        //Ulke Verisini Aldığımız API için
        WebService().downloadCountry(url: url) { (countryList) in
            if let countryList = countryList {
                
                self.countryListViewModel = CountryListViewModel(countryList: countryList)
                
                
                for i in 0..<countryList.count{
                    
                    self.search.append(self.countryListViewModel.countryIndex(i).countryfrom)
                    
                }
                print(self.search)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }

        //TR nin detaylı bilgisini Aldığımız API için
        WebService().parse(url: api) { data in
            
            self.countrySuper = CountrySuper(List: data)
            

            self.myDataCount = data
            
            self.totalDeath = self.countrySuper.totalDeath()
            self.totalPatients = self.countrySuper.totalConfirmed()
            self.totalRecoveredPatients = self.countrySuper.totalRecovered()
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: TableView - Began
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // print(self.countryDataProvider!.numberOfRowsInsection())
        
        if areYouMakingaCall{
            return self.searchResultCountries.count
        }
        else {
            // "self.countryListViewModel.numberOfRowsInsection()"  burası getData() çalışdıktan sonra gelceği için programı çökertmemek adına   == nil ise 0 ver deriz kullanırız
            return self.countryListViewModel == nil ? 0 : self.countryListViewModel.numberOfRowsInsection()
        }
    }
    
//MARK: Arayüze yazdırma...
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        var received = ""
        let countryViewModel = self.countryListViewModel.countryIndex(indexPath.row)
        
        if var holiday = self.countrySuper {
            
            received = "Death:\(String(holiday.totalDeath())), Recovered:\(String(holiday.totalRecovered())), Confirmed:\(String(holiday.totalConfirmed()))"
            
         }
        
        if areYouMakingaCall{
             
            cell.textLabel?.text = searchResultCountries[indexPath.row]
            cell.detailTextLabel?.text = received ?? "nill"
            
            
        }else{
             
            cell.textLabel?.text = "\(countryViewModel.countryfrom)-\(countryViewModel.abbreviation)"
            
            if countryViewModel.abbreviation == "TR" {
                cell.detailTextLabel?.text = received ?? "nill"
            }else {
                cell.detailTextLabel?.text = "NİLL"
                
            }
        }
         
       // print("Cell içinden.... : " ,holiday.name)
         
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var received = ""
        let countryViewModel = self.countryListViewModel.countryIndex(indexPath.row)
        
        if var holiday = self.countrySuper {
            
            received = "Death:\(String(holiday.totalDeath())), Recovered:\(String(holiday.totalRecovered())), Confirmed:\(String(holiday.totalConfirmed()))"
            
         }
        
        if areYouMakingaCall {
            
            name = self.searchResultCountries[indexPath.row] // Seçilen Ülkeyi alırız...
            data = PostData(name: name!, numberOfDeath: self.totalDeath!, numberOfRecoveredPatients: self.totalRecoveredPatients!, numberOfPatients: self.totalPatients!,location: location)
            
        }else {
            data = PostData(name: name!, numberOfDeath: self.totalDeath!, numberOfRecoveredPatients: self.totalRecoveredPatients!, numberOfPatients: self.totalPatients!,location: location)
        }
        print("Gönderilecek veri: ",data)
        
        self.performSegue(withIdentifier: "toDetailVC", sender: data) // Tıklama oldugunda perform segue tetiklensin demiş oluyoruz.Tıklanıldıgında il bu gider prepare ' a gider ıcındeki komutları calıstırır sonrasında geçiş gerçekleşir
    }
    
//MARK: TableView - End
    
//MARK: Navigation - Began
    //Segue ye hazırlan demıs oluyoruz.PerformSegue yapmadan once yukarıdakı chosenCountry'i al diğer tarafdaki detailVC ^de bulunan degıskene eşitle demiş oluyoruz.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            
            if let veri = sender as? PostData {
                
                let destinationVC = segue.destination as! DetailViewController // oluşturdugumuz 2. sayfa dan nesne oluşturup buradan oraya bu degısken uzerınden verı yollarız
     
               //destinationVC.name = firstDetail
                print("Gönderilmeden önce: ")
                destinationVC.data  = veri
                    
            }

        }

    }
    //MARK: Navigation - End

}

//MARK: - SearchBar
extension ViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar,textDidChange searchText: String) {
        
        if searchText.isEmpty { // Arama yapılmıyor. Boşmu ? sorgusu 
            areYouMakingaCall = false
            
        }else{
             areYouMakingaCall = true
            
            searchResultCountries = search.filter({$0.lowercased().contains(searchText.lowercased())})
        
        }
        tableView.reloadData()
    }
}
