SET SERVEROUTPUT ON;

DECLARE

TYPE transaccion_cliente IS RECORD(
    nombre_cliente CLIENTE.NOMBRE%TYPE,
    estado_reserva RESERVA_TEMPORAL.ESTADO%TYPE,
    monto_bruto TRANSACCION_PAGO.MONTO_BRUTO%TYPE,
    descuento TRANSACCION_PAGO.DESCUENTO%TYPE,
    monto_final TRANSACCION_PAGO.MONTO_FINAL%TYPE,
    estado TRANSACCION_PAGO.ESTADO%TYPE
);

tras_cliente transaccion_cliente;

BEGIN

    SELECT 
        C.NOMBRE,
        RT.ESTADO,
        TP.MONTO_BRUTO,
        TP.DESCUENTO,
        TP.MONTO_FINAL,
        TP.ESTADO
    INTO
        tras_cliente
    FROM CLIENTE C
    INNER JOIN RESERVA_TEMPORAL RT ON C.CLIENTE_ID = RT.CLIENTE_ID
    INNER JOIN TRANSACCION_PAGO TP ON RT.RESERVA_ID = TP.RESERVA_ID

    WHERE C.CLIENTE_ID = 1;

    DBMS_OUTPUT.PUT_LINE('############## Boleta punto ticket #################');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('  Cliente: ' || tras_cliente.nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('  Estado reserva: ' || tras_cliente.estado_reserva || '             ▉      ▉   ');
    DBMS_OUTPUT.PUT_LINE('  Monto Bruto: ' || tras_cliente.monto_bruto || '      ');
    DBMS_OUTPUT.PUT_LINE('  Descuento: ' || tras_cliente.descuento|| '                     ▉          ▉');
    DBMS_OUTPUT.PUT_LINE('  Monto Final: ' || tras_cliente.monto_final|| '                    ▉▉▉▉▉  ');
    DBMS_OUTPUT.PUT_LINE('  Estado transaccion: ' || tras_cliente.estado);
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('####################################################');
  
END;


/*
SELECT 
    C.NOMBRE || ' ' || c.APELLIDO AS "Nombre cliente",
    TP.MONTO_BRUTO AS "Monto bruto",
    TP.DESCUENTO AS "Descuento aplicado",
    TP.MONTO_FINAL AS "Monto final",
    TP.ESTADO AS "Estado compra"
FROM CLIENTE C
INNER JOIN RESERVA_TEMPORAL RT ON C.CLIENTE_ID = RT.CLIENTE_ID
INNER JOIN TRANSACCION_PAGO TP ON RT.RESERVA_ID = TP.RESERVA_ID
GROUP BY C.NOMBRE || ' ' || c.APELLIDO, TP.MONTO_BRUTO, TP.DESCUENTO, TP.MONTO_FINAL, TP.ESTADO;
*/