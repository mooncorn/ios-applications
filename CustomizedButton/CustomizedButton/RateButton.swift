//
//  RateButton.swift
//  CustomizedButton
//
//  Created by english on 2023-01-25.
//

import UIKit

class RateButton: UIView {

    @IBOutlet
    var lblQuestion: UILabel!
    
    @IBOutlet
    var btnLike: UIButton!
    
    @IBOutlet
    var btnDislike: UIButton!
    
    private var _question: String = "Question is missing"
    public var question: String {
        get {
            return _question
        }
        set {
            _question = newValue
            lblQuestion.text = _question
        }
    }
    
    private var _dislikeMessage: String = "Disliked"
    public var dislikeMessage: String {
        get {
            return _dislikeMessage
        }
        set {
            _dislikeMessage = newValue
        }
    }
    
    private var _likeMessage: String = "Liked"
    public var likeMessage: String {
        get {
            return _likeMessage
        }
        set {
            _likeMessage = newValue
        }
    }
    
    @IBAction
    func rateButtonTouchUp( _ sender: UIButton) {
        if sender.tag == 1 { // like
            lblQuestion.text = _likeMessage
        } else if sender.tag == 2 { // dislike
            lblQuestion.text = _dislikeMessage
        } else {
            lblQuestion.text = _question
        }
    }
}
