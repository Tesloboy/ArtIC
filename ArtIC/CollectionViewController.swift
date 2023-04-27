import UIKit

enum URLExamples1: String {
    //Starry night and the astronauts
    case firstURL = "https://api.artic.edu/api/v1/artworks/129884?fields=title,date_display,artist_title,artwork_type_title"
    case firstImageURL = "https://www.artic.edu/iiif/2/e966799b-97ee-1cc6-bd2f-a94b4b8bb8f9/full/843,/0/default.jpg"
    //"Paris Street. Rainy Day"
    case secondURL = "https://api.artic.edu/api/v1/artworks/20684?fields=title,date_display,artist_title,artwork_type_title"
    case secondImageURL = "https://www.artic.edu/iiif/2/f8fd76e9-c396-5678-36ed-6a348c904d27/full/843,/0/default.jpg"
    //"The Basket of Apples"
    case thirdURL = "https://api.artic.edu/api/v1/artworks/111436?fields=title,date_display,artist_title,artwork_type_title"
    case thirdImageURL = "https://www.artic.edu/iiif/2/52ac8996-3460-cf71-cb42-5c4d0aa29b74/full/843,/0/default.jpg"
    //"Self Portrait"
    case fourthdURL = "https://api.artic.edu/api/v1/artworks/80607?fields=title,date_display,artist_title,artwork_type_title"
    case fourthImageURL = "https://www.artic.edu/iiif/2/26d3cea8-44c0-bfbd-a91a-19a007517152/full/843,/0/default.jpg"
    //"A Sunday on La Grande Jatte"
    case fifthdURL = "https://api.artic.edu/api/v1/artworks/27992?fields=title,date_display,artist_title,artwork_type_title"
    case fifthImageURL = "https://www.artic.edu/iiif/2/2d484387-2509-5e8e-2c43-22f9981972eb/full/843,/0/default.jpg"
    //"Woman at Her Toilette"
    case sixthURL = "https://api.artic.edu/api/v1/artworks/11723?fields=title,date_display,artist_title,artwork_type_title"
    case sixthImageURL = "https://www.artic.edu/iiif/2/78c80988-6524-cec7-c661-a4c0a706d06f/full/843,/0/default.jpg"
}

enum CollectionActions: String, CaseIterable {
    case actionOne = "Starry night and the astronauts"
    case actionTwo = "Paris Street. Rainy Day"
    case actionThree = "The Basket of Apples"
    case actionFour = "Self Portrait"
    case actionFive = "A Sunday on La Grande Jatte"
    case actionSix = "Woman at Her Toilette"
}


class CollectionViewController: UICollectionViewController {
   
    let collectionActions = CollectionActions.allCases
    var artworkInfo: [ArtworkInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "сollectionCell")

        collectionView.dataSource = self
        collectionView.delegate = self

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        //return collectionActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionActions.count
    }
    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "сollectionCell", for: indexPath) as! CollectionCell
//
//        let collectionAction = collectionActions[indexPath.item]
//        cell.collectionTitle.text = collectionAction.rawValue
//
//        return cell
//    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "сollectionCell", for: indexPath) as! CollectionCell
        
        // Заполняем ячейку данными
        let action = collectionActions[indexPath.row]
        cell.collectionTitle.text = action.rawValue
        cell.fetchImage()
        
        return cell
    }







    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collectionAction = collectionActions[indexPath.item]
        
        switch collectionAction {
        case .actionOne:
            performSegue(withIdentifier: "showArtwork", sender: nil)
        case.actionTwo:
            performSegue(withIdentifier: "showArtwork", sender: nil)
        case.actionThree:
            performSegue(withIdentifier: "showArtwork", sender: nil)
        case.actionFour:
            performSegue(withIdentifier: "showArtwork", sender: nil)
        case.actionFive:
            performSegue(withIdentifier: "showArtwork", sender: nil)
        case.actionSix:
            performSegue(withIdentifier: "showArtwork", sender: nil)
            
        }
        
    }
    
    
    
}


