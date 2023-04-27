
import UIKit

enum URLExamples {
    case starryNightandtheAstronauts
    case parisStreetRainyDay
    case aSundayonLaGrandeJatte1884
    case womanatHerToilette
    case americanGothic
    
    var imageURL: String {
        switch self {
        case .starryNightandtheAstronauts:
            return "https://www.artic.edu/iiif/2/e966799b-97ee-1cc6-bd2f-a94b4b8bb8f9/full/843,/0/default.jpg"
        case .parisStreetRainyDay:
            return "https://www.artic.edu/iiif/2/f8fd76e9-c396-5678-36ed-6a348c904d27/full/843,/0/default.jpg"
        case .aSundayonLaGrandeJatte1884:
            return "https://www.artic.edu/iiif/2/2d484387-2509-5e8e-2c43-22f9981972eb/full/843,/0/default.jpg"
        case .womanatHerToilette:
            return "https://www.artic.edu/iiif/2/78c80988-6524-cec7-c661-a4c0a706d06f/full/843,/0/default.jpg"
        case .americanGothic:
            return "https://www.artic.edu/iiif/2/b272df73-a965-ac37-4172-be4e99483637/full/843,/0/default.jpg"
        }
    }
    
    var infoURL: String {
        switch self {
        case .starryNightandtheAstronauts:
            return "https://api.artic.edu/api/v1/artworks/129884?fields=title,date_display,artist_title,artwork_type_title"
        case .parisStreetRainyDay:
            return "https://api.artic.edu/api/v1/artworks/20684?fields=title,date_display,artist_title,artwork_type_title"
        case .aSundayonLaGrandeJatte1884:
            return "https://api.artic.edu/api/v1/artworks/27992?fields=title,date_display,artist_title,artwork_type_title"
        case .womanatHerToilette:
            return "https://api.artic.edu/api/v1/artworks/11723?fields=title,date_display,artist_title,artwork_type_title"
        case .americanGothic:
            return "https://api.artic.edu/api/v1/artworks/6565?fields=title,date_display,artist_title,artwork_type_title"
        }
    }
}


class ArtworkViewController: UIViewController {
    
    // MARK: - СЮЖЕТЫ
    let example1 = URLExamples.starryNightandtheAstronauts
    let example2 = URLExamples.parisStreetRainyDay
    let example3 = URLExamples.aSundayonLaGrandeJatte1884
    let example4 = URLExamples.womanatHerToilette
    let example5 = URLExamples.americanGothic
    
    
    // MARK: - OUTLETS
    @IBOutlet var imageTESTView: UIImageView!
    @IBOutlet var activityTESTIndicator: UIActivityIndicatorView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateDisplayLabel: UILabel!
    @IBOutlet var artworkTypeTitleLabel: UILabel!
    @IBOutlet var artistTitleLabel: UILabel!
    @IBOutlet var nextArtworkButton: UIButton!
    
    private var currentURLExample = URLExamples.starryNightandtheAstronauts
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityTESTIndicator.startAnimating() //добавим запуск анимации
        activityTESTIndicator.hidesWhenStopped = true // добавим остановку анимации
        fetchImage() //подгрузим картинку
        fetchInfo() //подгрузим данные
        
        // MARK: - Предустановки
        titleLabel.text = ""
        dateDisplayLabel.text = ""
        artistTitleLabel.text = ""
        artworkTypeTitleLabel.text = ""
        nextArtworkButton.layer.cornerRadius = 15
        nextArtworkButton.tintColor = .gray
    }
    
    // MARK: - load image func
    //добавим функцию подгрузки картинки
    func fetchImage() {
        guard let url = URL(string:  currentURLExample.imageURL) else { return }
        
        //используем базовый фреймворк URLSession, к нему dataTask применяем вариант в котором есть completionHandler, потому что мы хотим получить данные
        URLSession.shared.dataTask(with: url) { (data, _, _) in //пустые строки для 'response' и  'error'
            
            //На случай еслизахотим отработать 'response' и  'error'
//      URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if let error = error {
//                    print(error)
//                    return
//                }
//
//                if let response = response {
//                    print(response)
//                }
                
                if let data = data, let image = UIImage(data: data) { //вдруг у нас запрос успешен, а данных нет?
                    DispatchQueue.main.async { //URLsession и UI данные изменяются на разных потоках (синхронно т.е когда задача завершится, а нам нужно сразу => поставим асинхронно) чтобы UI не заблокировался
                        self.imageTESTView.image = image
                        self.activityTESTIndicator.stopAnimating() //остановим индикатор активити(загрузки)
                    }
                }
            }.resume() //если не поставить resume, запрос не запустится
        }
        
        // MARK: - load info
        
        func fetchInfo() {
            guard let url = URL(string: currentURLExample.infoURL) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let info = json["data"] as! [String: Any]
                    let title = info["title"] as? String
                    let dateDisplay = info["date_display"] as? String
                    let artworkTypeTitle = info["artwork_type_title"] as? String
                    let artistTitle = info["artist_title"] as? String
                    
                    DispatchQueue.main.async {
                        self.titleLabel.text = title
                        self.dateDisplayLabel.text = dateDisplay
                        self.artworkTypeTitleLabel.text = artworkTypeTitle
                        self.artistTitleLabel.text = artistTitle
                        self.activityTESTIndicator.stopAnimating()
                    }
                    
                } catch let error {
                    print(error)
                }
            }.resume()
        }
        
        // MARK: - BUTTON
        
        @IBAction func nextArtworkButtonPressed(_ sender: Any) {
            
            switch currentURLExample {
            case .starryNightandtheAstronauts:
                currentURLExample = .parisStreetRainyDay
            case .parisStreetRainyDay:
                currentURLExample = .aSundayonLaGrandeJatte1884
            case .aSundayonLaGrandeJatte1884:
                currentURLExample = .womanatHerToilette
            case .womanatHerToilette:
                currentURLExample = .americanGothic
            case .americanGothic:
                currentURLExample = .starryNightandtheAstronauts
            }
            
            fetchImage() //подгрузим картинку
            fetchInfo() //подгрузим данные
            
        }
    }
