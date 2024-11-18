import 'package:fitness/formulario_page.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController = TextEditingController();
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111214),
      body: Stack(
        children: [
          // Fundo com gradiente e imagem ajustada
          Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width, // Ajustando para a largura da tela
            height: 300, // Definindo altura da imagem
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF111214), // Cor de fundo (mesclando com o fundo)
                    Colors.transparent,
                  ], // Gradiente para mesclar suavemente com o fundo
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/background2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Título
          Positioned(
            top: 56, // Ajustando a posição do título para ficar mais próximo
            left: 16,
            right: 16,
            child: Column(
              children: [
                Text(
                  "Vamos começar",
                  style: TextStyle(
                    fontFamily: 'Work Sans',
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.01,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0), // Menor espaçamento entre os textos
                Text(
                  "Não vai demorar, vai ser rapidinho!",
                  style: TextStyle(
                    fontFamily: 'Work Sans',
                    fontSize: 16,
                    color: Color(0xFFD7D8D9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Formulário de cadastro
          Positioned(
            top: 280, // Ajustando para que o formulário não sobreponha o título
            left: 16,
            right: 16,
            child: Column(
              children: [
                _buildInputField("E-mail ou telefone", "Digite seu e-mail"),
                SizedBox(height: 24),
                _buildInputField("Senha", "Digite sua senha", controller: _senhaController, obscureText: true),
                SizedBox(height: 24),
                _buildInputField("Confirme sua senha", "Digite novamente", controller: _confirmaSenhaController, obscureText: true),
              ],
            ),
          ),

          // Mensagem de erro animada, agora abaixo do campo de senha
          if (_showError)
            Positioned(
              top: 448,  // Ajustado para ficar logo abaixo do campo de confirmação de senha
              left: 16,
              right: 16,
              child: AnimatedOpacity(
                opacity: _showError ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF0048),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "As senhas não coincidem, tente novamente.",
                          style: TextStyle(
                            fontFamily: 'Work Sans',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Botão de Continuar
          Positioned(
            bottom: 34,
            left: 16,
            right: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Color(0xFFFF0048),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
              ),
              onPressed: () {
                // Redirecionar para a próxima página
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenderPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Continuar",
                    style: TextStyle(
                      fontFamily: 'Work Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Função para validar as senhas
  void _validatePasswords() {
    setState(() {
      if (_senhaController.text != _confirmaSenhaController.text) {
        _showError = true;
      } else {
        _showError = false;
        // Prosseguir com o cadastro ou outra lógica
      }
    });
  }

  // Widget para campo de entrada com ícone
  Widget _buildInputField(String label, String hint, {TextEditingController? controller, bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Work Sans',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFF24262B),
            borderRadius: BorderRadius.circular(19),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(
              fontFamily: 'Work Sans',
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
