%Inciso 2
max=90; %Valor m�ximo de rotaci�n
min=0; %Valor m�nimo de estado del servo
p=0.001; %pausa de .001
cuenta=0; %la cuenta empieza en cero
A.servoAttach(6) %Servo en el pin 6 PWM
lastButtonState=0; %�ltimo estado del boton
while cuenta<10 %mientras la cuenta sea menor a 10
    ButtonState=A.digitalRead(2); %El estado del bot�n es la lectura digital
    if ButtonState~=lastButtonState %Si el estado del bot�n es diferente a su �ltimo estado del bot�n
        if ButtonState == 1 %Si el bot�n est� encendido                                                                                                                                                                                  
            cuenta=cuenta+1 %Agregar uno a la cuenta
            if cuenta==10 %Si la cuenta ya lleg� a 10
                for i=min:max % hace un for entre el m�ximo y el m�nimo rango( de 0 a 90)
                    pause(p)%Manda a llamar a la pausa de .001
                    A.servoWrite(6,i); %mueve el servo
                end %end del for
            A.digitalWrite(3,1)%Abre led puerta
            end %end del if de si la cuenta ya lleg� a 10
        end %end del bot�n est� encendido o apagado
    end %end de la comparaci�n del estado anterior con el estado actual del bot�n
    lastButtonState=ButtonState; %Guarda el estado actual como el estado anterior para comenzar otra iteraci�n
end %End de mientras no se haya acabado la cuenta de 10
pause(0.1) %espera .1
A.digitalWrite(3,0) %Cierra led puerta
