CREATE VIEW ListaMenu AS 
select MenId, MenPadre, MenNombre, MenLink, MenIcono, MenEstado, MenAgrupa2, 0 as Nivel from Menu b where b.MenPadre is null
union all
select b.MenId, b.MenPadre, b.MenNombre, b.MenLink, b.MenIcono, b.MenEstado, b.MenAgrupa2, 1 as Nivel from Menu b join Menu m1 on b.MenPadre =m1.MenId