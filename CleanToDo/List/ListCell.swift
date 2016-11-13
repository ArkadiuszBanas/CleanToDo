//
//  ListCell.swift
//  CleanToDo
//

import UIKit

private struct ListCellConstant {
    static let titleToCenterNoDateOffset: CGFloat = 0
    static let titleToCenterWithDateOffset: CGFloat = -10
}

class ListCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleToCenterConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        refresh()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        refresh()
    }

    func configure(withTask task: List.Tasks.ViewModel.CellTask) {

        titleLabel.text = task.title

        if let dueDate = task.dueDate {
            dateLabel.text = dueDate
            titleToCenterConstraint.constant = ListCellConstant.titleToCenterWithDateOffset
        }
    }

    private func refresh() {
        titleLabel.text = nil
        dateLabel.text = nil
        titleToCenterConstraint.constant = ListCellConstant.titleToCenterNoDateOffset
    }
}
