//
//  PetsCollectionViewLayout.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/29.
//

import UIKit

protocol PetsCollectionViewDelegate: AnyObject {
    func widthForItems (_ layout: PetsCollectionViewLayout) -> CGFloat
    func heightForRows(_ layout: PetsCollectionViewLayout) -> CGFloat
}

class PetsCollectionViewLayout: UICollectionViewLayout {
    weak var delegate: PetsCollectionViewDelegate?
    private var lineSpacing: CGFloat = 0
    private var columnSpacing: CGFloat = 0
    private var sectionInsets: UIEdgeInsets = .zero
    private var rowHeight: CGFloat {
        return delegate?.heightForRows(self) ?? 0
    }

    private var rowItemsMaxX = [Int: CGFloat]()
    private var currentRow = 0
    private var attributes = [UICollectionViewLayoutAttributes]()

    init(lineSpacing: CGFloat, columnSpacing: CGFloat, sectionInsets: UIEdgeInsets) {
        super.init()
        self.lineSpacing = lineSpacing
        self.columnSpacing = columnSpacing
        self.sectionInsets = sectionInsets
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Override
    override var collectionViewContentSize: CGSize {
        let maxRows = rowItemsMaxX.count
        let rowsHeight = CGFloat(maxRows) * (rowHeight + lineSpacing)
        let maxHeight = rowsHeight + sectionInsets.top + sectionInsets.bottom
        return CGSize(width: collectionView?.frame.width ?? 0, height: maxHeight)
    }

    override func prepare() {
        super.prepare()
        guard collectionView != nil else { return }
        currentRow = 0
        rowItemsMaxX.removeAll()
        attributes.removeAll()
        let itemCount = collectionView!.numberOfItems(inSection: 0)
        for i in 0 ..< itemCount {
            if let attribute = layoutAttributesForItem(at: IndexPath(row: i, section: 0)) {
                attributes.append(attribute)
            }
        }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }

        let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let width = collectionView.frame.width
        let itemWidth = delegate?.widthForItems(self) ?? 0
        var itemX = rowItemsMaxX[currentRow] ?? sectionInsets.left

        if (itemX + columnSpacing + itemWidth) > width {
            currentRow += 1
            itemX = sectionInsets.left
        }

        let itemY = sectionInsets.top + (rowHeight + lineSpacing) * CGFloat(currentRow)
        attribute.frame = CGRect(x: itemX, y: itemY, width: itemWidth, height: rowHeight)
        rowItemsMaxX[currentRow] = attribute.frame.maxX + columnSpacing

        return attribute
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributes
    }
}
