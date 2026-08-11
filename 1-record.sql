SET SERVEROUTPUT ON;

DECLARE

    TYPE datos_cliente IS RECORD(
        rut_cliente CLIENTE.RUT%TYPE,
        nombre_cliente CLIENTE.NOMBRE%TYPE,
        email_cliente CLIENTE.EMAIL%TYPE
    );

    reg_cliente datos_cliente;

BEGIN

    SELECT RUT, NOMBRE, EMAIL
    INTO reg_cliente.rut_cliente, reg_cliente.nombre_cliente, reg_cliente.email_cliente
    FROM CLIENTE WHERE CLIENTE_ID = 2;

    DBMS_OUTPUT.PUT_LINE('El rut del usuario es: ' || reg_cliente.rut_cliente);
    DBMS_OUTPUT.PUT_LINE('El nombre del usuario es: ' || reg_cliente.nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('El email del usuario es: ' || reg_cliente.email_cliente);

    null;

END;

/

DECLARE
    v_rut CLIENTE.RUT%TYPE;
    v_nombre CLIENTE.NOMBRE%TYPE;
    v_email CLIENTE.EMAIL%TYPE;
BEGIN
    SELECT RUT, NOMBRE, EMAIL 
    INTO v_rut, v_nombre, v_email 
    FROM CLIENTE WHERE CLIENTE_ID = 2;
    DBMS_OUTPUT.PUT_LINE('El rut del usuario es: ' || v_rut);
    DBMS_OUTPUT.PUT_LINE('El nombre del usuario es: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('El email del usuario es: ' || v_email);
    null;
END;