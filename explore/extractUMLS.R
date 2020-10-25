source('_drake.R')

################################################################################
mrconso = read_umls_file('MRCONSO.RRF')
mrhier = read_umls_file('MRHIER.RRF')

read_umls_file('MRDOC.RRF')

read_umls_file('MRCOLS.RRF') %>%
  filter(FIL=='MRHIER.RRF')

read_umls_file('MRCOLS.RRF') %>%
  filter(FIL=='MRCONSO.RRF')

mrconso %>%
  count(SAB)

mrconso %>%
  filter(SAB=='ICD10AM') %>%
  count(CUI,CODE, sort=TRUE) %>%
  filter(n>1)

mrconso %>%
  filter(SAB=='ICD10AM') %>%
  count(CODE, sort=TRUE) %>%
  filter(n>1) %>%
  { . } -> df_dup
################################################################################

mrconso %>%
  inner_join(df_dup) %>%
  select(CUI,CODE,STR)


################################################################################

mrconso %>%
  inner_join(df_dup) %>%
  select(CUI,CODE,STR)


cui=paste0('cui', 1:9)
cui_score=paste0('cui_score', 1:9)
read_tsv('data/phess_cat.txt', col_names=c('lineno','line','chunk',c(rbind(cui, cui_score))) ) %>%
  pivot_longer( starts_with('cui'))
  distinct( chunk) %>%
  count()

