#!/usr/bin/env Rscript --vanilla

suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(mappingelections))

congress8 <- meae_maps %>% filter(congress == 8) %>% pull(meae_id)
extra <- c("meae.congressional.congress05.md.county",
           "meae.congressional.congress06.md.county",
           "meae.congressional.congress07.md.county")
safe_make_page <- safely(make_map_page)
walk(c(congress8, extra), safe_make_page, dir = ".", overwrite = TRUE)
