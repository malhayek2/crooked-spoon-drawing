

import UIKit

class ViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

   // @IBOutlet weak var colorPickerView: UIImageView!
    @IBOutlet var drawView: DrawView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // isUserInteractionEnabled
    }
    
    @IBOutlet weak var lineRectOutlet: UIButton!
    @IBAction func linerecButton(_ sender: Any) {
        var rect : Bool
        if lineRectOutlet.currentTitle == "Rect"{
            rect = true
            lineRectOutlet.setTitle("Line", for: .normal)
            drawView.lineBoolRect = rect
        }else if lineRectOutlet.currentTitle == "Line"{
            rect = false
            lineRectOutlet.setTitle("Rect", for: .normal)
            drawView.lineBoolRect = rect
        }else{
            rect = false
            drawView.lineBoolRect = rect
            
        }
    }
    
    @IBOutlet weak var redblackOutlet: UIButton!
    
    @IBAction func redblackButton(_ sender: Any) {
        var color : UIColor
        if redblackOutlet.currentTitle == "red"  {
            color = UIColor.red
            redblackOutlet.setTitle("black", for: .normal)
            
        }else if redblackOutlet.currentTitle == "black"{
            color = UIColor.black
            redblackOutlet.setTitle("red", for : .normal)
            
        }else{
            //nada
            color = UIColor.black
            
        }
        drawView.drawColor = color
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearTapped() {
        drawView.lines = [Line]()
        drawView.setNeedsDisplay()
    }
}

