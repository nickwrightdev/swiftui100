import SwiftUI

struct Arrow: Shape {

    var lineWidth: Double
    var lineHeight: Double
    
    func path(in rect: CGRect) -> Path {
        
        let barHeight = rect.height * CGFloat(lineHeight)
        let barWidth = rect.width * CGFloat(lineWidth)
        let barMinX = rect.midX - (barWidth / 2)
        let barMaxX = rect.midX + (barWidth / 2)
        let barMaxY = rect.maxY
        
        let triangleHeight = rect.height - barHeight
        let trianglePoint = rect.midX
        let triangleMinX = rect.minX
        let triangleMaxX = rect.maxX
        let triangleMinY = rect.minY
        let triangleMaxY = rect.minY + triangleHeight
        
        
//        // using the requested triangle and rectangle, but produces a line between them..
//        var path = Path()
//        path.move(to: CGPoint(x: rect.midX, y: triangleMinY))
//        path.addLine(to: CGPoint(x: rect.minX, y: triangleMaxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: triangleMaxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: triangleMinY))
//        path.addRect(CGRect(x: barMinX, y: triangleMaxY, width: barWidth, height: barHeight))
        
        var path = Path()

        path.move(to: CGPoint(x: trianglePoint, y: triangleMinY))
        path.addLine(to: CGPoint(x: triangleMinX, y: triangleMaxY))
        path.addLine(to: CGPoint(x: barMinX, y: triangleMaxY))
        path.addLine(to: CGPoint(x: barMinX, y: barMaxY))
        path.addLine(to: CGPoint(x: barMaxX, y: barMaxY))
        path.addLine(to: CGPoint(x: barMaxX, y: triangleMaxY))
        path.addLine(to: CGPoint(x: triangleMaxX, y: triangleMaxY))
        path.addLine(to: CGPoint(x: trianglePoint, y: triangleMinY))
        
        return path
    }
}

struct ArrowChallengeView: View {
    @State private var lineWidth: Double = 0.5
    @State private var lineHeight: Double = 0.5
    
    var body: some View {
        VStack {
            Text("My Awesome Arrow")
                .font(.headline)
            
            Spacer()
            
            Arrow(lineWidth: lineWidth, lineHeight: lineHeight)
                .fill(Color.green)
                .frame(width: 300, height: 300)
            
            Spacer()
            
            Text("Line Width: \(lineWidth, specifier: "%.2f")")
            Slider(value: $lineWidth, in: 0.25...0.75)
                .padding([.horizontal, .bottom])
            
            Text("Line Height: \(lineHeight, specifier: "%.2f")")
            Slider(value: $lineHeight, in: 0.25...0.75)
                .padding([.horizontal])
        }
    }
}

struct ArrowChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowChallengeView()
    }
}
