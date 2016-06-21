setwd("C:/So muc ke")

path = "C:/So muc ke/data"


# Read data
ten_files = list.files(path,full.names = T)  #write list of file path to variable ten_files
ten_files_temp = list.files(path,full.names = F) #write list of file name to variable ten_file_temp

ni = seq_along(ten_files)
i = 1
data = list()
for (i in ni) 
{
  data[[i]]           = read.delim(ten_files[i], header = FALSE, sep = "|") ## doc file txt vao, su dung "|" lam separator
  data[[i]]= data[[i]][,c(2:11)] ###cat lay tu cot 2 den cot 11
  data[[i]]$ten_file  = ten_files_temp[i] ### them cot ten file vao
  names(data[[i]]) = c("thua","dtich","x","y","ldlr","churung","dchi","shTam","xuDong","dtsd","ten_file") # doi ten cot theo thu tu tu trai sang phai
  # data[[i]]$dtich = as.numeric(as.character(data[[i]]$dtich)) ## set cot dtich ve numeric
  data[[i]]$x = as.numeric(as.character(data[[i]]$x)) ## set cot x ve numeric
  data[[i]]$y = as.numeric(as.character(data[[i]]$y)) ## set cot y ve numeric
  data[[i]] = subset(data[[i]], is.na(data[[i]]$x) == F) #remove row with x=na, buoc nay cung se remove cac dong thua` o cuoi file text, cac dong phu. hoac khong theo dung' cau truc table
  data[[i]] = subset(data[[i]], is.na(data[[i]]$y) == F) #remove row with y=nam buoc nay cung se remove cac dong thua` o cuoi file text, cac dong phu. hoac khong theo dung' cau truc table
  i = i + 1
}

data_total = do.call(rbind, data) #combine cac data frame lai thanh 1 data frame
setwd("C:/So muc ke/output")

write.csv(data_total, file = "data_total.csv", row.names=FALSE)
