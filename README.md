# Teste Técnico — Ordens de Serviço (Delphi)

Projeto desenvolvido em Delphi como teste técnico.

## Tecnologias
- Delphi (VCL)
- FastReport
- Firebird
- FireDAC
- GitHub

## Arquitetura
- Arquitetura em camadas (View, Service e Repository)
- Princípios de SOLID
- Clean Code
- Queries parametrizadas

---

## Modelo de Banco de Dados

O modelo de banco foi baseado na estrutura sugerida no enunciado, com algumas melhorias aplicadas visando maior integridade dos dados e consistência.

O script completo de criação do banco está disponível em:

`src/sql/db.sql`

Para execução do sistema, o arquivo também deve estar presente em `bin/sql`.

Em ambiente de desenvolvimento, a cópia pode ser feita manualmente. Em cenários reais, esse processo poderia ser automatizado via build script ou pipeline CI/CD.

---

### Principais ajustes realizados

- Padronização de nomenclatura (`DATA_CADASTRO` em vez de `DATACADASTRO`)
- Definição de valor padrão para `DATA_ABERTURA` (`CURRENT_DATE`)
- Criação de constraint `CHECK` para garantir valores válidos no campo `STATUS`
- Adição de `ON DELETE CASCADE` em `ITEM_ORDEM` para manter integridade referencial
- Inclusão de `COMMENT` no campo `STATUS` para documentação no banco
- Ajuste na `VIEW` para manter consistência com os valores definidos no `CHECK`

---

### Observações

- O campo `VALOR_TOTAL` é mantido na tabela por questões de performance e é recalculado via regra de negócio na aplicação.
- A `VIEW VW_OS_RESUMO` foi criada para facilitar a geração de relatórios e identificação de ordens em atraso.
- A constraint `CHK_OS_STATUS` garante que apenas valores válidos sejam persistidos, evitando inconsistências.

---

> Documentação completa será adicionada ao final do desenvolvimento.