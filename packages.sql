--Validacion previa (Stock de entradas)

--Funcion que retorne la cantidad de entradas de una funcion en especifica

--Se procede a vender
--Se descuenta el stock ( UPDATE STOCK_DISPONIBLE = STOCK_DISPONIBLE - ENTRADAS_COMPRADAS )

--Determinar el SPEC del paquete

create or replace package pkg_boleteria as 

    g_cantidad_vendida NUMBER := 0;

    --El spec (o la firma) de mi funcion
   function fn_verificar_stock (
      p_localidad_evento_id in number
   ) return number;

   PROCEDURE sp_actualiza_stock(p_localidad_evento_id IN NUMBER, p_entradas_vendidas IN NUMBER);

end pkg_boleteria;
/

--Una vez decalrado el SPEC, vamos ahora con el body

create or replace package body pkg_boleteria as
    
    --body

    function fn_verificar_stock (
      p_localidad_evento_id in number
    ) return number AS 

        v_stock NUMBER;
        
        begin

            select stock_disponible
            into v_stock
            from localidad_evento
            where localidad_evento_id = p_localidad_evento_id;

            RETURN v_stock;
        
        end fn_verificar_stock;


    PROCEDURE sp_actualiza_stock(
    p_localidad_evento_id IN NUMBER,
    p_entradas_vendidas IN NUMBER) as

        v_stock NUMBER;

        BEGIN

            v_stock := fn_verificar_stock(p_localidad_evento_id);

            IF V_STOCK <= 0 THEN
                RAISE_APPLICATION_ERROR(-20001, 'Sin entradas disponibles para el evento deseado');
            END IF;

            UPDATE LOCALIDAD_EVENTO SET STOCK_DISPONIBLE = STOCK_DISPONIBLE - p_entradas_vendidas where LOCALIDAD_EVENTO_ID = p_localidad_evento_id;
            COMMIT;

            g_cantidad_vendida := g_cantidad_vendida + p_entradas_vendidas;

        END sp_actualiza_stock;



end pkg_boleteria;
/


DECLARE
    V_STOCK_DISPO NUMBER;
BEGIN
    V_STOCK_DISPO := PKG_BOLETERIA.FN_VERIFICAR_STOCK(1);
    DBMS_OUTPUT.PUT_LINE(V_STOCK_DISPO);

    PKG_BOLETERIA.SP_ACTUALIZA_STOCK(1, 8);
    DBMS_OUTPUT.PUT_LINE(V_STOCK_DISPO);

    DBMS_OUTPUT.PUT_LINE(PKG_BOLETERIA.g_cantidad_vendida);
END;
/