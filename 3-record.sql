/*
SELECT * FROM CLIENTE;

DECLARE
    CURSOR  c_clientes IS 
        SELECT * FROM CLIENTE;
BEGIN
    FOR cada_cliente IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre: '|| cada_cliente.NOMBRE);
    END LOOP;

END;

SELECT * FROM CLIENTE
WHERE UPPER(NOMBRE) LIKE '%AN%';
*/
/*
DECLARE

CURSOR c_clientes_a IS
    SELECT * FROM CLIENTE
    WHERE UPPER(NOMBRE) LIKE '%A%';
    v_contador NUMBER := 0;
BEGIN
    FOR cada_cliente_a IN c_clientes_a LOOP
        v_contador := v_contador + 1;
        DBMS_OUTPUT.PUT_LINE('Vamos en la iteracion: ' || v_contador);
        DBMS_OUTPUT.PUT_LINE('Nombres con A: ' || cada_cliente_a.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('Y su RUT: ' || cada_cliente_a.RUT);
    END LOOP;
END;
*/
/*
DECLARE

CURSOR C_APROBADO IS

        SELECT 
            C.NOMBRE AS NOMBRE,
            RT.ESTADO AS ESTADO,
            TP.MONTO_BRUTO AS MONTO_BRUTO,
            TP.DESCUENTO AS DESCUENTO,
            TP.MONTO_FINAL AS MONTO_FINAL,
            TP.ESTADO AS ESTADO_TRANSACCION
        FROM CLIENTE C
        INNER JOIN RESERVA_TEMPORAL RT ON C.CLIENTE_ID = RT.CLIENTE_ID
        INNER JOIN TRANSACCION_PAGO TP ON RT.RESERVA_ID = TP.RESERVA_ID
        WHERE TP.ESTADO = 'APROBADO';


BEGIN
    FOR CADA_APROBADO IN C_APROBADO LOOP
        DBMS_OUTPUT.PUT_LINE('#####################################
        ');
        DBMS_OUTPUT.PUT_LINE('Nombre: '|| CADA_APROBADO.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('Monto final: '|| CADA_APROBADO.MONTO_FINAL);
        DBMS_OUTPUT.PUT_LINE('Estado transaccion: '|| CADA_APROBADO.ESTADO_TRANSACCION);
        DBMS_OUTPUT.PUT_LINE('');

    END LOOP;
  
END;
*/
/*
    cada_cliente = el que recorre
    c_clientes = el recorrido
    LIKE '%an' '%an%' 'an%'
*/

DECLARE
    CURSOR C_CLIENTES_POR_ESTADO(P_ESTADO VARCHAR2) IS
        SELECT 
            C.NOMBRE AS NOMBRE,
            RT.ESTADO AS ESTADO,
            TP.MONTO_BRUTO AS MONTO_BRUTO,
            TP.DESCUENTO AS DESCUENTO,
            TP.MONTO_FINAL AS MONTO_FINAL,
            TP.ESTADO AS ESTADO_TRANSACCION
        FROM CLIENTE C
        INNER JOIN RESERVA_TEMPORAL RT ON C.CLIENTE_ID = RT.CLIENTE_ID
        INNER JOIN TRANSACCION_PAGO TP ON RT.RESERVA_ID = TP.RESERVA_ID
        WHERE TP.ESTADO = P_ESTADO;
BEGIN

    FOR CADA_APROBADO IN C_CLIENTES_POR_ESTADO('APROBADO') LOOP

        DBMS_OUTPUT.PUT_LINE('Nombre: '|| CADA_APROBADO.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('Monto final: '|| CADA_APROBADO.MONTO_FINAL);
        DBMS_OUTPUT.PUT_LINE('Estado transaccion: '|| CADA_APROBADO.ESTADO_TRANSACCION);
        DBMS_OUTPUT.PUT_LINE('');

    END LOOP;
END;