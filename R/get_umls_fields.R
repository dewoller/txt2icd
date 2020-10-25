
################################################################################
filename='MRCONSO.RRF'
add='junk'

get_umls_fields = function( filename, add='junk' )  {

  mrfiles_names=c('file','desc','fields')
  read_delim( 'data/META/MRFILES.RRF',delim='|', 
             col_names=c(mrfiles_names, paste0('x',1:4)),
             col_types='cccnnnl') %>%
  filter(file==filename ) %>%
  select(fields) %>%
  pluck('fields') %>%
  strsplit( split=",") %>%
  unlist() %>%
  c(add)

}

