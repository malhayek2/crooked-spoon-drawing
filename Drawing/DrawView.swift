

import UIKit

class DrawView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var drawColor : UIColor!
    var lineBoolRect : Bool!
    
    required init?(coder aDecoder: NSCoder) {
        drawColor = UIColor.black
        lineBoolRect = false
        super.init(coder: aDecoder)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
            if let touch = touches.first {
             lastPoint = touch.location(in: self)
                
                print(lastPoint.x)
                print(lastPoint.y)
                
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let newPoint = touch.location(in: self)
                
                print(newPoint.x)
                print(newPoint.y)
                lines.append(Line(start: lastPoint, end: newPoint, color: drawColor))
                lastPoint = newPoint
            self.setNeedsDisplay()
        }
       self.setNeedsDisplay()
    }
    func drawRect(){
           let ctx = UIGraphicsGetCurrentContext()
        for line in lines{
            
        
            let rectangle = CGRect(origin: line.start, size: CGSize(width: 100, height: 100))
       // let rect = CGRect(

               // 4
            ctx?.setFillColor(drawColor.cgColor)
               ctx?.setStrokeColor(UIColor.gray.cgColor)
               ctx?.setLineWidth(20)

               // 5
               ctx?.addRect(rectangle)
               ctx?.drawPath(using: .fillStroke)
           
        }
          // imageView.image = img
        
    }
    func drawLines(){
         let context = UIGraphicsGetCurrentContext()

               
               context?.setLineWidth(2)
               context?.beginPath()
               //context.stroke(bounds)
               for line in lines{
                   context?.setStrokeColor(drawColor.cgColor)
                   context?.move(to: (line.start))
                   context?.addLine(to: line.end)
                   context?.strokePath()
                   print("loop done")
               }
               context?.strokePath()
               //context?.closePath()
               context?.closePath()
        
    }
    //drawInRect
    override func draw(_ rect: CGRect) {
        if self.lineBoolRect == false{
            drawLines()
        }else{
            drawRect()
        }
        let image = UIGraphicsGetImageFromCurrentImageContext();
                //let imageData = UIImagePNGRepresentation(image);
        image?.pngData()
        //UIGraphicsEndImageContext()
        
       

        
    }
    

}
