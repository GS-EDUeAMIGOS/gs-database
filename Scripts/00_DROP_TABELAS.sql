-- ============================================================
-- 00_DROP_TABELAS.sql
-- ViaCidada - Global Solution 2026/2 - Database
--
-- Remove SOMENTE as cinco tabelas da disciplina Database.
-- NAO remove as tabelas TB_VC_NET_* da disciplina .NET.
-- Execute apenas quando desejar reconstruir o esquema Database.
-- ============================================================

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tb_vc_ocorrencia CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tb_vc_alerta CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tb_vc_parada_favorita CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tb_vc_linha_favorita CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tb_vc_usuario CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Fim da remocao das cinco tabelas Database.
