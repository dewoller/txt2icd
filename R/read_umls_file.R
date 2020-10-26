
################################################################################
filename='MRCONSO.RRF'
read_umls_file = function(filename, MESHDIR='data/META////////') {

  read_delim( paste0(MESHDIR,'/',filename),
             delim='|',
             quote='',
           col_names=get_umls_fields(filename),
           col_types=get_umls_field_types(filename)) %>%
  janitor::clean_names()

}

