<h1 align="center"> LISTAGEM GEEK </h1>
<h2 align="center">  Teste técnico Escribo 03 </h2>


## 📁 Acesso

**Para visualizar o projeto, [clique aqui](https://github.com/wyzzec/listagem-geek).**  
**Para baixar o APK, baixe pelo repositório ou [clique aqui](https://drive.google.com/file/d/1Zd97-BguC0sUqTL-PpgWqJvvbWBC4DhH/view?usp=sharing).**

## 🛠️ Abrir e rodar o projeto

**Baixe uma IDE compátivel com o Flutter, por exemplo, o Intellij. Após isso, baixe a versão 3.0.5 do SDK Flutter e configure sua IDE. 
Depois, é só ir até "file/open...", abrir o projeto e rodar na plataforma de sua escolha. 
Mais informações sobre como configurar o AVD manager para android, 
[clique aqui](https://www.treinaweb.com.br/blog/configurando-ambiente-de-desenvolvimento-flutter).**



Erros conhecidos:  
1- Para que o fluttermoji não resete o estado do avatar quando fechar o widget fluttermojiCustomizer, é preciso alterar o "dispose" do widget para retirar o metodo "fluttermojiController.restoreState();", 
que sempre retorna para o estado anterior da edição. (Ainda assim, a funcionalidade de salvar e ler no banco de dados utilizando sqflite está normal.)
