#1. constant
f<-3

#2. vectors 
#one dimensional array that can hold one type data
a<-c("k","j","m")
a[3]
a[2:3]
b<-c(2:6)

#3. matrices, two dimensional array in which each element has the same mode
mymatrix<- matrix(vector, nrow=number_of_rows, ncol=number_of_columns, byrow=logical_value, dimnames=list(char_vector_rownames, char_vector_colnames))

mymatrix1<-matrix(c(1:20),nrow=4,ncol=5,byrow=T, dimnames=list(c("a","b","c","d"),c(1:5)))
mymatrix1
mymatrix1[2,]
mymatrix1[,3]
mymatrix1[1,4]
mymatrix1[1,c(2,3)]


#4. arrays, more than two dimensions than matrices
myarray <-array(vector, dimensions, dimnames)
dim1 <-c("A1","A2")
dim2 <-c("B1","B2","B3")
dim3 <-c("C1","C2","C3","C4")
z<-array(1:24, c(2,3,4), dimnames=list(dim1,dim2,dim3))
z
z[1,2,]
z[2,1,3]

#5. data frames, more general than a matrix in which different columns can contain different models 
mydata <-data.frame(col1, col2, col3)
patientID <-c(1:4)
age <- c(25,34,28,52)
diabetes <- c("Type1","Type2","Type2","Type1")
status <-c("Poor","Improved","Excellent","Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
patientdata[c("age","status")] 
patientdata$patientID #indicate a particular variable from a given data frame

#6. cross-tabulate
table(patientdata$age, patientdata$diabetes)


#7. Attach detach and with()
attach(mtcars)
summary(mtcars$mpg)
plot(mpg, disp)
plot(mpg, wt)
detach(mtcars)

with(mtcars, {
  print(summary(mpg))
  plot(mpg, disp)
  plot(mpg, wt)
})
mtcars

#8. factors store the categorical values as a vector of integers in the range

diabetes <-c("Type1", "Type2", "Type1", "Type1") #nominally
diabetes <- factor(diabetes)
diabetes

status <-c("Poor","Improved","Excellent","Poor") #ordered automatically
status <- factor(status, ordered = T)
status

status <-factor(status, order=T, levels=c("Poor", "Improved", "Excellent")) #odered manually
status

sex <- c("male","male","female")
sex <-factor(sex, labels= c(1,2), levels=c("male","female"))
sex

#9. lists: consist of an ordered collection of objects
mylist <-list(object1, object2, ...)

g<-"My First List"
h <-c(25, 26, 18, 39)
j <- matrix(1:10 , nrow =5)
k <-c("one", "two", "three")
mylist <-list(title=g, age =h, j, k)
mylist

mylist$title
mylist$age
mylist[[3]]
mylist[[4]]
mylist[["age"]]

#10. data input from keyboard
#entering data from the keyboard
mydata <-data.frame(age=numeric(0), gender=character(0), weight=numeric(0)) #create like age, numeric but no actual data
mydata <-edit(mydata) #invoke a text editor
#embed the data directly in your program
mydatatxt <- "
age gender weight
25 m 166
30 f 115
18 f 120
"
mydata <-read.table(header= T, text=mydatatxt)
mydata

#11. data input from a delimited text file
grades <- read.table("studentgrades.csv", header=T), row.names="StudentID", sep=",") #sep for seperating data values, header for checking if the file contains the variable names in the first line
#header indicating whether file contains the variable names in the first line
#sep separating datavalues, default is sep="", sep="\t" to read tab-delimited files
#row.names optinal for identifying rows
#col.names optional for identifying cols
#na.strings converts specified strings as NA
#colClasses read the variables as classes(numeric, character)
#quote delimit strings that contain special characters
#skip skip lines before begining to read the data
#stringsAsFactors a logical value indicating whether character variables should be converted to factors
#text specifiy a text string to process

#12. importing data via connections
# file() allows to access files, the clipboard and C-level standard input
# gzfile(), bzfile(), xzfile(), unz() allows to read compressed files
#url() allows to access internet files through a complete URL that includes http://, ftp://, or file://

#13. importing data from excel
#read.xlsx()

#14. importing data from XML
#www.omegahat.org/RSXML

#15. importing data from the web
#websraping using readLines and RCurl: www.programmingr.com
#other packages: http://mng.bz/370r

#16. importing data from SPSS
read.spss() #in foreign packages
spss.get() #automatically set many parameters of read.spss(), from Hmisc

#17. importing data from SAS
read.ssd() #foreign package
sas.get() #Hmisc package
read.sas7bdat() #sas7bdat

#18. importing data from Stata
read.dta() #foreign package

#19. importing data from NetCDF
#ncdf package

#20. importing data from HDF5
#rhdf5 pakcages

#21. importing data from accessing database management systems(DBMSs)
#get access through native database drivers or via ODBC or JDBC
#ODBS INTERFACE: RODBS package which allows R to connect to any DBMS that has an ODBC driver
#DBI-RELATED PACKAGES: DBI, RJDBC, RMySQL, ROracle, RPostgreSQL, and RSQLite
#check on http://cran.r-project.org

#22. importing data via Stat/Transfer
#www.stattransfer.com

#23. annotating datasets
#variable labels
names(patientdata)[2] <- "Age at hospitalization (in years)"
#value labels: use factor() function
patientdata$gender <- factor(patientdata$gender, levels =c(1,2), labels = c("male", "female"))

#24. some useful functions for working with data objects
length(patientdata$status) #gives the number of elements/components
dim(patientdata) #gives the dimensions of an object
str(patientdata) #gives the structure of an object
class(patientdata) #gives the class of an object
mode(patientdata) #determines how an object is stored 
names(patientdata) #gives the names of components in an object
c(object,object,...) #combines objects into a vector
cbind(object, object,...) #combines objects as cols
rbind(object, object,...) #combines objects as rows
patientdata #prints an object
head(patientdata) #list the first part of an object
tail(patientdata) #list the last part of an object
ls() #lists current objects
rm() #remove current objects
newobject <-edit(object) #edit objects and save it as newobject
fix(object) #edit an object in place
