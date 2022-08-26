para que o fluttermoji não resete o estado do avatar quando fechar o widget fluttermojiCustomizer, é preciso alterar o "dispose" do widget para retirar o metodo "fluttermojiController.restoreState();", 
que sempre retorna para o estado anterior da edição.
