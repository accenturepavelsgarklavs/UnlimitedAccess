//
// Created by pavels.garklavs on 03/03/2022.
//

import UIKit

final class ParallelogramButton: UIButton {

    private var offset: CGFloat?
    private var fillColor: UIColor?

    func configure(offset: CGFloat, fillColor: UIColor) {
        self.offset = offset
        self.fillColor = fillColor
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()

        guard let offset = offset else { return }

        path.move(to: CGPoint(x: bounds.minX + offset, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX - offset, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))

        path.close()
        fillColor?.setFill()
        path.fill()
    }
}
