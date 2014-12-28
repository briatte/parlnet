bills = "data/bills.csv"
sponsors = "data/sponsors.csv"

# scrape bills (semi-manual: the index files require to be manually downloaded)

if(!file.exists(bills) | !file.exists(sponsors)) {

  a = data.frame()
  b = data.frame()

  for(i in rev(dir("raw", pattern = "bills", full.names = TRUE))) {

    legislature = gsub("raw/bills|\\.html", "", i)
    h = htmlParse(i, encoding = "UTF-8")

    url = xpathSApply(h, "//div[@class='irom-cim']//a[1]/@href")
    ref = xpathSApply(h, "//div[@class='irom-cim']//a[1]", xmlValue)
    title = xpathSApply(h, "//div[@class='irom-cim']/table/tbody/tr/td[2]", xmlValue)
    status = xpathSApply(h, "//div[@class='irom-adat']//table/tbody/tr[2]/td[2]", xmlValue)
    authors = xpathSApply(h, "//div[@class='irom-adat']//table/tbody/tr/td[text()='Benyújtó(k)']/following-sibling::td",
                          xmlValue)

    b = rbind(b, data.frame(legislature, url, ref, title, status, authors, stringsAsFactors = FALSE))
    cat(i, ":", length(ref), "bills\n")

    url = xpathSApply(h, "//div[@class='irom-adat']//table/tbody/tr[3]/td[2]//a/@href")
    uid = xpathSApply(h, "//div[@class='irom-adat']//table/tbody/tr[3]/td[2]//a", xmlValue)
    a = rbind(a, data.frame(legislature, url, uid, stringsAsFactors = FALSE))

  }

  # remove dates in sponsor lists
  b$authors = gsub("\\d{4}\\.\\d{2}\\.\\d{2}\\.:", ", ", b$authors)
  b$authors[ grepl("^kormány", b$authors) ] = "GOV"
  write.csv(b, bills, row.names = FALSE)

}

b = read.csv(bills, stringsAsFactors = FALSE)
b$authors = gsub(",\\s?", ";", b$authors)
b$n_au = 1 + str_count(b$authors, ";")

# scrape sponsors

if(!file.exists(sponsors)) {

  # extract URLs
  a = unique(a)
  a$url = gsub("(.*)p_azon%3D", "", a$url)
  a = subset(a, !grepl("http", url))

  # extract parties
  a$party = gsub("(.*)\\s\\((.*)\\)", "\\2", a$uid)
  a$party[ a$party == "független" ] = "IND"
  a$party = toupper(a$party)
  table(a$party)

  # rerun to solve network errors
  u = unique(a$url)
  s = data.frame()
  for(i in rev(u)) {

    cat("Downloading MP", sprintf("%4.0f", which(u == i)))
    file = paste0("raw/", i, ".html")

    if(!file.exists(file))
      download.file(paste0("http://www.parlament.hu/internet/cplsql/ogy_kpv.kepv_adat?p_azon=", i),
                    file, mode = "wb", quiet = TRUE)

    if(!file.info(file)$size) {

      cat(": failed\n")
      file.remove(file)

    } else {

      h = htmlParse(file, encoding = "UTF-8")
      legislature = xpathSApply(h, "//div[@id='kepvcsop-tagsag']/table/tr/td[1]", xmlValue)

      start = xpathSApply(h, "//div[@id='kepvcsop-tagsag']/table/tr/td[3]", xmlValue)
      end = xpathSApply(h, "//div[@id='kepvcsop-tagsag']/table/tr/td[4]", xmlValue)
      end[ grepl("\\s", end) ] = 2014

      mandate = apply(cbind(start, end), 1, function(x) {
        x = as.numeric(str_extract(x, "[0-9]{4}"))
        seq(x[1], x[2])
      })
      mandate = unique(as.vector(unlist(mandate)))
      mandate = sapply(substr(legislature, 1, 4), function(x) sum(mandate < x))

      photo = xpathSApply(h, "//img[contains(@alt, 'fényképe')]/@src")
      photo = ifelse(is.null(photo), NA, photo)

      name = xpathSApply(h, "//h1", xmlValue)
      # party = xpathSApply(h, "//div[@id='kepvcsop-tagsag']/table/tr/td[2]", xmlValue)

      s = rbind(s, data.frame(url = i, legislature, name, photo, mandate, stringsAsFactors = FALSE))

      cat("\n")

    }

  }

  a = merge(a, s, by = c("url", "legislature"), all.x = TRUE)
  a$photo[ !grepl("jpg$", a$photo) ] = NA

  table(is.na(a$photo))

  u = na.omit(unique(a$photo))
  for(i in rev(u)) {

    cat("Downloading photo", sprintf("%4.0f", which(u == i)))
    file = gsub("http://www.parlament.hu/kepv/kepek", "photos", i)

    if(!file.exists(file))
      download.file(i, file, mode = "wb", quiet = TRUE)

    if(!file.info(file)$size) {

      cat(": failed\n")
      file.remove(file)
      a$photo[ a$photo == i ] = NA

    } else {

      a$photo[ a$photo == i ] = gsub("photos/|\\.jpg", "", file)
      cat("\n")

    }

  }

  # photo URL is same as profile URL, except when missing
  a$photo = ifelse(is.na(a$photo), 0, 1)

  # clean names
  a$name = gsub("(.*)(D|d)r\\.\\s?", "", a$name)
  # bugfix (dr. prefix at end of name)
  a$name[ a$name == "" & a$url == "t027" ] = "Tóth Tiborné"

  # reorder first/family names
  a$name = sapply(a$name, function(x) {
    x = unlist(strsplit(x, " "))
    paste0(rev(x), collapse = " ")
  })

  a$firstname = sapply(a$name, function(x) {
    unlist(strsplit(x, " "))[1]
  })

  # solve duplicate: two rows on same legislature, same MP details
  a = subset(a, !(legislature == "1998-2002" & url == "t385"))

  a$sex = NA
  a$sex[ a$firstname %in% c("Ádám", "Ákos", "Alajos", "Albert", "Alpár", "Andor", "András", "Antal", "Árpád", "Attila", "Balázs", "Bálint", "Barna", "Barnabás", "Béla", "Bence", "Benedek", "Csaba", "Dániel", "Dávid", "Dénes", "Dezső", "Előd", "Endre", "Erik", "Ernő", "Etele", "Ervin", "Ferenc", "Flórián", "Gábor", "Gellért", "Gergely", "Gergő", "Géza", "György", "Győző", "Gyula", "Ildikó", "Imre", "István", "Iván", "János", "Jenő", "József", "Kálmán", "Károly", "Kornél", "Kristóf", "Krisztián", "Lajos", "László", "Lénárd", "Levente", "Lorántné", "Lukács", "Marcell", "Máriusz", "Márk", "Márton", "Máté", "Mátyás", "Mihály", "Miklós", "Mózes", "Nándor", "Norbert", "Oszkár", "Ottó", "Pál", "Péter", "Pierre", "Rezső", "Richard", "Richárd", "Róbert", "Roland", "Sándor", "Szabolcs", "Sebestyén", "Szilárd", "Tamás", "Tibor", "Tihamér", "Tivadar", "Viktor", "Vilmos", "Zoltán", "Zsolt", "(Veszprém)") ] = "M"
  a$sex[ a$firstname %in% c("Ágnes", "Anna", "Annamária", "Bernadett", "Dóra", "Edit", "Endréné", "Erika", "Erzsébet", "Éva", "Ferencné", "Gáborné", "Gabriella", "Györgyi", "Ibolya", "Ilona", "Istvánné", "Józsefné", "Judit", "Katalin", "Klára", "Krisztina", "Lajosné", "Lászlóné", "Lorántné", "Magda", "Magdolna", "Margit", "Mária", "Márta", "Melinda", "Monika", "Mónika", "Rebeka", "Róbertné", "Rózsa", "Sándorné", "Szilvia", "Szófia", "Tiborné", "Timea", "Valéria", "Virág", "Zita", "Zsuzsa", "Zsuzsanna") ] = "F"

  unique(subset(a, is.na(a$sex)))

  write.csv(a, sponsors, row.names = FALSE)

}

a = read.csv(sponsors, stringsAsFactors = FALSE)

# kthxbye
