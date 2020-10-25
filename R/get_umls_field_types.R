
################################################################################
filename='MRCONSO.RRF'
add='l'
get_umls_field_types = function( filename , add='l')  {

  get_umls_fields(filename) %>%
    enframe(name=NULL, value='COL') %>%
    mutate(pos = row_number() ) %>% 
    { . } -> fields

  cols_filename='MRCOLS.RRF'
  read_delim( paste0('data/META/',cols_filename),delim='|', 
             col_names=get_umls_fields(cols_filename),
             col_types='cccnnnccl') %>%
  filter(FIL==filename) %>%
  inner_join( fields, by='COL' ) %>%
  mutate(type = case_when(
                          str_detect(DTY, 'char') ~ 'c',
                          str_detect(DTY, 'numeric') ~ 'd',
                          DTY== 'integer' ~ 'i',
                          TRUE ~ 'l'
                          )) %>%
  arrange(pos) %>%
  pluck('type') %>%
  c(add) %>%
  paste0(collapse='') 

}

