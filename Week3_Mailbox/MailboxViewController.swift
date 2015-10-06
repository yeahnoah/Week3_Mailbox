//
//  MailboxViewController.swift
//  Week3_Mailbox
//
//  Created by Noah Batterson on 10/4/15.
//  Copyright © 2015 Noah Batterson. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var navImageView: UIImageView!
    @IBOutlet weak var navSegController: UISegmentedControl!
    @IBOutlet weak var rescheduleImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var actionsView: UIView!
    @IBOutlet weak var laterIconImageView: UIImageView!
    @IBOutlet weak var archiveIconImageView: UIImageView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var deleteIconImageView: UIImageView!
    @IBOutlet weak var listIconImageView: UIImageView!
    
    @IBOutlet weak var menuButton: UIButton!
    @IBAction func pressedMenuButton(sender: AnyObject) {
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
            self.rescheduleImageView.alpha = 0
            self.menuButton.alpha = 0
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(0.2, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.feedImageView.center.y -= 86
                    }, completion: nil)
                
        })
    }
    
    @IBOutlet weak var listButton: UIButton!
    @IBAction func pressedListButton(sender: AnyObject) {
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
            self.listImageView.alpha = 0
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(0.2, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.feedImageView.center.y -= 86
                    self.listButton.alpha = 0
                    }, completion: nil)
                
        })
    }
    
    @IBAction func resetButton(sender: AnyObject) {
        UIView.animateWithDuration(0.05, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
            self.actionsView.backgroundColor = UIColor.whiteColor()
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(0.3, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.feedImageView.center.y += 86
                    self.messageView.center.x = 160
                    self.archiveIconImageView.center.x = 24
                    self.deleteIconImageView.center.x = 24
                    self.listIconImageView.center.x = 296
                    self.laterIconImageView.center.x = 296
                    self.archiveIconImageView.alpha = 0
                    self.deleteIconImageView.alpha = 0
                    self.laterIconImageView.alpha = 0
                    self.listIconImageView.alpha = 0
                    }, completion: nil)
                
        })
    }
    

    
    var messageViewInitialCenter: CGPoint!
    var laterIconImageViewInitialCenter: CGPoint!
    var archiveIconImageViewInitialCenter: CGPoint!
    var deleteIconImageViewInitialCenter: CGPoint!
    var listIconImageViewInitialCenter: CGPoint!
    
    
    @IBAction func messagePan(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.translationInView(view)
        
//STATES BEGIN
        
        if sender.state == UIGestureRecognizerState.Began {
            //Started Pan
            messageViewInitialCenter = messageView.center
            laterIconImageViewInitialCenter = laterIconImageView.center
            archiveIconImageViewInitialCenter = archiveIconImageView.center
            listIconImageViewInitialCenter = listIconImageView.center
            deleteIconImageViewInitialCenter = deleteIconImageView.center

        }
        else if sender.state == UIGestureRecognizerState.Changed {
            //Started Changed
            messageView.center = (CGPoint(x: messageViewInitialCenter.x + translation.x, y: messageViewInitialCenter.y))
            UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
                self.actionsView.alpha = 1
                }, completion: nil)
            
            //COLOR BEGIN
            if messageView.center.x > 160 && messageView.center.x < 220 {
                actionsView.backgroundColor = UIColor(red: 227.0/255, green: 227.0/255, blue: 227.0/255, alpha: 1.0)
                //GRAY
                archiveIconImageView.alpha = 1
                archiveIconImageView.center = (CGPoint(x: archiveIconImageViewInitialCenter.x, y: archiveIconImageViewInitialCenter.y))
                deleteIconImageView.center = (CGPoint(x: deleteIconImageViewInitialCenter.x, y: deleteIconImageViewInitialCenter.y))

            }
            else if messageView.center.x > 220 && messageView.center.x < 380 {
                actionsView.backgroundColor = UIColor(red: 113.0/255, green: 215.0/255, blue: 105.0/255, alpha: 1.0)
                //GREEN
                archiveIconImageView.alpha = 1
                deleteIconImageView.alpha = 0
                laterIconImageView.alpha = 0
                listIconImageView.alpha = 0
                archiveIconImageView.center = (CGPoint(x: archiveIconImageViewInitialCenter.x + translation.x - 60, y: archiveIconImageViewInitialCenter.y))
                deleteIconImageView.center = (CGPoint(x: deleteIconImageViewInitialCenter.x + translation.x - 60, y: deleteIconImageViewInitialCenter.y))

            }
            else if messageView.center.x > 380 && messageView.center.x < 480 {
                actionsView.backgroundColor = UIColor(red: 235.0/255, green: 85.0/255, blue: 59.0/255, alpha: 1.0)
                //RED
                archiveIconImageView.alpha = 0
                deleteIconImageView.alpha = 1
                laterIconImageView.alpha = 0
                listIconImageView.alpha = 0
                archiveIconImageView.center = (CGPoint(x: archiveIconImageViewInitialCenter.x + translation.x - 60, y: archiveIconImageViewInitialCenter.y))
                deleteIconImageView.center = (CGPoint(x: deleteIconImageViewInitialCenter.x + translation.x - 60, y: deleteIconImageViewInitialCenter.y))
            }
            else if messageView.center.x > 100 && messageView.center.x < 160 {
                actionsView.backgroundColor = UIColor(red: 227.0/255, green: 227.0/255, blue: 227.0/255, alpha: 1.0)
                //GRAY
                laterIconImageView.alpha = 1
            }
            else if messageView.center.x > 0 && messageView.center.x < 160 {
                actionsView.backgroundColor = UIColor(red: 250.0/255, green: 210.0/255, blue: 71.0/255, alpha: 1.0)
                //YELLOW
                archiveIconImageView.alpha = 0
                deleteIconImageView.alpha = 0
                laterIconImageView.alpha = 1
                listIconImageView.alpha = 0
                laterIconImageView.center = (CGPoint(x: laterIconImageViewInitialCenter.x + translation.x + 60, y: laterIconImageViewInitialCenter.y))
                listIconImageView.center = (CGPoint(x: listIconImageViewInitialCenter.x + translation.x + 60, y: listIconImageViewInitialCenter.y))

            }
            else if messageView.center.x > -160 && messageView.center.x < 0 {
                actionsView.backgroundColor = UIColor(red: 216.0/255, green: 166.0/255, blue: 121.0/255, alpha: 1.0)
                //BROWN
                archiveIconImageView.alpha = 0
                deleteIconImageView.alpha = 0
                laterIconImageView.alpha = 0
                listIconImageView.alpha = 1
                laterIconImageView.center = (CGPoint(x: laterIconImageViewInitialCenter.x + translation.x + 60, y: laterIconImageViewInitialCenter.y))
                listIconImageView.center = (CGPoint(x: listIconImageViewInitialCenter.x + translation.x + 60, y: listIconImageViewInitialCenter.y))
            }
            //COLOR END
            
            
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            //Started Ended
            if messageView.center.x > 160 && messageView.center.x < 220 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.messageView.center = (CGPoint(x: 160, y:  self.messageViewInitialCenter.y))
                    self.archiveIconImageView.center = (CGPoint(x: self.archiveIconImageViewInitialCenter.x, y: self.archiveIconImageViewInitialCenter.y))
                    }, completion: nil)
            }
            else if messageView.center.x > 220 && messageView.center.x < 380 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.messageView.center = (CGPoint(x: 220, y:  self.messageViewInitialCenter.y))
                    self.archiveIconImageView.center = (CGPoint(x: self.archiveIconImageViewInitialCenter.x, y: self.archiveIconImageViewInitialCenter.y))
                    }, completion: nil)
            }
            else if messageView.center.x > 380 && messageView.center.x < 480 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.messageView.center = (CGPoint(x: 480, y:  self.messageViewInitialCenter.y))
                    self.deleteIconImageView.center = (CGPoint(x: 296, y: self.deleteIconImageViewInitialCenter.y))
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.3, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                            self.feedImageView.center.y -= 86
                            }, completion: nil)
                        
                })

            }
            else if messageView.center.x > 100 && messageView.center.x < 160 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.messageView.center = (CGPoint(x: 160, y:  self.messageViewInitialCenter.y))
                    self.laterIconImageView.center = (CGPoint(x: self.laterIconImageViewInitialCenter.x, y: self.laterIconImageViewInitialCenter.y))
                    }, completion: nil)
            }
            else if messageView.center.x > 0 && messageView.center.x < 160 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.messageView.center = (CGPoint(x: -160, y:  self.messageViewInitialCenter.y))
                    self.laterIconImageView.center = (CGPoint(x: 24, y: self.laterIconImageViewInitialCenter.y))
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.3, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                            self.rescheduleImageView.alpha = 1
                            self.menuButton.alpha = 1
                            }, completion: nil)
                        
                })
            }
            else if messageView.center.x > -160 && messageView.center.x < 0 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                    self.messageView.center = (CGPoint(x: -160, y:  self.messageViewInitialCenter.y))
                    self.listIconImageView.center = (CGPoint(x: 24, y: self.listIconImageViewInitialCenter.y))
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.3, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
//                            self.feedImageView.center.y -= 86
                            self.listImageView.alpha = 1
                            self.listButton.alpha = 1
                            }, completion: nil)
                        
                })

            }


        }
//STATES END
        
    }
    
    
//    @IBAction func wrapperEdgePan(sender: UIScreenEdgePanGestureRecognizer) {
//        print("edge panned")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        

        
        
        contentScrollView.contentSize = contentView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
