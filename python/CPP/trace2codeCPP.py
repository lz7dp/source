# C++ - real executed source code generator from trace and listing files

def main():
    module_name = input("Module name (default=CVMREFC@):") or "CVMREFC@"
    trace_name = input("Trace file (default=trace.txt):") or "trace.txt"
    list_name = input("List file (default=list.txt):") or "list.txt"
    
    with open(trace_name, "r") as trace_file:
        trace_lines = [line.replace('\x00', ' ') for line in trace_file]

    with open(list_name, "r") as list_file:
        list_lines = [line.replace('½ ', '') for line in list_file]

    outcdtrc_file = open("outCode.txt", "w")

    with open("outCodeTrc.txt", "w") as outcode_file:
        separator = "-" * 80 + "\n"
        enable = False
        numb = 0
        prtline = 0
        tmp_line = " "
        tmp_line2 = " "
        for trace_line in trace_lines:
            index_name = trace_line[1:9]
            index = trace_line[10:16]
            if index_name == module_name:
                index = index.replace(' ', '').zfill(6)
                for list_line in reversed(list_lines):
                    index3 = list_line[53:59]
                    if ((index3 == "***** ") and (prtline == 1) and enable):
                        outcode_file.write(list_line)
                        numb = numb + 1
                        if numb == 1:
                            if tmp_line != list_line:
                                outcdtrc_file.write(list_line)
                                tmp_line = list_line
                        if numb == 2:
                            if tmp_line2 != list_line:
                                outcdtrc_file.write(list_line)
                                tmp_line2 = list_line
                            prtline = 0
                            numb = 0    
                            break                            
                    if "ENTRY  START" in list_line:
                        enable = False
                    elif "*****    }" in list_line:
                        enable = True
                    elif enable:
                        index2 = list_line[2:8]                                
                        if index == index2:
                            outcode_file.write(separator)
                            outcode_file.write(list_line)
                            outcode_file.write(trace_line)       
                            prtline = 1

            else:
                outcode_file.write(trace_line)
                
    outcdtrc_file.close()            

if __name__ == "__main__":
    print("START ->")
    main()
    print("-> END")
