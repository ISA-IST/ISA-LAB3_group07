
file_r = open("code_fwd.txt","r")
file_w = open("im_fwd.txt","w")

idx = 4194304
line = file_r.readlines()

for i in line:
    file_w.write('IM(' + str(idx) +') <= "'+ i.rstrip()[-8:]+'";\n')
    file_w.write('IM(' + str(idx+1) +') <= "'+i.rstrip()[-16:-8]+'";\n')
    file_w.write('IM(' + str(idx+2) +') <= "'+i.rstrip()[-24:-16]+'";\n')
    file_w.write('IM(' + str(idx+3) +') <= "'+i.rstrip()[0:8]+'";\n')
    idx=idx+4


file_r.close()
file_w.close()
