function converge(name,l1,l2)
  local s="Tareas en cola de"..name..":-"
  for x=1,#l1 do
    s=s..l1[x].."-"
  end
  for y=1,#l2 do
    s=s..l2[y].."-"
  end
  return s
end
function sleep(n)
  os.execute("sleep " .. tonumber(n))
end
function listing(l1,l2,l3)
  local s1="Tareas de Impresiòn Realizadas: "
  local s2="Tareas de Email Realizadas: "
  local s3="Tareas de E/S Realizadas: "
  for x=1,#l1 do
    if x==#l1 then
      s1=s1..l1[x]
    else
    s1=s1..l1[x].."-"
    end
  end
  for y=1,#l2 do
    if y==#l2 then
      s2=s2..l2[y]
    else
    s2=s2..l2[y].."-"
    end
  end
  for z=1,#l3 do
    if z==#l3 then
      s3=s3..l3[z]
    else
    s3=s3..l3[z].."-"
    end
  end
  local s=s1.."\n"..s2.."\n"..s3
  return s
end
l_i_1={}
l_i_0={}
l_e_1={}
l_e_0={}
l_s_1={}
l_s_0={}
l_t_i={}
l_t_e={}
l_t_s={}
sec=0
state=true
impre=false
  ema=false
  es=false
while true do
  ocu1=false
  ocu2=false
  ocu3=false
  ocu1o=false
  ocu2o=false
  ocu3o=false
if sec==0 or sec%3==0 then
math.randomseed(os.time())
r1=math.random(3)
r2=math.random(9)
r3=math.random(0,1)
if r1==1 then
  if r3==1 then
    table.insert(l_i_1,r2)
  else table.insert(l_i_0,r2)
end
elseif r1==2 then
  if r3==1 then
    table.insert(l_e_1,r2)
  else table.insert(l_e_0,r2)
end
else 
if r3==1 then
    table.insert(l_s_1,r2)
  else table.insert(l_s_0,r2)
end
end
end
print(converge("Impresiòn",l_i_1,l_i_0))
print(converge("Email",l_e_1,l_e_0))
print(converge("E/S",l_s_1,l_s_0))
if #l_i_1==0 then
  if #l_i_0==0 then
    ocu1o=false
  else
    ocu1o=true
  end
else
  ocu1=true
end
if #l_e_1==0 then
  if #l_e_0==0 then
    ocu2o=false
  else
    ocu2o=true
  end
else
  ocu2=true
end
if #l_s_1==0 then
  if #l_s_0==0 then
    ocu3o=false
  else
    ocu3o=true
  end
else
  ocu3=true
end
if impre then
  ocu1=false
  ocu1o=false
  if #l_e_1==0 and #l_e_0==0 and #l_s_1==0 and #l_s_0==0 then
    if #l_i_1==0  then
      ocu1=false
    else
      ocu1=true
    end
      if #l_i_0==0 then
  ocu1o=false
  else
  ocu1o=true
  end
  end
elseif ema then
  ocu2=false
  ocu2o=false
  if #l_s_1==0 and #l_s_0==0 then
    ocu2=false
  ocu2o=false
else
  ocu1=false
  ocu1o=false
end
if #l_s_1==0 and #l_s_0==0 and #l_i_1==0 and #l_i_0==0 then
   if #l_e_1==0  then
      ocu2=false
    else
      ocu2=true
    end
      if #l_e_0==0 then
      
  ocu2o=false
  else
  
  ocu2o=true
  end
  end
elseif es then
  ocu3=false
  ocu3o=false
  if #l_e_1==0 and #l_e_0==0 and #l_i_1==0 and #l_i_0==0 then
    if #l_s_1==0  then
      ocu3=false
    else
      ocu3=true
    end
      if #l_s_0==0 then
      
  ocu3o=false
  else
  
  ocu3o=true
  end
  end
  
end
  
if state then
  if ocu1 then
    num_proc=l_i_1[1]
    table.remove(l_i_1,1)
    s="Impresiòn"
    state=false
    impre=true
    ema=false
    es=false
    a=num_proc
  elseif ocu1o then
    num_proc=l_i_0[1]
    table.remove(l_i_0,1)
    s="Impresiòn"
    state=false
    impre=true
    ema=false
    es=false
    a=num_proc
  elseif ocu2 then
    num_proc=l_e_1[1]
    table.remove(l_e_1,1)
    s="Email"
    state=false
    ema=true
    impre=false
    es=false
    a=num_proc
  elseif ocu2o then
    num_proc=l_e_0[1]
    table.remove(l_e_0,1)
    s="Email"
    state=false
    ema=true
    impre=false
    es=false
    a=num_proc
  elseif ocu3 then
    num_proc=l_s_1[1]
    table.remove(l_s_1,1)
    s="E/S"
    state=false
    impre=false
    ema=false
    es=true
    a=num_proc
  elseif ocu3o then
    num_proc=l_s_0[1]
    table.remove(l_s_0,1)
    s="E/S"
    state=false
    impre=false
    ema=false
    es=true
    a=num_proc
  else
    num_proc="Waiting..."
    s="Unknown"
  end
else
  num_proc=num_proc-1
end
print("Tiempo estimado de la tarea "..s.." : "..num_proc.." segundos")
if num_proc==0 then
  state=true
  if impre then
    table.insert(l_t_i,a)
  elseif ema then
    table.insert(l_t_e,a)
  elseif es then
    table.insert(l_t_s,a)
    end
end
print(listing(l_t_i,l_t_e,l_t_s))
tim=3-sec%3
print("Siguiente Tarea en :"..tim.." segundos")
sleep(1)
os.execute("clear")
sec=sec+1
end