CREATE OR REPLACE FUNCTION GenerarRepUaf(
vanio int,
vmes int,
vdd varchar(8)
) RETURNS VOID as $$
begin
delete from uaf;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%PROMESA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'73' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%PROMESA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%COMPRAVENTA%' and contrato.con_contrato not like '%MIDUVI%' and contrato.con_contrato not like '%HIPOTECA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'74' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%COMPRAVENTA%' and contrato.con_contrato not like '%MIDUVI%' and contrato.con_contrato not like '%HIPOTECA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%COMPRAVENTA%' and contrato.con_contrato like '%MIDUVI%' and contrato.con_contrato not like '%HIPOTECA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'75' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%COMPRAVENTA%' and contrato.con_contrato like '%MIDUVI%' and contrato.con_contrato not like '%HIPOTECA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%COMPRAVENTA%' and contrato.con_contrato not like '%MIDUVI%' and contrato.con_contrato like '%HIPOTECA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'76' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%COMPRAVENTA%' and contrato.con_contrato not like '%MIDUVI%' and contrato.con_contrato like '%HIPOTECA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato not like '%COMPRAVENTA%' and contrato.con_contrato not like '%MIDUVI%' and contrato.con_contrato like '%HIPOTECA%' and contrato.con_contrato not like '%ABIERTA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'77' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato not like '%COMPRAVENTA%' and contrato.con_contrato not like '%MIDUVI%' and contrato.con_contrato like '%HIPOTECA%' and contrato.con_contrato not like '%ABIERTA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato not like '%COMPRAVENTA%' and (contrato.con_contrato like '%IESS%' or contrato.con_contrato like '%BEV%' or contrato.con_contrato like '%MUNICIP%' or contrato.con_contrato like '%ASOCIACION%' or contrato.con_contrato like '%MUTUALISTA%' or contrato.con_contrato like '%COOP%') and contrato.con_contrato like '%HIPOTECA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'78' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato not like '%COMPRAVENTA%' and (contrato.con_contrato like '%IESS%' or contrato.con_contrato like '%BEV%' or contrato.con_contrato like '%MUNICIP%' or contrato.con_contrato like '%ASOCIACION%' or contrato.con_contrato like '%MUTUALISTA%' or contrato.con_contrato like '%COOP%') and contrato.con_contrato like '%HIPOTECA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato not like '%COMPRAVENTA%' and contrato.con_contrato not like '%MIDUVI%' and contrato.con_contrato like '%HIPOTECA%' and contrato.con_contrato like '%ABIERTA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'79' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato not like '%COMPRAVENTA%' and contrato.con_contrato not like '%MIDUVI%' and contrato.con_contrato like '%HIPOTECA%' and contrato.con_contrato like '%ABIERTA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato not like '%COMPRAVENTA%' and contrato.con_contrato like '%MIDUVI%' and contrato.con_contrato like '%HIPOTECA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'80' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato not like '%COMPRAVENTA%' and contrato.con_contrato like '%MIDUVI%' and contrato.con_contrato like '%HIPOTECA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%DONACION%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'81' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%DONACION%';	
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%PERMUTA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;	
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'82' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%PERMUTA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%LIQUIDAC%SOCIEDAD%CONYUGAL%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'83' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%LIQUIDAC%SOCIEDAD%CONYUGAL%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%LIQUIDAC%SOCIEDAD%BIENES%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'84' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%LIQUIDAC%SOCIEDAD%BIENES%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%DACION EN PAGO%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'85' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%DACION EN PAGO%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%CESION%DERECHO%ONEROSO%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'86' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%CESION%DERECHO%ONEROSO%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%COMODATO%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'87' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%COMODATO%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%CONSTITUC%CONSORCIO%CUANTIA%DETERM%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'88' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%CONSTITUC%CONSORCIO%CUANTIA%DETERM%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%TRASPASO%CREDITO%CUANTIA%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'89' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%TRASPASO%CREDITO%CUANTIA%';
insert into uaf select * from uafaux;
delete from uafaux;
delete from uafauxgrupo;
insert into uafauxgrupo select sum(con_cuantia)as con_total,con_cedula,con_nombre,con_contratante from proforma,contrato,finalizado,contratante where pro_codigo=con_proforma and con_id=fin_id and con_id=contratante.con_contrato and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%CESION%PARTICIPACION%' group by con_cedula,con_nombre,con_contratante having sum(con_cuantia)>=10000;
insert into uafaux select distinct pro_codigo,con_id,con_repertorio as NIT,CAST(pro_fechaing AS varchar(8)) as FCR,'90' as TTM,din_descripcion as DTM,cer_codigocat as CCA,floor(con_cuantia) as VCC,left(din_descripcion,3) as TTB,din_descripcion as DRB,'1705' as CBC,'10165' as CDR,vdd as FCT from proforma,contrato,cercontrato,dinardap,contratante,uafauxgrupo where pro_codigo=con_proforma and con_id=cer_id and con_id=din_id and con_id=contratante.con_contrato and contratante.con_cedula=uafauxgrupo.con_cedula and contratante.con_nombre=uafauxgrupo.con_nombre and contratante.con_contratante=uafauxgrupo.con_contratante and extract(month from pro_fechaing)=vmes and extract(year from pro_fechaing)=vanio and pro_status=1 and con_repertorio<100000 and contrato.con_contrato like '%CESION%PARTICIPACION%';
insert into uaf select * from uafaux;
delete from uafaux;
insert into uafaux select distinct null as pro_codigo,con_id,'' as NIT,'' as FCR,'' as TTM,'' as DTM,'' as CCA,null as VCC,'' as TTB,'' as DRB,'' as CBC,'' as CDR,'' as FCT from uaf;
update uafaux set uafaux.pro_codigo=uaf.pro_codigo,uafaux.NIT=uaf.NIT,uafaux.FCR=uaf.FCR,uafaux.TTM=uaf.TTM,uafaux.DTM=uaf.DTM,uafaux.CCA=uaf.CCA,uafaux.VCC=uaf.VCC,uafaux.TTB=uaf.TTB,uafaux.DRB=uaf.DRB,uafaux.CBC=uaf.CBC,uafaux.CDR=uaf.CDR,uafaux.FCT=uaf.FCT from uafaux,uaf where uafaux.con_id=uaf.con_id;
delete from uaf;
insert into uaf select * from uafaux;
delete from uafcontr;
insert into uafcontr select contratante.con_contrato,contratante.con_idc,'' as TII,contratante.con_cedula as IDI,contratante.con_nombre as NRI,'ECU' as NAI,tipo_contratante.con_roluaf as RDI,tipo_contratante.con_papeluaf as PDI from uaf,contratante,tipo_contratante where uaf.con_id=contratante.con_contrato and contratante.con_contratante=tipo_contratante.con_nombre;
update uafcontr set TII='C' where length(rtrim(IDI))=10 and (left(IDI,2)='01' or left(IDI,2)='02' or left(IDI,2)='03' or left(IDI,2)='04' or left(IDI,2)='05' or left(IDI,2)='06' or left(IDI,2)='07' or left(IDI,2)='08' or left(IDI,2)='09' or left(IDI,2)='10' or left(IDI,2)='11' or left(IDI,2)='12' or left(IDI,2)='13' or left(IDI,2)='14' or left(IDI,2)='15' or left(IDI,2)='16' or left(IDI,2)='17' or left(IDI,2)='18' or left(IDI,2)='19' or left(IDI,2)='20' or left(IDI,2)='21' or left(IDI,2)='22' or left(IDI,2)='23' or left(IDI,2)='24');
update uafcontr set TII='R' where length(rtrim(IDI))=13 and right(IDI,3)='001';
update uafcontr set TII='A' where TII='';
end;
$$ LANGUAGE plpgsql;

create or replace function GenerarRepDinardap(
vfechainicio date,
vfechafin date
) returns void as $$

declare v_nProvincia varchar(25);
 v_nCanton varchar(25);
 v_nRegistro varchar(25);
begin
v_nProvincia = '';
v_nCanton = 'ruminahui';
v_nRegistro = 'RMPMGADMUR';
delete from rep_dinardap;
insert into rep_dinardap select contrato.con_id as rep_id,contratante.con_nombre as rep_apellidos,contratante.con_nombre as rep_nombres,contratante.con_cedula as rep_numid,contratante.con_contratante as rep_tipcomp,contratante.con_nombre as rep_razsoc,contrato.con_contrato as rep_tipcont,contrato.con_ninscripcion as rep_numins,CAST(pro_fechaing AS varchar(20)) as rep_fecins,'' as rep_clacat,'' as rep_descr,libro.lib_nombre as rep_libro,v_nProvincia as rep_prov,'' as rep_zona,'' as rep_superf,null as rep_lorienta,null as rep_ldescr,proforma.pro_nomparroquia as rep_parroquia,v_nCanton as rep_canton,contrato.con_cuantia as rep_cuantia,v_nRegistro + cast(contratante.con_idc as varchar(12)) as rep_idsr,'' as rep_numjui,'Vigente' as rep_estado,'RP. ' || v_nCanton as rep_ubidato,'' as rep_ultmodi,proforma.pro_notaria as rep_notaria,'' as rep_cannot,'' as rep_fecesc from proforma,contrato,contratante,tipo_contrato,libro where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=contratante.con_contrato and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and ((to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'>= vfechainicio and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'<= vfechafin)or(cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))>= vfechainicio and cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))<= vfechafin)) and proforma.pro_status=1 and contrato.con_repertorio<100000 and proforma.pro_tiptra='E' and contrato.con_vigente=0;
insert into rep_dinardap select contrato.con_id as rep_id,contratante.con_nombre as rep_apellidos,contratante.con_nombre as rep_nombres,contratante.con_cedula as rep_numid,contratante.con_contratante as rep_tipcomp,contratante.con_nombre as rep_razsoc,contrato.con_contrato as rep_tipcont,contrato.con_ninscripcion as rep_numins,CAST(pro_fechaing AS varchar(20)) as rep_fecins,'' as rep_clacat,'' as rep_descr,libro.lib_nombre as rep_libro,v_nProvincia as rep_prov,'' as rep_zona,'' as rep_superf,null as rep_lorienta,null as rep_ldescr,proforma.pro_nomparroquia as rep_parroquia,v_nCanton as rep_canton,contrato.con_cuantia as rep_cuantia,v_nRegistro + cast(contratante.con_idc as varchar(12)) as rep_idsr,'' as rep_numjui,'No vigente' as rep_estado,'RP. ' || v_nCanton as rep_ubidato,'' as rep_ultmodi,proforma.pro_notaria as rep_notaria,'' as rep_cannot,'' as rep_fecesc from proforma,contrato,contratante,tipo_contrato,libro where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=contratante.con_contrato and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and ((cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))>= vfechainicio and cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))<=vfechafin)or(cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))>=vfechainicio and cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))<=vfechafin)) and proforma.pro_status=1 and contrato.con_repertorio<100000 and proforma.pro_tiptra='E' and contrato.con_vigente=1;
insert into rep_dinardap select contrato.con_id as rep_id,contratante.con_nombre as rep_apellidos,contratante.con_nombre as rep_nombres,contratante.con_cedula as rep_numid,contratante.con_contratante as rep_tipcomp,contratante.con_nombre as rep_razsoc,contrato.con_contrato as rep_tipcont,contrato.con_ninscripcion as rep_numins,CAST(pro_fechaing AS varchar(20)) as rep_fecins,'' as rep_clacat,'' as rep_descr,libro.lib_nombre as rep_libro,v_nProvincia as rep_prov,'' as rep_zona,'' as rep_superf,null as rep_lorienta,null as rep_ldescr,proforma.pro_nomparroquia as rep_parroquia,v_nCanton as rep_canton,contrato.con_cuantia as rep_cuantia,v_nRegistro + cast(contratante.con_idc as varchar(12)) as rep_idsr,proforma.pro_numjuicio as rep_numjui,'Vigente' as rep_estado,'RP. ' || v_nCanton as rep_ubidato,'' as rep_ultmodi,proforma.pro_juzgado as rep_notaria,'' as rep_cannot,'' as rep_fecesc from proforma,contrato,contratante,tipo_contrato,libro where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=contratante.con_contrato and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and ((to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'>= vfechainicio and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'<= vfechafin)or(cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))>= vfechainicio and cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))<= vfechafin)) and proforma.pro_status=1 and contrato.con_repertorio<100000 and proforma.pro_tiptra='J' and contrato.con_vigente=0;
insert into rep_dinardap select contrato.con_id as rep_id,contratante.con_nombre as rep_apellidos,contratante.con_nombre as rep_nombres,contratante.con_cedula as rep_numid,contratante.con_contratante as rep_tipcomp,contratante.con_nombre as rep_razsoc,contrato.con_contrato as rep_tipcont,contrato.con_ninscripcion as rep_numins,CAST(pro_fechaing AS varchar(20)) as rep_fecins,'' as rep_clacat,'' as rep_descr,libro.lib_nombre as rep_libro,v_nProvincia as rep_prov,'' as rep_zona,'' as rep_superf,null as rep_lorienta,null as rep_ldescr,proforma.pro_nomparroquia as rep_parroquia,v_nCanton as rep_canton,contrato.con_cuantia as rep_cuantia,v_nRegistro + cast(contratante.con_idc as varchar(12)) as rep_idsr,proforma.pro_numjuicio as rep_numjui,'No vigente' as rep_estado,'RP. ' || v_nCanton as rep_ubidato,'' as rep_ultmodi,proforma.pro_juzgado as rep_notaria,'' as rep_cannot,'' as rep_fecesc from proforma,contrato,contratante,tipo_contrato,libro where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=contratante.con_contrato and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and ((to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'>= vfechainicio and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'<= vfechafin)or(cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))>= vfechainicio and cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))<= vfechafin)) and proforma.pro_status=1 and contrato.con_repertorio<100000 and proforma.pro_tiptra='J' and contrato.con_vigente=1;
insert into rep_dinardap select contrato.con_id as rep_id,contratante.con_nombre as rep_apellidos,contratante.con_nombre as rep_nombres,contratante.con_cedula as rep_numid,contratante.con_contratante as rep_tipcomp,contratante.con_nombre as rep_razsoc,contrato.con_contrato as rep_tipcont,contrato.con_ninscripcion as rep_numins,CAST(pro_fechaing AS varchar(20)) as rep_fecins,'' as rep_clacat,'' as rep_descr,libro.lib_nombre as rep_libro,v_nProvincia as rep_prov,'' as rep_zona,'' as rep_superf,null as rep_lorienta,null as rep_ldescr,proforma.pro_nomparroquia as rep_parroquia,v_nCanton as rep_canton,contrato.con_cuantia as rep_cuantia,v_nRegistro + cast(contratante.con_idc as varchar(12)) as rep_idsr,'' as rep_numjui,'Vigente' as rep_estado,'RP. ' || v_nCanton as rep_ubidato,'' as rep_ultmodi,proforma.pro_notaria as rep_notaria,'' as rep_cannot,'' as rep_fecesc from proforma,contrato,contratante,tipo_contrato,libro,dinardap where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=contratante.con_contrato and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and contrato.con_id=dinardap.din_id and cast(floor(cast(dinardap.din_fecha as double precision))as timestamp(3))>= vfechainicio and cast(floor(cast(dinardap.din_fecha as double precision))as timestamp(3))<= vfechafin and (cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))< vfechainicio or cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))> vfechafin) and (cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))< vfechainicio or cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))> vfechafin) and proforma.pro_status=1 and contrato.con_repertorio<100000 and proforma.pro_tiptra='E' and contrato.con_vigente=0;
insert into rep_dinardap select contrato.con_id as rep_id,contratante.con_nombre as rep_apellidos,contratante.con_nombre as rep_nombres,contratante.con_cedula as rep_numid,contratante.con_contratante as rep_tipcomp,contratante.con_nombre as rep_razsoc,contrato.con_contrato as rep_tipcont,contrato.con_ninscripcion as rep_numins,CAST(pro_fechaing AS varchar(20)) as rep_fecins,'' as rep_clacat,'' as rep_descr,libro.lib_nombre as rep_libro,v_nProvincia as rep_prov,'' as rep_zona,'' as rep_superf,null as rep_lorienta,null as rep_ldescr,proforma.pro_nomparroquia as rep_parroquia,v_nCanton as rep_canton,contrato.con_cuantia as rep_cuantia,v_nRegistro + cast(contratante.con_idc as varchar(12)) as rep_idsr,'' as rep_numjui,'No vigente' as rep_estado,'RP. ' || v_nCanton as rep_ubidato,'' as rep_ultmodi,proforma.pro_notaria as rep_notaria,'' as rep_cannot,'' as rep_fecesc from proforma,contrato,contratante,tipo_contrato,libro,dinardap where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=contratante.con_contrato and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and contrato.con_id=dinardap.din_id and cast(floor(cast(dinardap.din_fecha as double precision))as timestamp(3))>= vfechainicio and cast(floor(cast(dinardap.din_fecha as double precision))as timestamp(3))<= vfechafin and (cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))< vfechainicio or cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))> vfechafin) and (cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))< vfechainicio or cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))> vfechafin) and proforma.pro_status=1 and contrato.con_repertorio<100000 and proforma.pro_tiptra='E' and contrato.con_vigente=1;
insert into rep_dinardap select contrato.con_id as rep_id,contratante.con_nombre as rep_apellidos,contratante.con_nombre as rep_nombres,contratante.con_cedula as rep_numid,contratante.con_contratante as rep_tipcomp,contratante.con_nombre as rep_razsoc,contrato.con_contrato as rep_tipcont,contrato.con_ninscripcion as rep_numins,CAST(pro_fechaing AS varchar(20)) as rep_fecins,'' as rep_clacat,'' as rep_descr,libro.lib_nombre as rep_libro,v_nProvincia as rep_prov,'' as rep_zona,'' as rep_superf,null as rep_lorienta,null as rep_ldescr,proforma.pro_nomparroquia as rep_parroquia,v_nCanton as rep_canton,contrato.con_cuantia as rep_cuantia,v_nRegistro + cast(contratante.con_idc as varchar(12)) as rep_idsr,proforma.pro_numjuicio as rep_numjui,'Vigente' as rep_estado,'RP. ' || v_nCanton as rep_ubidato,'' as rep_ultmodi,proforma.pro_juzgado as rep_notaria,'' as rep_cannot,'' as rep_fecesc from proforma,contrato,contratante,tipo_contrato,libro,dinardap where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=contratante.con_contrato and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and contrato.con_id=dinardap.din_id and cast(floor(cast(dinardap.din_fecha as double precision))as timestamp(3))>= vfechainicio and cast(floor(cast(dinardap.din_fecha as double precision))as timestamp(3))<= vfechafin and (cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))< vfechainicio or cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))> vfechafin) and (cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))< vfechainicio or cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))> vfechafin) and proforma.pro_status=1 and contrato.con_repertorio<100000 and proforma.pro_tiptra='J' and contrato.con_vigente=0;
insert into rep_dinardap select contrato.con_id as rep_id,contratante.con_nombre as rep_apellidos,contratante.con_nombre as rep_nombres,contratante.con_cedula as rep_numid,contratante.con_contratante as rep_tipcomp,contratante.con_nombre as rep_razsoc,contrato.con_contrato as rep_tipcont,contrato.con_ninscripcion as rep_numins,CAST(pro_fechaing AS varchar(20)) as rep_fecins,'' as rep_clacat,'' as rep_descr,libro.lib_nombre as rep_libro,v_nProvincia as rep_prov,'' as rep_zona,'' as rep_superf,null as rep_lorienta,null as rep_ldescr,proforma.pro_nomparroquia as rep_parroquia,v_nCanton as rep_canton,contrato.con_cuantia as rep_cuantia,v_nRegistro + cast(contratante.con_idc as varchar(12)) as rep_idsr,proforma.pro_numjuicio as rep_numjui,'No vigente' as rep_estado,'RP. ' || v_nCanton as rep_ubidato,'' as rep_ultmodi,proforma.pro_juzgado as rep_notaria,'' as rep_cannot,'' as rep_fecesc from proforma,contrato,contratante,tipo_contrato,libro,dinardap where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=contratante.con_contrato and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and contrato.con_id=dinardap.din_id and cast(floor(cast(dinardap.din_fecha as double precision))as timestamp(3))>=vfechainicio and cast(floor(cast(dinardap.din_fecha as double precision))as timestamp(3))<=vfechafin and (cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))<vfechainicio or cast(floor(cast(proforma.pro_fechaing as double precision))as timestamp(3))>vfechafin) and (cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))<vfechainicio or cast(floor(cast(contrato.con_fcancela as double precision))as timestamp(3))>vfechafin) and proforma.pro_status=1 and contrato.con_repertorio<100000 and proforma.pro_tiptra='J' and contrato.con_vigente=1;
update rep_dinardap set rep_clacat=cer_codigocat,rep_fecesc=CAST(cer_fechacel AS varchar(20)) from rep_dinardap,cercontrato where rep_id=cer_id;
update rep_dinardap set rep_descr=din_descripcion,rep_zona=din_zona,rep_superf=din_superficie,rep_lorienta=din_lorientacion,rep_ldescr=din_ldescripcion,rep_ultmodi=CAST(din_fecha AS varchar(20)),rep_cannot=din_canton from rep_dinardap,dinardap where rep_id=din_id;						
end;
$$ language plpgsql;

create or replace function GenerarRepRepertorio(
vfechainicio date,
vfechafin date,
vtipo varchar(20)
) returns void as $$
begin
	delete from rep_repertorio;
	insert into rep_repertorio (select c1.con_repertorio as rep_repertorio,contratante.con_nombre as rep_nombre,contratante.con_contratante as rep_contratante,proforma.pro_nomparroquia as rep_nomparroquia,c1.con_contrato as rep_contrato,proforma.pro_fechaing as rep_fechaing,libro.lib_nombre as rep_libro,c1.con_ninscripcion as rep_ninscripcion,pro_notaria as rep_notaria,c1.con_cuantia as rep_cuantia,true as rep_anulado,contratante.con_idc as rep_idc,c1.con_id as rep_tramite,tipo_contrato.cnt_tipo as rep_tipo,'' as rep_fechacel from proforma,contrato c1,contratante,tipo_contrato,libro where proforma.pro_codigo=c1.con_proforma and c1.con_id=contratante.con_contrato and c1.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'>= vfechainicio and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'<= vfechafin and proforma.pro_status=2 and proforma.pro_tiptra='E' and c1.con_repertorio<100000 and con_idc in(select con_idc from contratante where con_contrato=c1.con_id order by con_idc LIMIT 2));
	insert into rep_repertorio (select c1.con_repertorio as rep_repertorio,contratante.con_nombre as rep_nombre,contratante.con_contratante as rep_contratante,proforma.pro_nomparroquia as rep_nomparroquia,c1.con_contrato as rep_contrato,proforma.pro_fechaing as rep_fechaing,libro.lib_nombre as rep_libro,c1.con_ninscripcion as rep_ninscripcion,pro_juzgado as rep_notaria,c1.con_cuantia as rep_cuantia,true as rep_anulado,contratante.con_idc as rep_idc,c1.con_id as rep_tramite,tipo_contrato.cnt_tipo as rep_tipo,'' as rep_fechacel from proforma,contrato c1,contratante,tipo_contrato,libro where proforma.pro_codigo=c1.con_proforma and c1.con_id=contratante.con_contrato and c1.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'>= vfechainicio and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'<= vfechafin and proforma.pro_status=2 and proforma.pro_tiptra='J' and c1.con_repertorio<100000 and con_idc in(select con_idc from contratante where con_contrato=c1.con_id order by con_idc LIMIT 2));
	insert into rep_repertorio (select c1.con_repertorio as rep_repertorio,contratante.con_nombre as rep_nombre,contratante.con_contratante as rep_contratante,proforma.pro_nomparroquia as rep_nomparroquia,c1.con_contrato as rep_contrato,proforma.pro_fechaing as rep_fechaing,libro.lib_nombre as rep_libro,c1.con_ninscripcion as rep_ninscripcion,pro_notaria as rep_notaria,c1.con_cuantia as rep_cuantia,false as rep_anulado,contratante.con_idc as rep_idc,c1.con_id as rep_tramite,tipo_contrato.cnt_tipo as rep_tipo,'' as rep_fechacel from proforma,contrato c1,contratante,tipo_contrato,libro where proforma.pro_codigo=c1.con_proforma and c1.con_id=contratante.con_contrato and c1.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'>= vfechainicio and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'<= vfechafin and proforma.pro_status=1 and proforma.pro_tiptra='E' and c1.con_repertorio<100000 and con_idc in(select con_idc from contratante where con_contrato=c1.con_id order by con_idc LIMIT 2));
	insert into rep_repertorio (select c1.con_repertorio as rep_repertorio,contratante.con_nombre as rep_nombre,contratante.con_contratante as rep_contratante,proforma.pro_nomparroquia as rep_nomparroquia,c1.con_contrato as rep_contrato,proforma.pro_fechaing as rep_fechaing,libro.lib_nombre as rep_libro,c1.con_ninscripcion as rep_ninscripcion,pro_juzgado as rep_notaria,c1.con_cuantia as rep_cuantia,false as rep_anulado,contratante.con_idc as rep_idc,c1.con_id as rep_tramite,tipo_contrato.cnt_tipo as rep_tipo,'' as rep_fechacel from proforma,contrato c1,contratante,tipo_contrato,libro where proforma.pro_codigo=c1.con_proforma and c1.con_id=contratante.con_contrato and c1.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro=libro.lib_numero and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'>= vfechainicio and to_timestamp(cast(to_char((proforma.pro_fechaing)::TIMESTAMP,'yyyymmddhhmiss') as BigInt)::BigInt::text,'yyyymmddhhmiss')::timestamp at time zone 'UTC' at time zone 'CST'<= vfechafin and proforma.pro_status=1 and proforma.pro_tiptra='J' and c1.con_repertorio<100000 and con_idc in(select con_idc from contratante where con_contrato=c1.con_id order by con_idc LIMIT 2));
	update rep_repertorio set rep_libro=right(rep_libro,length(rtrim(rep_libro))-12);
	update rep_repertorio set rep_fechacel=CAST(cer_fechacel AS varchar(255)) from cercontrato where rep_repertorio.rep_tramite=cercontrato.cer_id;
	if(vtipo = 'Repertorio')
		then
			update rep_repertorio set rep_nomparroquia='';
			update rep_repertorio set rep_nomparroquia='TRAMITE ANULADO' where rep_anulado is true;
			update rep_repertorio set rep_nomparroquia=repertorio.rep_motivo from repertorio where rep_repertorio.rep_repertorio=repertorio.rep_repertorio and extract(year from rep_fechaing)=repertorio.rep_anio;
	elsif(vtipo = 'RepertorioDin')
		then
			update rep_repertorio set rep_nomparroquia='';
			update rep_repertorio set rep_nomparroquia='TRAMITE ANULADO' where rep_anulado is true;
			update rep_repertorio set rep_nomparroquia=repertorio.rep_motivo from repertorio where rep_repertorio.rep_repertorio=repertorio.rep_repertorio and extract(year from rep_fechaing)=repertorio.rep_anio;
	elsif(vtipo = 'Repertorio2')
		then
			update rep_repertorio set rep_nomparroquia='';
			update rep_repertorio set rep_nomparroquia='TRAMITE ANULADO' where rep_anulado is true;
			update rep_repertorio set rep_nomparroquia=repertorio.rep_motivo from repertorio where rep_repertorio.rep_repertorio=repertorio.rep_repertorio and extract(year from rep_fechaing)=repertorio.rep_anio;
	else
			update rep_repertorio set rep_notaria='';
			update rep_repertorio set rep_notaria=pro_revision from proforma,contrato where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=rep_tramite;
	end if;
end;
$$ language plpgsql;

create or replace function GenerarRepSriAne(
vmes varchar(2),
vanio varchar(5)
)returns void as $$
begin
delete from SRI_Anexo;
insert into SRI_Anexo select distinct contrato.con_id as sri_id,'' as sri_contre,'' as sri_entrega,'' as sri_tipoe,'' as sri_ide,cercontrato.cer_otorgante as sri_otorgante,'' as sri_relacione,'' as sri_contrr,'' as sri_recibe,'' as sri_tipor,'' as sri_idr,'' as sri_relacionr,contrato.con_contrato as sri_contrato,'' as sri_transaccion,proforma.pro_fechaing as sri_finscrip,cercontrato.cer_fechacel as sri_fescrit,contrato.con_cuantia as sri_monto,contrato.con_cuantia as sri_avaluo,proforma.pro_nomparroquia as sri_parroquia,dinardap.din_descripcion as sri_direccion,cercontrato.cer_crva as sri_numpredio,cercontrato.cer_codigocat as sri_codigocat from proforma,contrato,cercontrato,dinardap,contratante,tipo_contratante where proforma.pro_codigo=contrato.con_proforma and contrato.con_id=cercontrato.cer_id and contrato.con_id=dinardap.din_id and contrato.con_id=contratante.con_contrato and contratante.con_contratante=tipo_contratante.con_nombre and proforma.pro_status=1 and con_repertorio<100000 and cercontrato.cer_sri=1 and extract(month from proforma.pro_fechaing)= vmes and extract(year from proforma.pro_fechaing)= vanio;
update SRI_Anexo set sri_parroquia='2170501' where sri_parroquia='SANGOLQUI I';
update SRI_Anexo set sri_parroquia='2170502' where sri_parroquia='SAN PEDRO DE TABOADA';
update SRI_Anexo set sri_parroquia='2170503' where sri_parroquia='SAN RAFAEL';
update SRI_Anexo set sri_parroquia='2170550' where sri_parroquia='SANGOLQUI';
update SRI_Anexo set sri_parroquia='2170551' where sri_parroquia='COTOGCHOA';
update SRI_Anexo set sri_parroquia='2170552' where sri_parroquia='RUMIPAMBA';
update SRI_Anexo set sri_parroquia='' where sri_parroquia='GENERAL';
update SRI_Anexo set sri_contre=contratante.con_contratante,sri_ide=left(contratante.con_cedula,13) from SRI_Anexo,contratante,tipo_contratante where SRI_Anexo.sri_id=contratante.con_contrato and contratante.con_contratante=tipo_contratante.con_nombre and tipo_contratante.con_tipo='OTORGANTE';
update SRI_Anexo set sri_contrr=contratante.con_contratante,sri_idr=left(contratante.con_cedula,13) from SRI_Anexo,contratante,tipo_contratante where SRI_Anexo.sri_id=contratante.con_contrato and contratante.con_contratante=tipo_contratante.con_nombre and tipo_contratante.con_tipo='BENEFICIARIO';
update SRI_Anexo set sri_entrega='1' where sri_contre='otorgante';
update SRI_Anexo set sri_entrega='2' where sri_contre='propietario' or sri_contre='propietaria';
update SRI_Anexo set sri_entrega='3' where sri_contre='vendedor' or sri_contre='vendedora';
update SRI_Anexo set sri_entrega='4' where sri_contre='causante';
update SRI_Anexo set sri_entrega='1' where sri_entrega='';
update SRI_Anexo set sri_tipoe='1' where length(rtrim(sri_ide))=13 and right(sri_ide,3)='001';
update SRI_Anexo set sri_tipoe='2' where length(rtrim(sri_ide))=10;
update SRI_Anexo set sri_tipoe='3' where sri_tipoe='';
update SRI_Anexo set sri_relacione='1' where sri_otorgante='padres';
update SRI_Anexo set sri_relacione='2' where sri_otorgante='hijos';
update SRI_Anexo set sri_relacione='3' where sri_otorgante='abuelos';
update SRI_Anexo set sri_relacione='4' where sri_otorgante='nietos';
update SRI_Anexo set sri_relacione='5' where sri_otorgante='tios';
update SRI_Anexo set sri_relacione='6' where sri_otorgante='primos';
update SRI_Anexo set sri_relacione='7' where sri_otorgante='otros';
update SRI_Anexo set sri_recibe='5' where sri_contrr='beneficiario' or sri_contrr='beneficiaria';
update SRI_Anexo set sri_recibe='1' where sri_contrr='comprador' or sri_contrr='compradora';
update SRI_Anexo set sri_recibe='3' where sri_contrr='heredero' or sri_contrr='heredera' or sri_contrr='legatario';
update SRI_Anexo set sri_recibe='5' where sri_recibe='';
update SRI_Anexo set sri_recibe='6' where sri_entrega='2';
update SRI_Anexo set sri_tipor='1' where length(rtrim(sri_idr))=13 and right(sri_idr,3)='001';
update SRI_Anexo set sri_tipor='2' where length(rtrim(sri_idr))=10;
update SRI_Anexo set sri_tipor='3' where sri_tipor='';
update SRI_Anexo set sri_relacionr='1' where sri_relacione='2';
update SRI_Anexo set sri_relacionr='2' where sri_relacione='1';
update SRI_Anexo set sri_relacionr='3' where sri_relacione='4';
update SRI_Anexo set sri_relacionr='4' where sri_relacione='3';
update SRI_Anexo set sri_relacionr='6' where sri_relacione='6';
update SRI_Anexo set sri_relacionr='7' where sri_relacione='5' or sri_relacione='7';
update SRI_Anexo set sri_transaccion='2' where sri_contrato like '%compraventa%';
update SRI_Anexo set sri_transaccion='10' where sri_contrato='usufructo';
update SRI_Anexo set sri_transaccion='12' where sri_contrato like '%derechos y acciones%';
update SRI_Anexo set sri_transaccion='14' where sri_contrato like '%particion hereditaria%' or sri_contrato like '%testamento%';
update SRI_Anexo set sri_transaccion='11' where sri_transaccion='';
end;
$$ language plpgsql;

create or replace function GenerarRepProcesosDiarios (
vfechainicio date,
vfechafin date,
vlibro varchar(10),
vestado varchar(30)
) returns void as $$
begin
delete from rep_procesos;
if(vestado = 'EN PROCESO')
	then
	insert into rep_procesos select con_id as id,con_proforma as Factura,con_repertorio as Repertorio,con_contrato as Contrato,'P' as Origen,pro_razones as Razones,con_usuario as usuario,con_inscriptor as inscriptor,'EN PROCESO' as Nota,pro_revision as Revision from proforma inner join contrato on(pro_codigo=con_proforma) inner join tipo_contrato on(con_contrato=cnt_nombre) left join suspensa on(con_id=sus_contrato) left join finalizado on(con_id=fin_id) where convert(date, pro_fechaing)>= vfechainicio and convert(date, pro_fechaing) < vfechafin and pro_status=1 and cnt_libro= vlibro and sus_contrato is null and fin_id is null order by repertorio,id;
elsif(vestado = 'FINALIZADO')
	then
	insert into rep_procesos select con_id as id,con_proforma as Factura,con_repertorio as Repertorio,con_contrato as Contrato,'P' as Origen,pro_razones as Razones,con_usuario as usuario,con_inscriptor as inscriptor,'FINALIZADO' as Nota,pro_revision as Revision from proforma,contrato,finalizado,tipo_contrato where pro_codigo=con_proforma and con_id=fin_id and con_contrato=cnt_nombre and convert(date, pro_fechaing) >= vfechainicio and convert(date, pro_fechaing) < vfechafin and pro_status=1 and cnt_libro= vlibro order by repertorio,id;
elsif(vestado = 'SUSPENSO')
	then
	insert into rep_procesos select con_id as id,con_proforma as Factura,con_repertorio as Repertorio,con_contrato as Contrato,'P' as Origen,pro_razones as Razones,con_usuario as usuario,con_inscriptor as inscriptor,'SUSPENSO' as Nota,pro_revision as Revision from proforma,contrato,suspensa,tipo_contrato where pro_codigo=con_proforma and con_id=sus_contrato and con_contrato=cnt_nombre and convert(date, pro_fechaing) >= vfechainicio and convert(date, pro_fechaing) < vfechafin and pro_status=1 and cnt_libro= vlibro order by repertorio,id;
elsif(vestado = 'ANULADO')
	then
	insert into rep_procesos select con_id as id,con_proforma as Factura,con_repertorio as Repertorio,con_contrato as Contrato,'P' as Origen,pro_razones as Razones,con_usuario as usuario,con_inscriptor as inscriptor,'ANULADO' as Nota,pro_revision as Revision from proforma,contrato,tipo_contrato where pro_codigo=con_proforma and con_contrato=cnt_nombre and convert(date, pro_fechaing) >= vfechainicio and convert(date, pro_fechaing) < vfechafin and pro_status=2 and cnt_libro= vlibro order by repertorio,id;
elsif(vestado = 'TODOS')
	then
	insert into rep_procesos select con_id as id,con_proforma as Factura,con_repertorio as Repertorio,con_contrato as Contrato,'P' as Origen,pro_razones as Razones,con_usuario as usuario,con_inscriptor as inscriptor,'EN PROCESO' as Nota,pro_revision as Revision from proforma inner join contrato on(pro_codigo=con_proforma) inner join tipo_contrato on(con_contrato=cnt_nombre) left join suspensa on(con_id=sus_contrato) left join finalizado on(con_id=fin_id) where convert(date, pro_fechaing) >= vfechainicio and convert(date, pro_fechaing) < vfechafin and pro_status=1 and cnt_libro= vlibro and sus_contrato is null and fin_id is null union select con_id as id,con_proforma as Factura,con_repertorio as Repertorio,con_contrato as Contrato,'P' as Origen,pro_razones as Razones,con_usuario as usuario,con_inscriptor as inscriptor,'FINALIZADO' as Nota,pro_revision as Revision from proforma,contrato,finalizado,tipo_contrato where pro_codigo=con_proforma and con_id=fin_id and con_contrato=cnt_nombre and convert(date, pro_fechaing) >= vfechainicio and convert(date, pro_fechaing) < vfechafin and pro_status=1 and cnt_libro= vlibro union select con_id as id,con_proforma as Factura,con_repertorio as Repertorio,con_contrato as Contrato,'P' as Origen,pro_razones as Razones,con_usuario as usuario,con_inscriptor as inscriptor,'SUSPENSO' as Nota,pro_revision as Revision from proforma,contrato,suspensa,tipo_contrato where pro_codigo=con_proforma and con_id=sus_contrato and con_contrato=cnt_nombre and convert(date, pro_fechaing) >= vfechainicio and convert(date, pro_fechaing) < vfechafin and pro_status=1 and cnt_libro= vlibro union select con_id as id,con_proforma as Factura,con_repertorio as Repertorio,con_contrato as Contrato,'P' as Origen,pro_razones as Razones,con_usuario as usuario,con_inscriptor as inscriptor,'ANULADO' as Nota,pro_revision as Revision from proforma,contrato,tipo_contrato where pro_codigo=con_proforma and con_contrato=cnt_nombre and convert(date, pro_fechaing) >= vfechainicio and convert(date, pro_fechaing) < vfechafin and pro_status=2 and cnt_libro= vlibro order by repertorio,id;
end if;
end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION GenerarReporteCuadreAdmin(
vfechainicio DATE,
vfechafin DATE,
vusuario VARCHAR(255)
) RETURNS VOID AS $$
BEGIN
delete from Cuadre;
delete from CuadreAdicional;
if(vusuario is not null)
	then
		insert into Cuadre select pro_codigo,'P' as pro_tipocomp,null as pro_numerocomp,'' as pro_nombrefact,'' as pro_cedulafact,sum(con_valor) as pro_valreg,null as pro_valraz,null as pro_valgas,null as pro_fechaing,'' as pro_usuario from proforma,contrato,tipo_contrato where proforma.pro_codigo=contrato.con_proforma and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro<>50 and tipo_contrato.cnt_libro<>51 and cast(floor(cast(pro_fechaing as double precision))as timestamp(3))>=vfechainicio and cast(floor(cast(pro_fechaing as double precision))as timestamp(3))<= vfechafin and pro_usuario=vusuario and pro_status=1 group by pro_codigo;
else
	insert into Cuadre select pro_codigo,'P' as pro_tipocomp,null as pro_numerocomp,'' as pro_nombrefact,'' as pro_cedulafact,sum(con_valor) as pro_valreg,null as pro_valraz,null as pro_valgas,null as pro_fechaing,'' as pro_usuario from proforma,contrato,tipo_contrato where 
	proforma.pro_codigo=contrato.con_proforma and contrato.con_contrato=tipo_contrato.cnt_nombre and tipo_contrato.cnt_libro<>50 and tipo_contrato.cnt_libro<>51 and cast(floor(cast(pro_fechaing as double precision))as timestamp(3))>=vfechainicio and cast(floor(cast(pro_fechaing as double precision))as timestamp(3))<= vfechafin and pro_status=1 group by pro_codigo;
	end if;
update cuadre set cuadre.pro_numerocomp=proforma.pro_numerocomp,cuadre.pro_nombrefact=proforma.pro_nombrefact,cuadre.pro_cedulafact=proforma.pro_cedulafact,cuadre.pro_valraz=proforma.pro_valraz,cuadre.pro_valgas=proforma.pro_valgas,cuadre.pro_fechaing=proforma.pro_fechaing, cuadre.pro_usuario=right(proforma.pro_usuario,length(rtrim(proforma.pro_usuario))-5) from cuadre,proforma where cuadre.pro_codigo=proforma.pro_codigo and cuadre.pro_tipocomp='P';
if(vusuario is not null)
	then
	insert into Cuadre select pro_codigo,'C' as pro_tipocomp,null as pro_numerocomp,'' as pro_nombrefact,'' as pro_cedulafact,sum(con_valor) as pro_valreg,null as pro_valraz,null as pro_valgas,null as pro_fechaing,'' as pro_usuario from proforma,contrato,tipo_contrato where proforma.pro_codigo=contrato.con_proforma and contrato.con_contrato=tipo_contrato.cnt_nombre and (tipo_contrato.cnt_libro=50 or tipo_contrato.cnt_libro=51) and cast(floor(cast(pro_fechaing as double precision))as timestamp(3))>=vfechainicio and cast(floor(cast(pro_fechaing as double precision))as timestamp(3))<=vfechafin and pro_usuario=vusuario and pro_status=1 group by pro_codigo;
else
	insert into Cuadre select pro_codigo,'C' as pro_tipocomp,null as pro_numerocomp,'' as pro_nombrefact,'' as pro_cedulafact,sum(con_valor) as pro_valreg,null as pro_valraz,null as pro_valgas,null as pro_fechaing,'' as pro_usuario from proforma,contrato,tipo_contrato where proforma.pro_codigo=contrato.con_proforma and contrato.con_contrato=tipo_contrato.cnt_nombre and (tipo_contrato.cnt_libro=50 or tipo_contrato.cnt_libro=51) and cast(floor(cast(pro_fechaing as double precision))as timestamp(3))>=vfechainicio and cast(floor(cast(pro_fechaing as double precision))as timestamp(3))<=vfechafin and pro_status=1 group by pro_codigo;
	end if;
update cuadre set cuadre.pro_numerocomp=proforma.pro_numerocomp,cuadre.pro_nombrefact=proforma.pro_nombrefact,cuadre.pro_cedulafact=proforma.pro_cedulafact,cuadre.pro_valraz=0,cuadre.pro_valgas=0,cuadre.pro_fechaing=proforma.pro_fechaing,cuadre.pro_usuario=right(proforma.pro_usuario,length(rtrim(proforma.pro_usuario))-5) from cuadre,proforma where cuadre.pro_codigo=proforma.pro_codigo and cuadre.pro_tipocomp='C';
insert into CuadreAdicional select pro_codigo as ProCodigo, pro_tipocomp as ProTipoComp, null as ProNumeroFac, null as ProFormaPago from cuadre;
update CuadreAdicional set CuadreAdicional.ProNumeroFac=(select f.FacNumero from Factura f where f.FacId=proforma.pro_numerocomp), CuadreAdicional.ProFormaPago=(select ffp.FfpDescripcion from FacturaFormaPago ffp where ffp.FacId= proforma.pro_numerocomp) from CuadreAdicional,proforma where CuadreAdicional.ProCodigo=proforma.pro_codigo and (CuadreAdicional.ProTipocomp='P' OR CuadreAdicional.ProTipocomp='C');
END;
$$ LANGUAGE plpgsql;

CREATE TYPE return_type as 
(tempValReg DOUBLE PRECISION, tempValRaz DOUBLE PRECISION, tempValIva DOUBLE PRECISION, tempValGas DOUBLE PRECISION, tempValSubTot DOUBLE PRECISION, tempValTot DOUBLE PRECISION);
CREATE OR REPLACE FUNCTION getValoresProforma
 (
 vProCodigo INT
 )
returns return_type
AS $$
DECLARE
v_tempValReg DOUBLE PRECISION;
v_tempValRaz DOUBLE PRECISION;
v_tempValIva DOUBLE PRECISION;
v_tempValGas DOUBLE PRECISION;
v_tempValSubTot DOUBLE PRECISION;
v_tempValTot DOUBLE PRECISION;
v_OpcLimitep DOUBLE PRECISION;
v_OpcRazon DOUBLE PRECISION;
v_OpcGastos DOUBLE PRECISION;
v_ProExcencion VARCHAR(50);
v_ProRazones INT;
v_Razones DOUBLE PRECISION;
v_ExcValor INT;
v_auxValor INT;
v_valor DOUBLE PRECISION;
 BEGIN
 v_tempValReg = 0;
 v_tempValRaz = 0;
 v_tempValIva = 0;
 v_tempValGas = 0;
 v_tempValSubTot = 0;
 v_tempValTot = 0;
 SELECT opciones.opc_limitep, opciones.opc_razon, opciones.opc_gastos 
 INTO v_OpcLimitep, v_OpcRazon, v_OpcGastos
 FROM opciones FETCH FIRST 1 ROW ONLY;
 SELECT pro_excencion, pro_razones INTO v_ProExcencion, v_ProRazones FROM proforma WHERE pro_codigo = vProCodigo;	
 SELECT SUM(con_valor) INTO v_tempValReg FROM Contrato WHERE con_proforma= vProCodigo;

	IF (v_tempValReg > v_OpcLimitep)
		THEN
			v_tempValReg = v_OpcLimitep;
			v_tempValRaz = 0;
			v_tempValGas = 0;
	ELSE
			IF (v_ProExcencion IS NOT NULL)
				THEN
					SELECT excencion.exc_valor INTO v_ExcValor 
					FROM excencion WHERE excencion.exc_concepto = v_ProExcencion;
					IF(v_ExcValor IS NULL)
						THEN
							SELECT excencion.exc_valor INTO v_ExcValor 
							FROM excencion WHERE excencion.exc_concepto = 'NINGUNA';
						END IF;
				END IF;
			v_auxValor = 0;
			IF(v_ExcValor IS NOT NULL)
				THEN
					v_auxValor = v_ExcValor;
				END IF;
			IF(v_ProRazones >= 4)
				THEN
					v_Razones = (((v_ProRazones - 3) * v_OpcRazon) * (100 - v_auxValor))/100;
					v_tempValRaz = v_Razones;
			ELSE 
					v_Razones = 0;
					v_tempValRaz = v_Razones;
				END IF;
				
			IF((v_tempValReg + v_Razones) > v_OpcLimitep)
				THEN
					v_Razones = v_OpcLimitep - v_tempValReg;
					v_tempValRaz = v_Razones;
					v_tempValGas = 0;
			ELSE
					SELECT SUM(contrato.con_valor) INTO v_valor FROM tipo_contrato,contrato WHERE contrato.con_contrato=tipo_contrato.cnt_nombre AND (tipo_contrato.cnt_especial is false OR (tipo_contrato.cnt_especial is true AND tipo_contrato.cnt_gg is true)) AND contrato.con_contrato<>'Regularizaci󮠹 o Legalizaci󮠤e Excedentes y Diferencias' AND contrato.con_proforma= vProCodigo;
					IF(v_valor IS NOT NULL)
						THEN
							v_tempValGas = (v_valor * v_OpcGastos) / 100;
					ELSE 
							v_tempValGas = 0;
						END IF;
					SELECT SUM(contrato.con_valor) INTO v_valor FROM tipo_contrato,contrato WHERE contrato.con_contrato=tipo_contrato.cnt_nombre AND (tipo_contrato.cnt_especial is false OR (tipo_contrato.cnt_especial is true AND tipo_contrato.cnt_gg is true)) AND contrato.con_contrato='Regularizaci󮠹 o Legalizaci󮠤e Excedentes y Diferencias' AND contrato.con_proforma= vProCodigo;
					IF(v_valor IS NOT NULL)
						THEN
							v_tempValGas = v_tempValGas + v_valor;
						END IF;
					IF((v_tempValReg + v_tempValRaz + v_tempValGas) > v_OpcLimitep)
						THEN
							v_tempValGas = v_OpcLimitep - v_tempValReg - v_tempValRaz;
						END IF;
				END IF;
		END IF;
	v_tempValSubTot = v_tempValReg + v_tempValRaz + v_tempValGas;
	v_tempValTot = v_tempValSubTot + v_tempValIva;
	return (v_tempValReg,v_tempValRaz,v_tempValIva,v_tempValGas,v_tempValSubTot,v_tempValTot);
END; $$
LANGUAGE 'plpgsql';

CREATE OR REPLACE  FUNCTION ReemplazarCaracteresEspeciales(vinputString VARCHAR(200))
RETURNS VARCHAR(200)
as $$
DECLARE v_Pattern varchar(200);
begin
vinputString = regexp_replace(vinputString,' ','0','g');
vinputString = regexp_replace(vinputString,'\W+','','g');
vinputString = regexp_replace(vinputString,'0',' ','g');
RETURN vinputString;
end; $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Generar_Y_Guardar_Secuencia_SinAnio (
vcodigo VARCHAR(10))
RETURNS integer AS $$
DECLARE
	vsecuencia integer;
BEGIN
	IF (vcodigo = 'PRF')
		THEN
			vsecuencia = (SELECT (cast(idTramite as integer) + 1) FROM control_tram ORDER BY idTramite DESC fetch first 1 rows only);
			if (vsecuencia is not NULL)
			THEN
				UPDATE secuencia SET secactual = vsecuencia WHERE seccodigo = vcodigo;
			else
				vsecuencia = 1;
				UPDATE secuencia SET secactual = 1 WHERE seccodigo = vcodigo;
			end if;
		END IF;
	RETURN vsecuencia;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Generar_Y_Guardar_Secuencia (
vcodigo VARCHAR(10), 
vanio INT) 
RETURNS varchar(30) AS $$
DECLARE 
v_secuencia VARCHAR(20);
v_tipo VARCHAR(10);
BEGIN
	IF (vcodigo = 'RVSF') THEN
		IF (vanio = 2020) THEN
			v_tipo = 'EE';
		END IF;
		IF (vanio = 2021) THEN
			v_tipo = 'FF';
		END IF;
		IF (vanio = 2022) THEN
			v_tipo = 'GG';
		END IF;
		v_secuencia = (SELECT RIGHT('00000' || LTRIM(RTRIM(CAST((CAST(COALESCE (MAX(right(pro_revision,5)), '0') as integer) + 1) AS varchar(20)))),5) as mRev from proforma where length(pro_revision)=7 and left(pro_revision,2)= v_tipo);
		UPDATE Secuencia SET SecActual = CAST(v_secuencia AS INT) WHERE SecCodigo = vcodigo AND SecAnio = vanio;
		v_secuencia = CONCAT(v_tipo, v_secuencia);
	ELSEIF (vcodigo = 'RVS') THEN
		IF (vanio = 2020) THEN
			v_tipo = 'E';
		END IF;
		IF (vanio = 2021) THEN
			v_tipo = 'F';
		END IF;
		IF (vanio = 2022) THEN
			v_tipo = 'G';
		END IF;
		v_secuencia = (SELECT RIGHT('00000' || LTRIM(RTRIM(CAST((CAST(COALESCE(MAX(right(rev_numero,5)),'0') as integer) + 1) AS varchar(20)))),5) from revision where rev_numero like v_tipo || '_____');
		UPDATE Secuencia SET SecActual = CAST(v_secuencia AS INT) WHERE SecCodigo = vcodigo AND SecAnio = vanio;
		v_secuencia = CONCAT(v_tipo, v_secuencia);
	END IF;
	RETURN v_secuencia;
END;
$$ LANGUAGE plpgsql;



