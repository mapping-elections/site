#!/usr/bin/env Rscript --vanilla

suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(mappingelections))

congress8 <- meae_maps %>% filter(congress == 8) %>% pull(meae_id)
safe_make_page <- safely(make_map_page)
walk(congress8, safe_make_page, dir = ".", overwrite = TRUE)
