#!/usr/bin/env swift
import Foundation
import Darwin

// MARK: – Configuration
let zipURL = URL(string: "https://atlc.apple.com/downloads/xcode15/fundamentals/student.zip")!
let fileManager = FileManager.default
let home = fileManager.homeDirectoryForCurrentUser
let repoDir = home.appendingPathComponent("Developer").appendingPathComponent("iOS Development")
let developerDir = repoDir.appendingPathComponent("Textbook Files")
let tempDir = fileManager.temporaryDirectory
let zipFile = tempDir.appendingPathComponent("student.zip")
let unzipDir = tempDir.appendingPathComponent("student_unzip")

func drawProgress(current: Int, total: Int, width: Int = 40) {
    let pct = Double(current) / Double(total)
    let filled = Int(pct * Double(width))
    let bar = String(repeating: "=", count: filled)
    + String(repeating: " ", count: width - filled)
    let pctInt = Int(pct * 100)
    // \r returns to line start; terminator: "" avoids newline
    print("\r[\(bar)] \(pctInt)% (\(current)/\(total))", terminator: "")
    fflush(__stdoutp)  // force flush so it updates immediately
}

var repoPresent = fileManager.fileExists(atPath: repoDir.path)

do {
    // 0. Ensure folder doesn't already exist
    if fileManager.fileExists(atPath: developerDir.path) {
        print("❌ Error: Folder already exists in ~/Developer/iOS Development /Textbook Files. To avoid overwriting existing materials, please remove the folder first.")
        throw NSError.init(domain: "FileExistsError", code: 0, userInfo: nil)
    } else {
        print("📁 Creating ~/Developer/iOS Development Class/Textbook Files…")
        try fileManager.createDirectory(at: developerDir, withIntermediateDirectories: true)
    }
    
    // 1. Download ZIP
    print("⬇️ Downloading zip from Apple.com...")
    let data = try Data(contentsOf: zipURL)
    try data.write(to: zipFile)
    
    // 2. Prepare unzip directory
    if fileManager.fileExists(atPath: unzipDir.path) {
        try fileManager.removeItem(at: unzipDir)
    }
    try fileManager.createDirectory(at: unzipDir, withIntermediateDirectories: true)
    
    // 3. Unzip via system unzip
    print("📦 Unzipping…")
    let unzip = Process()
    unzip.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
    unzip.arguments = ["-o", zipFile.path, "-d", unzipDir.path]
    try unzip.run()
    unzip.waitUntilExit()
    guard unzip.terminationStatus == 0 else {
        throw NSError(domain: "UnzipError", code: Int(unzip.terminationStatus), userInfo: nil)
    }
    
    // 4. Move contents with progress bar
    let studentFilesDir = unzipDir.appendingPathComponent("student")
    let entries = try fileManager.contentsOfDirectory(
        atPath: studentFilesDir.path
    )
    let total = entries.count
    print("\n📂 Moving \(total) files…")
    
    for (index, entry) in entries.enumerated() {
        let source = studentFilesDir.appendingPathComponent(entry)
        let destination = developerDir.appendingPathComponent(entry)
        
        try fileManager.moveItem(at: source, to: destination)
        
        // update progress
        drawProgress(current: index + 1, total: total)
    }
    
    print("✅ Done! All materials are in ~/Developer/iOS Development/Textbook Files.")
} catch {
    fputs("❌ Error: \(error.localizedDescription)\n", stderr)
    exit(1)
}
