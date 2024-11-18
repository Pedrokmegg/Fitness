import 'package:flutter/material.dart';

class FormularioPage2 extends StatefulWidget {
  const FormularioPage2({super.key});

  @override
  State<FormularioPage2> createState() => _FormularioPage2State();
}

class _FormularioPage2State extends State<FormularioPage2> {
  int _currentPage = 2; // Página atual
  String? _selectedGoal; // Objetivo selecionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF111214),
        elevation: 0,
        leading: Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF393C43),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context); // Voltar para a página anterior
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        title: Row(
          children: [
            const SizedBox(width: 2),
            const Text(
              'Queremos saber mais sobre você!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              width: 64,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFF0047).withOpacity(0.25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$_currentPage de 9',
                style: const TextStyle(
                  color: Color(0xFFFF0048),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF111214),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Qual é o seu objetivo?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Opções de objetivos
            _goalOption(
              label: 'Eu quero perder peso',
              icon: Icons.fitness_center,
              isSelected: _selectedGoal == 'Perder peso',
              onTap: () => setState(() => _selectedGoal = 'Perder peso'),
            ),
            const SizedBox(height: 16.0),
            _goalOption(
              label: 'Eu quero reduzir o estresse',
              icon: Icons.self_improvement,
              isSelected: _selectedGoal == 'Reduzir estresse',
              onTap: () => setState(() => _selectedGoal = 'Reduzir estresse'),
            ),
            const SizedBox(height: 16.0),
            _goalOption(
              label: 'Eu quero ganhar peso',
              icon: Icons.fastfood,
              isSelected: _selectedGoal == 'Ganhar peso',
              onTap: () => setState(() => _selectedGoal = 'Ganhar peso'),
            ),
            const SizedBox(height: 16.0),
            _goalOption(
              label: 'Eu quero ganhar resistência',
              icon: Icons.run_circle,
              isSelected: _selectedGoal == 'Ganhar resistência',
              onTap: () => setState(() => _selectedGoal = 'Ganhar resistência'),
            ),
            const SizedBox(height: 16.0),
            _goalOption(
              label: 'Só estou testando o app!',
              icon: Icons.check,
              isSelected: _selectedGoal == 'Testando',
              onTap: () => setState(() => _selectedGoal = 'Testando'),
            ),

            const Spacer(),

            // Botão Continuar
            Center(
              child: GestureDetector(
                onTap: _selectedGoal != null
                    ? () {
                        setState(() => _currentPage++);
                        Navigator.pushNamed(
                            context, '/formulario_page3'); // Próxima página
                      }
                    : null,
                child: Container(
                  width: 343,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF0048),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Texto
                      const Text(
                        'Continuar',
                        style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Ícone de flecha
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para criar opções de objetivos
  Widget _goalOption({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF393C43), // Cor de fundo dos botões
          borderRadius: BorderRadius.circular(19.0),
          border: isSelected
              ? Border.all(color: const Color(0xFFFF0048), width: 1)
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFF0048).withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            // Checkbox com bordas levemente arredondadas
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(9), // Cantos levemente arredondados
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.check, size: 16, color: Colors.white),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
