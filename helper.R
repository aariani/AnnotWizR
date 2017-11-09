# helper functions


get_SNPs_Ranges=function(file_in){
  # function to used when input file is a SNPs association file
  # return a GRanges object for SNPs
  SNPs_info = read.table(file_in, sep=',', header=T)
  SNPs_data = GRanges(seqnames=SNPs_info$CHR, 
                      ranges=IRanges(start=SNPs_info$POS, end = SNPs_info$POS), 
                      scores = SNPs_info$P)
  SNPs_data
}

get_Windows_range=function(file_in){
  # Return a GRanges object for windows data
  window_info = read.table(file_in, sep-',', header=T)
  window_data = GRanges(seqnames = window_info$CHR,
                        ranges = IRanges(start=window_info$START, end = window_info$END))
  window_data
}