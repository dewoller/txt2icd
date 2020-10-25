
################################################################################
filename='MRCONSO.RRF'
read_umls_file = function(filename) {

  read_delim( paste0('data/META/',filename),
             delim='|', 
             quote='',
           col_names=get_umls_fields(filename),
           col_types=get_umls_field_types(filename)) 
}

