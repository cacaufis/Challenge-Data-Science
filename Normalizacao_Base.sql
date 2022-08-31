-- Normalização e tradução da tabela ID, idetificada como a tabela de ligação entre tods os dados
-- Tradução das colunas da tabela id 
-- alteração do tipo de dados de text para varchar(16) para igualar com o tipo da ligação nas outras tabelas 
-- permitindo a geração de chaves extrangeiras

 ALTER TABLE id 
 CHANGE COLUMN person_id pessoa_id VARCHAR(16) NOT NULL 
    ,CHANGE COLUMN loan_id emprestimo_id VARCHAR(16) NOT NULL
    ,CHANGE COLUMN cb_id historico_id VARCHAR(16) NOT NULL 


--------------------------------  Tradução de colunas e normalização dos dados da tabela HISTORICOS_BANCO. -----------------------------
--  Primeiro fazendo o update dos dados para poder mudar a coluna para BIT, afim de melhorar o desempenho.
UPDATE analise_risco.historicos_banco
    SET cb_person_default_on_file = 
        CASE 
        WHEN cb_person_default_on_file = 'Y' THEN '1'
        WHEN cb_person_default_on_file = 'N' THEN '0'
    END; 
    
    -- Tradução das colunas e ajuste no tipo do dado da coluna "historico_inadimplencia"
    ALTER TABLE historicos_banco
    CHANGE COLUMN cb_id historico_id VARCHAR(16)
    ,CHANGE COLUMN cb_person_default_on_file historico_inadimplencia BIT NULL
    ,CHANGE COLUMN cb_person_cred_hist_length historico_primeiro_credito INT NULL
