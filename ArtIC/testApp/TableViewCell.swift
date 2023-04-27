import UIKit

class TableViewCell: UITableViewCell {
    
}
//    private func fetchImage() {
//        guard let url = URL(string: URLExamples1.firstURL.rawValue) else { return }
//
//        //используем базовый фреймворк URLSession, к нему dataTask применяем вариант в котором есть completionHandler, потому что мы хотим получить данные
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            if let response = response {
//                print(response)
//            }
//
//            if let data = data, let image = UIImage(data: data) { //вдруг у нас запрос успешен, а данных нет?
//                DispatchQueue.main.async { //URLsession и UI данные изменяются на разных потоках (синхронно т.е когда задача завершится, а нам нужно сразу => поставим асинхронно) чтобы UI не заблокировался
//
////                    self.collectionImage.image = image
//                }
//            }
//        }.resume() //если не поставить resume, запрос не запустится
//    }
//}

    

