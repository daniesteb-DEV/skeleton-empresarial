-- Factura_caracter_especial_TRIGGER_FUNCTION
CREATE OR REPLACE FUNCTION Factura_caracter_especial_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
begin
	new.facpernombre = reemplazarcaracteresespeciales(new.facpernombre);
return new;
end;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER Factura_caracter_especial
AFTER INSERT OR UPDATE 
ON Factura 
FOR EACH ROW
EXECUTE PROCEDURE Factura_caracter_especial_TRIGGER_FUNCTION();

-- actualizarTerminar_TRIGGER_FUNCTION
CREATE OR REPLACE FUNCTION actualizarTerminar_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
UPDATE RevisionEstado
SET ReFinalizada = false
FROM RevisionEstado t
WHERE t.Reid = new.ReId;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER actualizarTerminar
AFTER INSERT 
ON RevisionEstado
FOR EACH ROW
EXECUTE PROCEDURE actualizarTerminar_TRIGGER_FUNCTION();

-- actualizarMostrarDT_TRIGGER_FUNCTION
CREATE OR REPLACE FUNCTION actualizarMostrarDT_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
UPDATE RevisionEstado
SET ReFinalizada = false
FROM RevisionEstado t
WHERE t.Reid = new.ReId;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER actualizarMostrarDT
AFTER INSERT 
ON RevisionEstado
FOR EACH ROW
EXECUTE PROCEDURE actualizarMostrarDT_TRIGGER_FUNCTION();

-- uppercase_tri_Zona_TRIGGER_FUNCTION
CREATE OR REPLACE FUNCTION uppercase_tri_Zona_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(ZonNombre)
THEN
UPDATE Zona
SET ZonNombre = upper(i.ZonNombre)
FROM Zona t
JOIN inserted i ON t.ZonId = i.ZonId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Zona
AFTER INSERT OR UPDATE 
ON Zona
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Zona_TRIGGER_FUNCTION();

-- uppercase_tri_Usuario_TRIGGER_FUNCTION
CREATE OR REPLACE FUNCTION uppercase_tri_Usuario_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(UsuLogin)
THEN
UPDATE Usuario
SET UsuLogin = upper(i.UsuLogin)
FROM Usuario t
JOIN inserted i ON t.UsuId = i.UsuId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Usuario
AFTER INSERT OR UPDATE 
ON Usuario
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Usuario_TRIGGER_FUNCTION();

CREATE OR REPLACE FUNCTION uppercase_tri_TipoFormaPago_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(TpfDescripcion)
THEN
UPDATE TipoFormaPago
SET TpfDescripcion = upper(i.TpfDescripcion)
FROM TipoFormaPago t
JOIN inserted i ON t.TpfId = i.TpfId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_TipoFormaPago
AFTER INSERT OR UPDATE 
ON TipoFormaPago 
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_TipoFormaPago_TRIGGER_FUNCTION();

CREATE OR REPLACE FUNCTION uppercase_tri_Rol_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(RolNombre)
THEN
UPDATE Rol
SET RolNombre = upper(i.RolNombre)
FROM Rol t
JOIN inserted i ON t.RolId = i.RolId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Rol
AFTER INSERT OR UPDATE 
ON Rol 
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Rol_TRIGGER_FUNCTION();

CREATE OR REPLACE FUNCTION uppercase_tri_Provincia_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(ProNombre)
THEN
UPDATE Provincia
SET ProNombre = upper(i.ProNombre)
FROM Provincia t
JOIN inserted i ON t.ProId = i.ProId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Provincia
AFTER INSERT OR UPDATE 
ON Provincia 
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Provincia_TRIGGER_FUNCTION();

CREATE OR REPLACE FUNCTION uppercase_tri_Pais_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(PaiNombre)
THEN
UPDATE Pais
SET PaiNombre = upper(i.PaiNombre)
FROM Pais t
JOIN inserted i ON t.PaiId = i.PaiId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Pais
AFTER INSERT OR UPDATE 
ON Pais 
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Pais_TRIGGER_FUNCTION();

CREATE OR REPLACE FUNCTION uppercase_tri_Institucion_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(InsNombre)
THEN
UPDATE Institucion
SET InsNombre = upper(i.InsNombre)
FROM Institucion t
JOIN inserted i ON t.InsId = i.InsId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Institucion
AFTER INSERT OR UPDATE 
ON Institucion 
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Institucion_TRIGGER_FUNCTION();

CREATE OR REPLACE FUNCTION uppercase_tri_Config_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(ConfigDescripcion)
THEN
UPDATE Config
SET ConfigDescripcion = upper(i.ConfigDescripcion)
FROM Config t
JOIN inserted i ON t.ConfigId = i.ConfigId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Config
AFTER INSERT OR UPDATE 
ON Config 
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Config_TRIGGER_FUNCTION();

CREATE OR REPLACE FUNCTION uppercase_tri_Ciudad_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(CiuNombre)
THEN
UPDATE Ciudad
SET CiuNombre = upper(i.CiuNombre)
FROM Ciudad t
JOIN inserted i ON t.CiuId = i.CiuId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Ciudad
AFTER INSERT OR UPDATE 
ON Ciudad 
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Ciudad_TRIGGER_FUNCTION();

CREATE OR REPLACE FUNCTION uppercase_tri_Canton_TRIGGER_FUNCTION()
RETURNS TRIGGER
AS $$
BEGIN
IF UPDATE(CanNombre)
THEN
UPDATE Canton
SET CanNombre = upper(i.CanNombre)
FROM Canton t
JOIN inserted i ON t.CanId = i.CanId;
END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER uppercase_tri_Canton
AFTER INSERT OR UPDATE 
ON Canton 
FOR EACH ROW
EXECUTE PROCEDURE uppercase_tri_Canton_TRIGGER_FUNCTION();
