//
//  ViewController.swift
//  Inhoustontexas
//
//  Created by rnieves on 01/10/23.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var loadingImageView: UIImageView!
    var loadingImageViewShape: UIImageView!
    var loadingImageViewLogo: UIImageView!
    
    override func loadView() {
        super.loadView()
        
        // Configura el WKWebView
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.frame = self.view.bounds
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)
        
        // Configura el UIImageView para la imagen de carga
        loadingImageView = UIImageView(frame: self.view.bounds)
        loadingImageView.image = UIImage(named: "background")
        loadingImageView.contentMode = .scaleAspectFill
        //logo
        loadingImageViewLogo = UIImageView(frame: self.view.bounds)
        loadingImageViewLogo.image = UIImage(named: "logoinhouston")
        loadingImageViewLogo.contentMode = .scaleAspectFit
        loadingImageViewLogo.translatesAutoresizingMaskIntoConstraints = false
        loadingImageViewLogo.alpha = 0
        //sahpe
        loadingImageViewShape = UIImageView(frame: self.view.bounds)
        loadingImageViewShape.image = UIImage(named: "transparente1")
        loadingImageViewShape.contentMode = .scaleAspectFit
        loadingImageViewShape.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(loadingImageView)
        view.addSubview(loadingImageViewShape)
        view.addSubview(loadingImageViewLogo)
        UIView.animate(withDuration: 1.0, animations: {
            self.loadingImageViewLogo.alpha = 1
        })
        
        // Constraint para logo
        let leadingConstraint = NSLayoutConstraint(item: loadingImageViewLogo, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 30)
        let trailingConstraint = NSLayoutConstraint(item: loadingImageViewLogo, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -30)
        let centerYConstraint = NSLayoutConstraint(item: loadingImageViewLogo, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        // Activar las constraints
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, centerYConstraint])

        // Constraint shape
        let leadingConstraintS = NSLayoutConstraint(item: loadingImageViewShape, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: -8)
                
        // Constraint para trailing
        let trailingConstraintS = NSLayoutConstraint(item: loadingImageViewShape, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 8)
        
        // Constraint para top
        let topConstraintS = NSLayoutConstraint(item: loadingImageViewShape, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: -20)
        
        // Constraint para bottom
        let bottomConstraintS = NSLayoutConstraint(item: loadingImageViewShape, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 20)
        
        // Activar las constraints
        NSLayoutConstraint.activate([leadingConstraintS, trailingConstraintS, topConstraintS, bottomConstraintS])

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://inhoustontexas.us") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingImageView.alpha = 0
            self.loadingImageViewLogo.alpha = 0
            self.loadingImageViewShape.alpha = 0
        }) { (completed) in
            if completed {
                self.loadingImageView.removeFromSuperview()
                self.loadingImageViewLogo.removeFromSuperview()
                self.loadingImageViewShape.removeFromSuperview()
            }
        }
    }

}

