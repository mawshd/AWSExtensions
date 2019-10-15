import UIKit

public extension UITableView {
    
    
    func showLoadingTableFooter(withText: String? = "loading ...") {
        
        let height = (withText?.isValid ?? false) ? 64 : 44
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width.intValue, height: height))
        
        let loader = UIActivityIndicatorView(style: .gray)
        loader.startAnimating()
        var frame = CGRect(origin: footerView.center, size: loader.bounds.size)
        frame.origin.y = frame.origin.y - 6
        loader.frame = frame
        footerView.addSubview(loader)
        
        if withText?.isValid ?? false {
            let frame = CGRect(x: 0, y: 40, width: self.bounds.width.intValue, height: 20)
            let lbl = UILabel(frame: frame)
            lbl.text = withText
            lbl.textAlignment = .center
            footerView.addSubview(lbl)
        }
        
        self.tableFooterView = footerView
    }
    

    func hideLoadingTableFooter() {
        self.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    
    func showEmptyScreen (title : String, desc : String, txtColor : UIColor = .black) {
        let view = UIView(frame: self.bounds)
        
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        
        let str = NSMutableAttributedString()
        
        let titleSTR = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium),
            NSAttributedString.Key.foregroundColor : txtColor
        ])

        let descSTR = NSAttributedString(string: "\n\n\(desc)", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .light),
            NSAttributedString.Key.foregroundColor : txtColor
        ])
        
        str.append(titleSTR)
        str.append(descSTR)
        
        lbl.attributedText = str
        lbl.center = view.center
        view.addSubview(lbl)
        
        self.backgroundView = view
    }
    
    func hideEmptyScreen() {
        self.backgroundView = UIView()
    }
    
    
}
