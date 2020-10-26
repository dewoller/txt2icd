source('_drake.R')

################################################################################
file(paste0(MESHDIR,filename))

MESHDIR='data/C1963138/'

file('data/META/MRCONSO.RRF')

MESHDIR='data/META/'
target_sab='MSH'
mrconso = read_umls_file('MRCONSO.RRF')  %>% filter(sab==target_sab)
mrhier = read_umls_file('MRHIER.RRF')    %>% filter(sab==target_sab)
mrrel = read_umls_file('MRREL.RRF')   %>% filter(sab==target_sab)
mrsat = read_umls_file('MRSAT.RRF')   %>% filter(sab==target_sab)




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



df_vdi %>%
  bind_rows(df_phess) %>%
  distinct(cui) %>%
  inner_join( mrhier)  %>%
  distinct(cui, sab) %>%
  count(sab, sort=TRUE)

df_vdi %>%
  bind_rows(df_phess) %>%
  distinct(cui) %>%
  inner_join( mrhier)  %>%
  as.Node( pathName='ptr',
  pathDelimiter='.') %>% 
  { . } -> tree


tree %>% head(10)

SetGraphStyle(tree, rankdir = "LR")
plot(tree)

vignette('applications', package = "data.tree")


devtools::install_github("timelyportfolio/listviewer")


tree %>%
  ToListSimple() %>%
  jsonedit()


as.Node
