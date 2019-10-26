 CREATE Table T2 (
    code number GENERATED ALWAYS AS IDENTITY(
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100
    CACHE 10
    CYCLE) PRIMARY KEY,
    nom varchar2(20)
    );