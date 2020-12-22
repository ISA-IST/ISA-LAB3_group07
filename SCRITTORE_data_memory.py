
file_r = open("dump_data_memory.txt","r")
file_w = open("data_mem.txt","w")

idx = 268500992 
lines = file_r.readlines()

for i in lines:
            
                file_w.write('DM(' + str(idx) +') <= "'+i.rstrip()[-8:]+'";\n')
                file_w.write('DM(' + str(idx+1) +') <= "'+i.rstrip()[-16:-8]+'";\n')
                file_w.write('DM(' + str(idx+2) +') <= "'+i.rstrip()[-24:-16]+'";\n')
                file_w.write('DM(' + str(idx+3) +') <= "'+i.rstrip()[0:8]+'";\n')
                idx=idx+4
        


file_r.close()
file_w.close()
    
    
