//
//  StikerModal.swift
//  Cards
//
//  Created by romashka on 15.06.2024.
//

import SwiftUI

struct StikerModal: View {

    @Environment(\.dismiss) var dismiss
    @Binding var stickerImage: UIImage?
    @State private var stickersNames: [String] = []

    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]

    static func loadStickers() -> [String] {
        var themes: [URL] = []
        var stickersName: [String] = []

        let fileManager = FileManager.default
        if let resourcePath = Bundle.main.resourcePath,
           let enumerator = fileManager.enumerator(
            at: URL(fileURLWithPath: resourcePath + "/Stickers"),
            includingPropertiesForKeys: nil,
            options: [
                .skipsSubdirectoryDescendants,
                .skipsHiddenFiles
            ]) {
            for case let url as URL in enumerator
            where url.hasDirectoryPath {
                themes.append(url)
            }
        }

        for theme in themes {
            if let files = try?
                fileManager.contentsOfDirectory(atPath: theme.path) {
                for file in files {
                    stickersName.append(theme.path + "/" + file)
                }
            }
        }

        return stickersName
    }

    func image(from path: String) -> UIImage {
        print("loading:", path)
        return UIImage(named: path) ?? UIImage(named: "error-image") ?? UIImage()
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(stickersNames, id: \.self) { sticker in
                    Image(uiImage: image(from: sticker))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            stickerImage = image(from: sticker)
                            dismiss()
                        }
                }
            }
        }
        .onAppear {
            stickersNames = Self.loadStickers()
        }
    }
}

#Preview {
    StikerModal(stickerImage: .constant(UIImage()))
}
