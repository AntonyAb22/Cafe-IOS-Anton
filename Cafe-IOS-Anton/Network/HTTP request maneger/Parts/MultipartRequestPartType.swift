//
//  MultipartRequestPartType.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

public protocol MultipartRequestPartType {
    var name: String { get }
    var partData: Data { get }
}

enum MimeType: String {
    case jpeg = "image/jpeg"
    case png = "image/png"
    case pdf = "application/pdf"
    case doc = "application/msword"
    case `default` = "application/octet-stream"
    case multipart = "multipart/form-data"
    case text = "text/plain"
    
    // новые расширения
    case acad = "application/acad"
    case atomXml = "application/atom+xml"
    case dwg = "application/dwg"
    case fontWoff = "application/font-woff"
    case gzip = "application/gzip"
    case javascript = "application/javascript"
    case json = "application/json"
    case vndMsExcel = "application/vnd.ms-excel"
    case vndMsPowerpoint = "application/vnd.ms-powerpoint"
    case vndMsPowerpointAddinMacroEnabled12 = "application/vnd.ms-powerpoint.addin.macroEnabled.12"
    case vndMsPowerpointPresentationMacroEnabled12 = "application/vnd.ms-powerpoint.presentation.macroEnabled.12"
    case vndMsPowerpointSlideshowMacroEnabled12 = "application/vnd.ms-powerpoint.slideshow.macroEnabled.12"
    case vndMsPowerpointTemplateMacroEnabled12 = "application/vnd.ms-powerpoint.template.macroEnabled.12"
    case vndOasisOpendocumentSpreadsheet = "application/vnd.oasis.opendocument.spreadsheet"
    case vndOasisOpendocumentText = "application/vnd.oasis.opendocument.text"
    case vndOpenxmlformatsOfficedocumentPresentationmlPresentation = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    case vndOpenxmlformatsOfficedocumentPresentationmlSlideshow = "application/vnd.openxmlformats-officedocument.presentationml.slideshow"
    case vndOpenxmlformatsOfficedocumentPresentationmlTemplate = "application/vnd.openxmlformats-officedocument.presentationml.template"
    case vndOpenxmlformatsOfficedocumentSpreadsheetmlSheet = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    case vndOpenxmlformatsOfficedocumentWordprocessingmlDocument = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    case xAcad = "application/x-acad"
    case xBittorrent = "application/x-bittorrent"
    case xDwg = "application/x-dwg"
    case xFontTtf = "application/x-font-ttf"
    case xml = "application/xml"
    case xZip = "application/x-zip"
    case xZipCompressed = "application/x-zip-compressed"
    case zip = "application/zip"
    case zipCompressed = "application/zip-compressed"
    case aac = "audio/aac"
    case audioMp4 = "audio/mp4"
    case mpeg = "audio/mpeg"
    case ogg = "audio/ogg"
    case webm = "audio/webm"
    case drawingDwg = "drawing/dwg"
    case mif = "other/mif"
    case drawio = ".drawio"
    case gif = "image/gif"
    case pjpeg = "image/pjpeg"
    case svgXml = "image/svg+xml"
    case vndDwg = "image/vnd.dwg"
    case webp = "image/webp"
    case encrypted = "multipart/encrypted"
    case signed = "multipart/signed"
    case cacheManifest = "text/cache-manifest"
    case css = "text/css"
    case csv = "text/csv"
    case html = "text/html"
    case markdown = "text/markdown"
    case php = "text/php"
    case vcard = "text/x-vcard"
    case video3gpp = "video/3gpp"
    case video3gpp2 = "video/3gpp2"
    case videoMp4 = "video/mp4"
    case videoMpeg = "video/mpeg"
    case videoQuicktime = "video/quicktime"
    case xMatroska = "video/x-matroska"
    case xMsvideo = "video/x-msvideo"
    case xMsWmv = "video/x-ms-wmv"
}
