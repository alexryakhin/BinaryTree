import UIKit

import UniformTypeIdentifiers

let headers = [
    "x-trace-id": "cngca2nq1rk91omt4m30",
    "Date": "Thu, 29 Feb 2024 17:55:22 GMT",
    "Strict-Transport-Security": "max-age=15724800; includeSubDomains",
    "Content-Type": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "Content-Disposition": "attachment; filename*=UTF-8''name.docx"
]

func extractFileName(from contentDisposition: String) -> String? {
    let pattern = "filename\\*?=UTF-8''([^\"]*)"

    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let matches = regex.matches(in: contentDisposition, options: [], range: NSRange(location: 0, length: contentDisposition.utf16.count))

        if let match = matches.first {
            let range = Range(match.range(at: 1), in: contentDisposition)
            return String(contentDisposition[range!])
        }
    } catch {
        print("Error creating regex: \(error.localizedDescription)")
    }

    return nil
}

func fileName() -> String? {
    guard let contentDisposition = headers["Content-Disposition"],
          let contentType = headers["Content-Type"],
          let fileName = extractFileName(from: contentDisposition),
          let fileExtension = UTType(mimeType: contentType)?.preferredFilenameExtension
    else { return nil }
    return fileName.hasSuffix(".\(fileExtension)") ? fileName : "\(fileName).\(fileExtension)"
}

print(fileName())
