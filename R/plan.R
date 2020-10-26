cui=paste0('cui', 1:9)
cui_score=paste0('cui_score', 1:9)

the_plan <-
  drake_plan(

             MESHDIR='data/META/',
             target_sab='MSH',
             mrconso = read_umls_file('MRCONSO.RRF')  %>% filter(sab==target_sab),
             mrhier = read_umls_file('MRHIER.RRF')    %>% filter(sab==target_sab),
             mrrel = read_umls_file('MRREL.RRF')   %>% filter(sab==target_sab),
             mrsat = read_umls_file('MRSAT.RRF')   %>% filter(sab==target_sab),
             df_phess = read_tsv('data/phess_cat.txt', col_names=c('lineno','line','chunk',c(rbind(cui, cui_score))) ) %>%
               select(1:5) %>%
               rename(cui = cui1) ,

             df_vdi = read_tsv('data/vdi_cat.txt', col_names=c('lineno','line','chunk',c(rbind(cui, cui_score))) ) %>%
               select(1:5) %>%
               rename(cui = cui1) ,

             tree = df_vdi %>%
               bind_rows(df_phess) %>%
               distinct(cui) %>%
               inner_join( mrhier)  %>%
               as.Node( pathName='ptr',
                       pathDelimiter='.') ,




             0
)
