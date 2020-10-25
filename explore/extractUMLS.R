source('_drake.R')

################################################################################
file(paste0(MESHDIR,filename))

MESHDIR='data/C1963138/'
MESHDIR='data/META/'
mrconso = read_umls_file('MRCONSO.RRF')  
mrhier = read_umls_file('MRHIER.RRF') 
mrrel = read_umls_file('MRREL.RRF') 
mrsat = read_umls_file('MRSAT.RRF') 


mrconso_mth = mrconso  %>% filter(sab=='MTH')

mrcols = read_umls_file('MRCOLS.RRF') 

mrcols %>% 
  distinct(fil) %>%
  anti_join(
mrcols %>%
  filter(str_detect(col,'UI')) %>%
  select(fil))

  mrcols %>% 
    distinct(fil) %>%
    anti_join(
              mrcols %>%
                filter(str_detect(col,'UI')) %>%
                select(fil))

mrcols %>%
  filter(str_detect(col,'LUI')) %>%
  select(fil) %>%
  inner_join(
          mrcols %>%
            filter(str_detect(col,'CUI')) %>%
            select(fil)) %>%
  distinct(fil) %>%
  filter( !str_detect(fil, 'MRX'))

    

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

cui=paste0('cui', 1:9)
cui_score=paste0('cui_score', 1:9)
read_tsv('data/phess_cat.txt', col_names=c('lineno','line','chunk',c(rbind(cui, cui_score))) ) %>%
  select(1:5) %>% 
  rename(cui = cui1) %>%
  { . } -> df_phess

cui=paste0('cui', 1:9)
cui_score=paste0('cui_score', 1:9)
read_tsv('data/vdi_cat.txt', col_names=c('lineno','line','chunk',c(rbind(cui, cui_score))) ) %>%
  select(1:5) %>% 
  rename(cui = cui1) %>%
  { . } -> df_vdi

df_vdi %>%
  bind_rows(df_phess) %>%
  distinct(cui) %>%
  inner_join( mrconso)  %>%
  distinct(cui, sab) %>%
  count(sab, sort=TRUE)

df_phess %>%
  distinct(cui) %>%
  inner_join( mrhier)  %>%
  distinct(cui, sab) %>%
  count(sab, sort=TRUE)



  pivot_longer( starts_with('cui'))
  distinct( chunk) %>%
  count()

install.packages('data.tree')
