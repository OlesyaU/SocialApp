import UIKit

final class ProfileInformationSelectGenderViewModel {
    let selectedImage = UIImage(named: "checkbox")?.imageWithColor(color:
                                                                    AppColors.orange)
    let unselectedImage = UIImage(named: "checkbox")?.imageWithColor(color: AppColors.gray)

    let maleTitle = "Мужской".localized
    let femaleTitle = "Женский".localized
    let selectGenderTitle = "Выберите пол".localized
    
    let font = UIFont.textRegular
    let blackColor = AppColors.black
    
    var selectedGender: Gender {
        didSet { viewModelChanged?()}
    }

    var viewModelChanged: (() -> Void)?

    init(selectedGender: Gender) {
        self.selectedGender = selectedGender
        localizingItems()
    }

    func genderSelected(gender: Gender) {
        selectedGender = gender
    }

    private func localizingItems(){
        [maleTitle, femaleTitle, selectGenderTitle].forEach{$0.localized}
    }
}
