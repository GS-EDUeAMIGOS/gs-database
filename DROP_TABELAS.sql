
-- =====================================================
-- VIACIDADA
-- 00_DROP_TABELAS.sql
-- Exclusao das cinco tabelas
-- =====================================================

BEGIN
    EXECUTE IMMEDIATE
        'DROP TABLE tb_vc_ocorrencia CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE
        'DROP TABLE tb_vc_alerta CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE
        'DROP TABLE tb_vc_parada_favorita CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE
        'DROP TABLE tb_vc_linha_favorita CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE
        'DROP TABLE tb_vc_usuario CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

-- Fim da exclusao
