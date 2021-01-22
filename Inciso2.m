%Inciso 2
max=90; %Valor máximo de rotación
min=0; %Valor mínimo de estado del servo
p=0.001; %pausa de .001
cuenta=0; %la cuenta empieza en cero
A.servoAttach(6) %Servo en el pin 6 PWM
lastButtonState=0; %último estado del boton
while cuenta<10 %mientras la cuenta sea menor a 10
    ButtonState=A.digitalRead(2); %El estado del botón es la lectura digital
    if ButtonState~=lastButtonState %Si el estado del botón es diferente a su último estado del botón
        if ButtonState == 1 %Si el botón está encendido                                                                                                                                                                                  
            cuenta=cuenta+1 %Agregar uno a la cuenta
            if cuenta==10 %Si la cuenta ya llegó a 10
                for i=min:max % hace un for entre el máximo y el mínimo rango( de 0 a 90)
                    pause(p)%Manda a llamar a la pausa de .001
                    A.servoWrite(6,i); %mueve el servo
                end %end del for
            A.digitalWrite(3,1)%Abre led puerta
            end %end del if de si la cuenta ya llegó a 10
        end %end del botón está encendido o apagado
    end %end de la comparación del estado anterior con el estado actual del botón
    lastButtonState=ButtonState; %Guarda el estado actual como el estado anterior para comenzar otra iteración
end %End de mientras no se haya acabado la cuenta de 10
pause(0.1) %espera .1
A.digitalWrite(3,0) %Cierra led puerta
