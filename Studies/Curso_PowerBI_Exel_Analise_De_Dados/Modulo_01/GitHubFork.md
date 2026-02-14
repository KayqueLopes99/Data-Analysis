# Contribuição em Projetos Open Source

## 1. O que é um Projeto Open Source?
É um projeto de Código Aberto, livre para ser utilizado, modificado e distribuído.

**Exemplos e Licenças:**
* **Linux:** Sob a licença GNU General Public License (GPL).
* **Roadmaps DIO:** Sob a licença MIT License (MIT).

---

## 2. Formas de Contribuir
Não é necessário apenas saber programar para ajudar. As principais formas são:

* **Relatar problemas:** Reportar bugs ou erros encontrados.
* **Sugestões:** Propor melhorias ou a adição de novos recursos.
* **Documentação:** Escrever ou atualizar a documentação do projeto (frequentemente a área que mais precisa de ajuda).
* **Código:** Contribuir diretamente com a correção de bugs ou criação de funcionalidades.
* **Apoio:** Divulgar o projeto e/ou fazer doações financeiras.

---

## 3. Passo a Passo: Fluxo de Contribuição no GitHub (Fork)
Para contribuir com código em um projeto que não é seu, utiliza-se o conceito de **Fork**.



1.  **Fazer o Fork:**
    * Acesse a página do repositório original no GitHub.
    * Clique no botão **"Fork"** (canto superior direito). Isso cria uma cópia exata do projeto na **sua** conta.

2.  **Clonar o Fork:**
    * No seu perfil, clone o repositório que você acabou de "forkar" para sua máquina local:
    ```bash
    git clone [https://github.com/SEU-USUARIO/nome-do-projeto.git](https://github.com/SEU-USUARIO/nome-do-projeto.git)
    ```

3.  **Criar uma Branch:**
    * Nunca trabalhe na `main`. Crie uma branch para sua contribuição:
    ```bash
    git checkout -b minha-contribuicao
    ```

4.  **Realizar as Alterações:**
    * Faça as modificações, adicione (`git add`) e commite (`git commit`).

5.  **Enviar para o Seu Fork:**
    * Envie as alterações para o seu repositório no GitHub:
    ```bash
    git push origin minha-contribuicao
    ```

6.  **Abrir Pull Request (PR):**
    * Vá até a página do repositório original.
    * O GitHub geralmente mostrará um botão "Compare & pull request".
    * Descreva suas alterações e envie. Agora os donos do projeto original revisarão seu código para aceitá-lo (Merge).