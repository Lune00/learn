ALTER TABLE MEMBRES ADD(finAdhesion date as (ADD_MONTHS(adhesion,duree)))