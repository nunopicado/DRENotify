**DRE Notify**

Mini-programa, que vai buscar ao Diário da República Electrónico os artigos do dia.
É possível filtrar os resultados, inserindo paralavras de pesquisa no ficheiro filter.txt em anexo.
Se não forem encontrados artigos (ou por não existirem mesmo, ou porque o filtro não retornou resultados), nada é mostrado ao utilizador. O programa entra e sai automaticamente.
Se forem encontrados artigos, é mostrada uma lista, com o resumo do artigo seleccionado.

**Recomendação de Utilização**
Colocar uma chamada ao software no arranque do Windows, ou em qualquer outro tipo de agendamento que faça o programa correr diariamente.
Caso haja algum artigo com as palavras constantes no ficheiro de filtros, uma lista será mostrada.

**Filter.txt:**
O ficheiro de filtros é nada mais que um ficheiro de texto, em que cada linha é um filtro.
Não há tratamento algum dos filtros, o que significa que não há palavras compostas. O que meterem no filtro tem de aparecer exactamente igual no cabeçalho do artigo, caso contrário, é descartado.
A única excepção são as maiúsculas e minúsculas - O filtro não é case-sensitive.
Note-se que a condição dos filtros é OU, ou seja, se o artigo tiver qualquer das palavras dos filtros, já aparece.
