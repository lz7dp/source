# generate <code trace> files from <trace> and <listing> files

module_name = input("Module name (default=NAME@):") or "NAME@"
trace_name = input("Trace file (default=trace.txt):") or "trace.txt"
list_name = input("List file (default=list.txt):") or "list.txt"

print("START -> ", end = '')
trace_file = open(trace_name, "r")
trc_lines = trace_file.readlines()
trace_file.close()

list_file = open(list_name, "r")
list_lines = list_file.readlines()
list_file.close()

out_file = open("output.txt", "w")
for lin in trc_lines:
    new_line = lin.replace('\x00', ' ')
    out_file.writelines((new_line))
out_file.close()

trace_file = open("output.txt", "r")
trc_lines = trace_file.readlines()
trace_file.close()

outcode_file = open("outCode.txt", "w")
outcdtrc_file = open("outCodTrc.txt", "w")

for lin in trc_lines:
    sstr = lin[10:16]
    if sstr != "      ":
        sstr1 = sstr.replace(' ', '')
        rend = 4 - len(sstr1)
        zeroes = "00"
        for i in range(0, rend):
            zeroes = "".join(["0", zeroes])
        sstr2 = "".join([zeroes, sstr1])
        for llin in list_lines:
            lstr = llin[2:8]
            if lstr == sstr2:
                esstr = llin[53:55]                     # S_
                if esstr == "S_":
                    esstr2 = llin[53:62]                # S_xxx
                    esstr3 = esstr2.replace(' ', '')    # S_xxx
                    esstr3 = esstr3[2:(len(esstr3)+1)]  # xxx
                    for seclin in list_lines:
                        sslin = seclin[16:21]
                        sslin2 = sslin.replace(' ', '')
                        if esstr3 == sslin2:
                            outcdtrc_file.writelines("................................................................................\n")
                            outcdtrc_file.writelines((seclin))
                            outcode_file.writelines((seclin))
                            break
    outcdtrc_file.writelines((lin))
    
outcode_file.close()              
outcdtrc_file.close()     

trace_file = open("outCodTrc.txt", "r")
trc_lines = trace_file.readlines()
trace_file.close()

outcdtrc_file = open("outCodTrcSym.txt", "w")

for lin in trc_lines:
    if lin[1:9] == module_name:
        sstr = lin[10:16]
        sstr1 = sstr.replace(' ', '')
        rend = 4 - len(sstr1)
        zeroes = "00"
        for i in range(0, rend):
            zeroes = "".join(["0", zeroes])
        sstr2 = "".join([zeroes, sstr1])       
        for llin in list_lines:
            lstr = llin[2:8]
            if lstr == sstr2:
                esstr2 = llin[90:124]
                if esstr2.endswith('\n'):
                    esstr5 = esstr2
                else:
                    esstr5 = "".join([esstr2, "\n"])                   
                esstr4 = lin[0:(len(lin)-1)]
                esstr3 = "".join([esstr4, esstr5])                
                outcdtrc_file.writelines((esstr3))
    else:
        outcdtrc_file.writelines((lin))

outcdtrc_file.close()

print("STOP")
print("Ready!")