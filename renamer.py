import sys
filename = sys.argv[1]

newFilename = 'renamed_'+filename

file = open(newFilename,'w')
        

with open(filename) as f:
    for line in f:
        tempLine = line
        if(line[0]=='>'):
            words = line.split()
            details = words[0].split("|")
            asc_num = details[3]
            if(words[1]=='PREDICTED:'):
                tempLine = '>'+words[2]+'_'+words[3]+ '_PREDICTED_'+ asc_num+'\n'
            else:
                tempLine = '>'+words[1]+'_'+words[2]+'_'+asc_num+'\n'
        print(tempLine, file=file)
                
            
            
            
        


file.close()
