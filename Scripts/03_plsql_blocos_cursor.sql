-- ============================================================
-- 03_plsql_blocos_cursor.sql
-- ViaCidada - Global Solution 2026/2 - Database
--
-- Bloco anonimo de analise de acessibilidade por linha.
-- Demonstra variaveis, SELECT INTO, DBMS_OUTPUT, IF/ELSIF/ELSE,
-- cursor explicito com OPEN/FETCH/CLOSE e repeticao LOOP.
--
-- ATENCAO: este arquivo foi reconstruido a partir da logica
-- aprovada e do resultado de execucao confirmado pelo grupo.
-- O texto literal original do bloco nao estava preservado como
-- arquivo; este script reproduz os mesmos criterios e resultado.
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_codigo_linha       NUMBER(10) := 875010;
    v_qtd_ocorrencias    NUMBER := 0;
    v_qtd_criticas       NUMBER := 0;
    v_registros_percorridos NUMBER := 0;

    CURSOR c_ocorrencias IS
        SELECT
            id,
            titulo,
            status,
            gravidade
        FROM tb_vc_ocorrencia
        WHERE codigo_linha = v_codigo_linha
          AND afeta_acessibilidade = 1
          AND status IN ('ABERTA', 'EM_ANALISE', 'CONFIRMADA')
        ORDER BY criado_em DESC, id DESC;

    v_ocorrencia c_ocorrencias%ROWTYPE;
BEGIN
    SELECT COUNT(*)
      INTO v_qtd_ocorrencias
      FROM tb_vc_ocorrencia
     WHERE codigo_linha = v_codigo_linha
       AND afeta_acessibilidade = 1
       AND status IN ('ABERTA', 'EM_ANALISE', 'CONFIRMADA');

    SELECT COUNT(*)
      INTO v_qtd_criticas
      FROM tb_vc_ocorrencia
     WHERE codigo_linha = v_codigo_linha
       AND afeta_acessibilidade = 1
       AND gravidade = 'CRITICA'
       AND status IN ('ABERTA', 'EM_ANALISE', 'CONFIRMADA');

    DBMS_OUTPUT.PUT_LINE('ANALISE DE ACESSIBILIDADE - VIACIDADA');
    DBMS_OUTPUT.PUT_LINE('Linha: ' || v_codigo_linha);
    DBMS_OUTPUT.PUT_LINE('Ocorrencias ativas: ' || v_qtd_ocorrencias);
    DBMS_OUTPUT.PUT_LINE('Ocorrencias criticas: ' || v_qtd_criticas);

    IF v_qtd_criticas >= 5 THEN
        DBMS_OUTPUT.PUT_LINE(
            'DIAGNOSTICO: CRITICO - priorizar atendimento.'
        );
    ELSIF v_qtd_criticas >= 2 THEN
        DBMS_OUTPUT.PUT_LINE(
            'DIAGNOSTICO: ATENCAO - monitorar ocorrencias.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'DIAGNOSTICO: NORMAL - sem criticidade elevada.'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('DETALHAMENTO DAS OCORRENCIAS:');

    OPEN c_ocorrencias;
    LOOP
        FETCH c_ocorrencias INTO v_ocorrencia;
        EXIT WHEN c_ocorrencias%NOTFOUND;

        v_registros_percorridos := v_registros_percorridos + 1;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_ocorrencia.id ||
            ' | ' || v_ocorrencia.titulo ||
            ' | Status: ' || v_ocorrencia.status ||
            ' | Gravidade: ' || v_ocorrencia.gravidade
        );
    END LOOP;
    CLOSE c_ocorrencias;

    DBMS_OUTPUT.PUT_LINE(
        'Registros percorridos: ' || v_registros_percorridos
    );
    DBMS_OUTPUT.PUT_LINE('Analise concluida.');

EXCEPTION
    WHEN OTHERS THEN
        IF c_ocorrencias%ISOPEN THEN
            CLOSE c_ocorrencias;
        END IF;
        RAISE;
END;
/
