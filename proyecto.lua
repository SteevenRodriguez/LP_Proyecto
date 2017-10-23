tasks = {"Impresion", "Mail", "IO"}
lista_prioridad={}
lista_secundaria={}
function sleep(n)
    os.execute("sleep " .. tonumber(n))
  end


function crearTask()
    
    local tarea = {}
    math.randomseed( os.time() )
    tarea["number"] = math.random(3)
    tarea["duracion"] = math.random(10)
    tarea["prioridad"] = math.random(0,1) 
    print("Se acaba de crear la tarea",tasks[tarea["number"]])
    print("Duracion de",tarea["duracion"])
    print("Prioridad de",tarea["prioridad"])
    if tarea.prioridad == 1 then 
        table.insert(lista_prioridad,tarea)
    else 
        table.insert(lista_secundaria,tarea)
    end
        
        sleep(3)
    end

function procesarTask ()
    if #lista_prioridad >= 1 then
        for i,tarea in ipairs(lista_prioridad) do
            for count = 1,tarea.duracion do
                print("procesando")
                tarea.duracion = tarea.duracion - 1
                sleep(1)
            end
            tarea = nil
        end
    else 
        for l,tarea2 in ipairs(lista_secundaria) do
            for count2 = 1,tarea2.duracion do
                print("procesando")
                tarea2.duracion = tarea2.duracion - 1
                sleep(1)
            end
            tarea2 = nil
        end
    end
end



co = coroutine.create(crearTask)
coroutine.resume(co)
print(coroutine.status(co))

co2 = coroutine.create(procesarTask)
coroutine.resume(co2)