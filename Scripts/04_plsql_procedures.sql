-- ============================================================
-- 04_plsql_procedures.sql
-- ViaCidada - Global Solution 2026/2
-- ============================================================

-- ------------------------------------------------------------
-- PROCEDURE 1: Atualizar status de uma ocorrencia
-- ------------------------------------------------------------

CREATE OR REPLACE PROCEDURE prc_atualizar_status_ocorrencia (
    p_id_ocorrencia IN tb_vc_ocorrencia.id%TYPE,
    p_novo_status   IN tb_vc_ocorrencia.status%TYPE
)
AS
BEGIN
    -- Validar o ID
    IF p_id_ocorrencia IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'O ID da ocorrencia deve ser informado.'
        );
    END IF;

    -- Validar o novo status
    IF p_novo_status IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'O novo status deve ser informado.'
        );
    END IF;

    IF p_novo_status NOT IN (
        'ABERTA',
        'EM_ANALISE',
        'CONFIRMADA',
        'RESOLVIDA',
        'ARQUIVADA'
    ) THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Status informado invalido.'
        );
    END IF;

    -- Atualizar a ocorrencia
    UPDATE tb_vc_ocorrencia
       SET status = p_novo_status,
           atualizado_em = SYSTIMESTAMP
     WHERE id = p_id_ocorrencia;

    -- Verificar se a ocorrencia foi encontrada
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20004,
            'Ocorrencia nao encontrada.'
        );
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

-- ------------------------------------------------------------
-- PROCEDURE 2: Relatorio de acessibilidade por linha
-- ------------------------------------------------------------

CREATE OR REPLACE PROCEDURE prc_relatorio_acessibilidade_linha (
    p_codigo_linha IN tb_vc_ocorrencia.codigo_linha%TYPE
)
AS
    -- Variaveis de contagem
    v_qtd_ocorrencias NUMBER := 0;
    v_qtd_criticas    NUMBER := 0;
    v_qtd_alertas     NUMBER := 0;

    -- Cursor de ocorrencias ativas que afetam acessibilidade
    CURSOR c_ocorrencias IS
        SELECT
            id,
            titulo,
            tipo,
            status,
            gravidade,
            criado_em
        FROM tb_vc_ocorrencia
        WHERE codigo_linha = p_codigo_linha
          AND afeta_acessibilidade = 1
          AND status IN (
              'ABERTA',
              'EM_ANALISE',
              'CONFIRMADA'
          )
        ORDER BY criado_em DESC;

    -- Cursor de alertas ativos associados a linha
    CURSOR c_alertas IS
        SELECT
            id,
            titulo,
            mensagem,
            horario_notificacao
        FROM tb_vc_alerta
        WHERE codigo_linha = p_codigo_linha
          AND ativo = 1
        ORDER BY criado_em DESC;

BEGIN
    -- Validar o codigo da linha
    IF p_codigo_linha IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20011,
            'O codigo da linha deve ser informado.'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('RELATORIO DE ACESSIBILIDADE');
    DBMS_OUTPUT.PUT_LINE('Linha: ' || p_codigo_linha);
    DBMS_OUTPUT.PUT_LINE('========================================');

    -- Percorrer ocorrencias
    DBMS_OUTPUT.PUT_LINE('OCORRENCIAS ATIVAS:');

    FOR r_ocorrencia IN c_ocorrencias LOOP
        v_qtd_ocorrencias := v_qtd_ocorrencias + 1;

        IF r_ocorrencia.gravidade = 'CRITICA' THEN
            v_qtd_criticas := v_qtd_criticas + 1;
        END IF;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || r_ocorrencia.id ||
            ' | Titulo: ' || r_ocorrencia.titulo ||
            ' | Tipo: ' || r_ocorrencia.tipo ||
            ' | Status: ' || r_ocorrencia.status ||
            ' | Gravidade: ' || r_ocorrencia.gravidade
        );
    END LOOP;

    -- Percorrer alertas ativos
    DBMS_OUTPUT.PUT_LINE('ALERTAS ATIVOS:');

    FOR r_alerta IN c_alertas LOOP
        v_qtd_alertas := v_qtd_alertas + 1;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || r_alerta.id ||
            ' | Titulo: ' || r_alerta.titulo ||
            ' | Mensagem: ' || r_alerta.mensagem ||
            ' | Horario: ' || r_alerta.horario_notificacao
        );
    END LOOP;

    -- Exibir totais
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('RESUMO DO RELATORIO');
    DBMS_OUTPUT.PUT_LINE(
        'Ocorrencias relacionadas: ' || v_qtd_ocorrencias
    );
    DBMS_OUTPUT.PUT_LINE(
        'Ocorrencias criticas: ' || v_qtd_criticas
    );
    DBMS_OUTPUT.PUT_LINE(
        'Alertas ativos: ' || v_qtd_alertas
    );

    -- Classificar situacao da acessibilidade
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('DIAGNOSTICO:');

    IF v_qtd_criticas >= 5 THEN
        DBMS_OUTPUT.PUT_LINE(
            'ESTADO CRITICO DE ACESSIBILIDADE - ' ||
            'ACIONAR FISCALIZACAO SPTRANS'
        );

    ELSIF v_qtd_criticas >= 2 THEN
        DBMS_OUTPUT.PUT_LINE(
            'ATENCAO - MONITORAMENTO PRIORITARIO'
        );

    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'OPERACAO NORMAL DE ACESSIBILIDADE'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('========================================');

END;
/
