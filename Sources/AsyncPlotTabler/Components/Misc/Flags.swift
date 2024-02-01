//
//  Flags.swift
//  PlotTabler
//

import Plot

public struct FlagIcon:Component {
    public enum Size {
        case xxs
        case xs
        case sm
        case md
        case lg
        case xl
        case xxl
        
        var css:String {
            switch self {
            case .xxs: "flag-xxs"
            case .xs:  "flag-xs"
            case .sm:  "flag-sm"
            case .md:  "flag-md"
            case .lg:  "flag-lg"
            case .xl:  "flag-xl"
            case .xxl: "flag-2xl"
            }
        }
    }
    
    let flag:Flags
    let tooltip:Bool
    let size:Size?
    
    public init(size: Size? = nil, tooltip: Bool = false, flag: Flags) {
        self.flag = flag
        self.tooltip = tooltip
        self.size = size
    }
    
    public func body() async -> Component {
        Span {
            Span { }
                .class("flag")
                .class("flag-country-\(flag.tag)")
                .class(size?.css ?? "")
        }
        .attribute(named: "title", value: flag.title)
        .optionalAttribute(tooltip, name: "data-bs-toggle", value: "tooltip")
        .optionalAttribute(tooltip, name: "data-bs-placement", value: "top")
    }
}

public enum Flags:CaseIterable, Codable {
    case Andorra
    case United_Arab_Emirates
    case Afghanistan
    case Antigua
    case Anguilla
    case Armenia
    case Angolan
    case Antarctica
    case Argentina
    case American_Samoa
    case Austria
    case Australia
    case Aruba
    case Aslan_Islands
    case Azerbaijan
    case Bosnian
    case Barbados
    case Belgium
    case Burkina_Faso
    case Bulgaria
    case Bahrain
    case Burundi
    case Benin
    case Saint_Barthélemy
    case Bermuda
    case Bruneian
    case Bolivia
    case Bonaire
    case Brazil
    case Bahamas
    case Bhutan
    case Bouvet_Island
    case Batswana
    case Belarus
    case Belize
    case Canada
    case Cocos_Island
    case Democratic_Republic_of_Congo
    case Central_African_Republic
    case Republic_of_the_Congo
    case Switzerland
    case Ivory_Coast
    case Cook_Island
    case Chile
    case Cameroon
    case China
    case Colombia
    case Costa_Rica
    case Cuba
    case Cape_Verde
    case Curacao
    case Christmas_Island
    case Cyprus
    case Czech_Republic
    case Germany
    case Djibouti
    case Denmark
    case Dominica
    case Dominican_Republic
    case Algeria
    case Ecuador
    case Estonia
    case Egypt
    case Sahrawi
    case Eritrea
    case Spain
    //case Catalonia
    case Ethiopia
    case European_Union
    case Finland
    case Fiji
    case Falkland_Islands
    case Federate_States_of_Micronesia
    case Faroe_Islands
    case France
    case Gabon
    case Great_Britain
    case England
    case Nothern_Ireland
    case Scotland
    case Wales
    case Grenada
    case Georgia
    case Guyana
    case Guernsey
    case Ghana
    case Gibraltar
    case Greenland
    case Gambia
    case Guinea
    case Guadeloupe
    case Equatorial_Guinea
    case Greece
    case South_Georgia
    case Guatemala
    case Guam
    case Guinea_Bissau
    case Guyana2
    case Hong_Kong
    case Heard_and_McDonald_Islands
    case Honduras
    case Croatia
    case Haiti
    case Hungary
    case Indonesia
    case Ireland
    case Israel
    case Isle_of_Man
    case India
    case British_Indian_Ocean_Territory
    case Iraq
    case Iran
    case Iceland
    case Italy
    case Jersey
    case Jamaica
    case Jordan
    case Japan
    case Kenya
    case Kyrgyzstan
    case Cambodia
    case Kiribati
    case Comoros
    case Saint_Kitts_and_Nevis
    case North_Korea
    case South_Korea
    case Kuwait
    case Cayman_Islands
    case Kazakhstan
    case Laos
    case Lebanese
    case Saint_Lucia
    case Liechtenstein
    case Sri_Lanka
    case Liberia
    case Lesotho
    case Lithuania
    case Luxembourg
    case Latvia
    case Libya
    case Morocco
    case Monaco
    case Moldova
    case Montenegro
    case Saint_Martin
    case Madagascar
    case Marshall_Islands
    case Macedonia
    case Mali
    case Myanmar
    case Mongolia
    case Macao
    case Nothern_Mariana_Islands
    case Martinique
    case Mauritania
    case Montserrat
    case Malta
    case Mauritius
    case Maldives
    case Malawi
    case Mexico
    case Malaysia
    case Mozambique
    case Namibia
    case New_Caledonia
    case Niger
    case Norfolk_Island
    case Nigeria
    case Nicaragua
    case Norway
    case Nepal
    case Nauruan
    case Niger2
    case New_Zealand
    case Oman
    case Panama
    case Peru
    case French_Polynesia
    case Papua_New_Guinea
    case Philippines
    case Pakistan
    case Poland
    case Saint_Pierre
    case Pitcairn_Islands
    case Puerto_Rico
    case Palestine
    case Portugal
    case Palau
    case Paraguay
    case Qatar
    case Reunion_Island
    case Romania
    case Serbia
    case Russia
    case Rwanda
    case Saudi_Arabia
    case Solomon_Islands
    case Seychelles
    case Sudan
    case Sweden
    case Singapore
    case Saint_Helena
    case Slovenia
    case Svalbard_Island
    case Slovakia
    case Sierra_Leone
    case San_Marino
    case Senegal
    case Somalia
    case Suriname
    case South_Sudan
    case Sao_Tome
    case El_Salvador
    case Sint_Maarten
    case Syria
    case Swaziland
    case Turks_and_Caicos
    case Chad
    case French_Southern_and_Antarctic_Lands
    case Togo
    case Thailand
    case Tajikistan
    case Tokelau
    case Timor_Leste
    case Turkmenistan
    case Tunisia
    case Tonga
    case Turkey
    case Trinidad_and_Tobago
    case Tuvalu
    case Tanzania
    case Ukraine
    case Uganda
    case United_States_Minor_Islands
    case United_Nations
    case United_States_of_America
    case Uruguay
    case Uzbekistan
    case Vatican_City
    case Saint_Vincent
    case Venezuela
    case British_Virgin_Islands
    case Virgiin_Islands
    case Vietnam
    case Vanuatu
    case Wallis_and_Futuna
    case Samoa
    case Yemen
    case South_Africa
    case Zambia
    case Zimbabwe
    
    public init?(code:String) {
        let tag = code.lowercased()
        if let match = Flags.allCases.first(where: { $0.tag == tag }) {
            self = match
        } else {
            return nil
        }
    }
    
    public var title:String {
        switch self {
        case .Saint_Barthélemy:
            return "Saint-Barthélemy"
        case .Guinea_Bissau:
            return "Guinea-Bissau"
        default:
            return "\(self)".replacingOccurrences(of: "_", with: " ")
        }
    }
    
    public var tag:String {
        switch self {
        case .Andorra: "ad"
        case .United_Arab_Emirates: "ae"
        case .Afghanistan: "af"
        case .Antigua: "ag"
        case .Anguilla: "ai"
        case .Armenia: "am"
        case .Angolan: "ao"
        case .Antarctica: "aq"
        case .Argentina: "ar"
        case .American_Samoa: "as"
        case .Austria: "at"
        case .Australia: "au"
        case .Aruba: "aw"
        case .Aslan_Islands: "ax"
        case .Azerbaijan: "az"
        case .Bosnian: "ba"
        case .Barbados: "bb"
        case .Belgium: "be"
        case .Burkina_Faso: "bf"
        case .Bulgaria: "bg"
        case .Bahrain: "bh"
        case .Burundi: "bi"
        case .Benin: "bj"
        case .Saint_Barthélemy: "bl"
        case .Bermuda: "bm"
        case .Bruneian: "bn"
        case .Bolivia: "bo"
        case .Bonaire: "bq-bo"
        case .Brazil: "br"
        case .Bahamas: "bs"
        case .Bhutan: "bt"
        case .Bouvet_Island: "bv"
        case .Batswana: "bw"
        case .Belarus: "by"
        case .Belize: "bz"
        case .Canada: "ca"
        case .Cocos_Island: "cc"
        case .Democratic_Republic_of_Congo: "cd"
        case .Central_African_Republic: "cf"
        case .Republic_of_the_Congo: "cg"
        case .Switzerland: "ch"
        case .Ivory_Coast: "ci"
        case .Cook_Island: "ck"
        case .Chile: "cl"
        case .Cameroon: "cm"
        case .China: "cn"
        case .Colombia: "co"
        case .Costa_Rica: "cr"
        case .Cuba: "cu"
        case .Cape_Verde: "cv"
        case .Curacao: "cw"
        case .Christmas_Island: "cx"
        case .Cyprus: "cy"
        case .Czech_Republic: "cz"
        case .Germany: "de"
        case .Djibouti: "dj"
        case .Denmark: "dk"
        case .Dominica: "dm"
        case .Dominican_Republic: "do"
        case .Algeria: "dz"
        case .Ecuador: "ec"
        case .Estonia: "ee"
        case .Egypt: "eg"
        case .Sahrawi: "eh"
        case .Eritrea: "er"
        case .Spain: "es"
        //case .Catalonia:
        case .Ethiopia: "et"
        case .European_Union: "eu"
        case .Finland: "fi"
        case .Fiji: "fj"
        case .Falkland_Islands: "fk"
        case .Federate_States_of_Micronesia: "fm"
        case .Faroe_Islands: "fo"
        case .France: "fr"
        case .Gabon: "ga"
        case .Great_Britain: "gb"
        case .England: "gb-eng"
        case .Nothern_Ireland: "gb-nir"
        case .Scotland: "gb-sct"
        case .Wales: "gb-wls"
        case .Grenada: "gd"
        case .Georgia: "ge"
        case .Guyana: "gf"
        case .Guernsey: "gg"
        case .Ghana: "gh"
        case .Gibraltar: "gi"
        case .Greenland: "gl"
        case .Gambia: "gm"
        case .Guinea: "gn"
        case .Guadeloupe: "gp"
        case .Equatorial_Guinea: "gq"
        case .Greece: "gr"
        case .South_Georgia: "gs"
        case .Guatemala: "gt"
        case .Guam: "gu"
        case .Guinea_Bissau: "gw"
        case .Guyana2: "gy"
        case .Hong_Kong: "hk"
        case .Heard_and_McDonald_Islands: "hm"
        case .Honduras: "hn"
        case .Croatia: "hr"
        case .Haiti: "ht"
        case .Hungary: "hu"
        case .Indonesia: "id"
        case .Ireland: "ie"
        case .Israel: "il"
        case .Isle_of_Man: "im"
        case .India: "in"
        case .British_Indian_Ocean_Territory: "io"
        case .Iraq: "iq"
        case .Iran: "ir"
        case .Iceland: "is"
        case .Italy: "it"
        case .Jersey: "je"
        case .Jamaica: "jm"
        case .Jordan: "jo"
        case .Japan: "jp"
        case .Kenya: "ke"
        case .Kyrgyzstan: "kg"
        case .Cambodia: "kh"
        case .Kiribati: "ki"
        case .Comoros: "km"
        case .Saint_Kitts_and_Nevis: "kn"
        case .North_Korea: "kp"
        case .South_Korea: "kr"
        case .Kuwait: "kw"
        case .Cayman_Islands: "ky"
        case .Kazakhstan: "kz"
        case .Laos: "la"
        case .Lebanese: "lb"
        case .Saint_Lucia: "lc"
        case .Liechtenstein: "li"
        case .Sri_Lanka: "lk"
        case .Liberia: "lr"
        case .Lesotho: "ls"
        case .Lithuania: "lt"
        case .Luxembourg: "lu"
        case .Latvia: "lv"
        case .Libya: "ly"
        case .Morocco: "ma"
        case .Monaco: "mc"
        case .Moldova: "md"
        case .Montenegro: "me"
        case .Saint_Martin: "mf"
        case .Madagascar: "mg"
        case .Marshall_Islands: "mh"
        case .Macedonia: "mk"
        case .Mali: "ml"
        case .Myanmar: "mm"
        case .Mongolia: "mn"
        case .Macao: "mo"
        case .Nothern_Mariana_Islands: "mp"
        case .Martinique: "mq"
        case .Mauritania: "mr"
        case .Montserrat: "ms"
        case .Malta: "mt"
        case .Mauritius: "mu"
        case .Maldives: "mv"
        case .Malawi: "mw"
        case .Mexico: "mx"
        case .Malaysia: "my"
        case .Mozambique: "mz"
        case .Namibia: "na"
        case .New_Caledonia: "nc"
        case .Niger: "ne"
        case .Norfolk_Island: "nf"
        case .Nigeria: "ng"
        case .Nicaragua: "ni"
        case .Norway: "no"
        case .Nepal: "np"
        case .Nauruan: "nr"
        case .Niger2: "nu"
        case .New_Zealand: "nz"
        case .Oman: "om"
        case .Panama: "pa"
        case .Peru: "pe"
        case .French_Polynesia: "pf"
        case .Papua_New_Guinea: "pg"
        case .Philippines: "ph"
        case .Pakistan: "pk"
        case .Poland: "pl"
        case .Saint_Pierre: "pm"
        case .Pitcairn_Islands: "pn"
        case .Puerto_Rico: "pr"
        case .Palestine: "ps"
        case .Portugal: "pt"
        case .Palau: "pw"
        case .Paraguay: "py"
        case .Qatar: "qa"
        case .Reunion_Island: "re"
        case .Romania: "ro"
        case .Serbia: "rs"
        case .Russia: "ru"
        case .Rwanda: "rw"
        case .Saudi_Arabia: "sa"
        case .Solomon_Islands: "sb"
        case .Seychelles: "sc"
        case .Sudan: "sd"
        case .Sweden: "se"
        case .Singapore: "sg"
        case .Saint_Helena: "sh"
        case .Slovenia: "si"
        case .Svalbard_Island: "sj"
        case .Slovakia: "sk"
        case .Sierra_Leone: "sl"
        case .San_Marino: "sm"
        case .Senegal: "sn"
        case .Somalia: "so"
        case .Suriname: "sr"
        case .South_Sudan: "ss"
        case .Sao_Tome: "st"
        case .El_Salvador: "sv"
        case .Sint_Maarten: "sx"
        case .Syria: "sy"
        case .Swaziland: "sz"
        case .Turks_and_Caicos: "tc"
        case .Chad: "td"
        case .French_Southern_and_Antarctic_Lands: "tf"
        case .Togo: "tg"
        case .Thailand: "th"
        case .Tajikistan: "tj"
        case .Tokelau: "tk"
        case .Timor_Leste: "tl"
        case .Turkmenistan: "tm"
        case .Tunisia: "tn"
        case .Tonga: "to"
        case .Turkey: "tr"
        case .Trinidad_and_Tobago: "tt"
        case .Tuvalu: "tv"
        case .Tanzania: "tz"
        case .Ukraine: "ua"
        case .Uganda: "ug"
        case .United_States_Minor_Islands: "um"
        case .United_Nations: "un"
        case .United_States_of_America: "us"
        case .Uruguay: "uy"
        case .Uzbekistan: "uz"
        case .Vatican_City: "va"
        case .Saint_Vincent: "vc"
        case .Venezuela: "ve"
        case .British_Virgin_Islands: "vg"
        case .Virgiin_Islands: "vi"
        case .Vietnam: "vn"
        case .Vanuatu: "vu"
        case .Wallis_and_Futuna: "wf"
        case .Samoa: "ws"
        case .Yemen: "ye"
        case .South_Africa: "za"
        case .Zambia: "zm"
        case .Zimbabwe: "zw"
        }
    }
}
