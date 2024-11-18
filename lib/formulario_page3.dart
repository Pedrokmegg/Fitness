import 'package:flutter/material.dart';

class FormularioPage3 extends StatefulWidget {
  const FormularioPage3({Key? key}) : super(key: key);

  @override
  State<FormularioPage3> createState() => _FormularioPage3State();
}

class _FormularioPage3State extends State<FormularioPage3> {
  double _weight = 50;
  bool _isKg = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111214),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111214),
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF393C43),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        title: const Text(
          'Queremos saber mais sobre você!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFF0047).withOpacity(0.25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                '3 de 9',
                style: TextStyle(
                  color: Color(0xFFFF0048),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Título centralizado
            const Text(
              'Qual seu peso?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Seletor de Kg/Lbs
            Container(
              width: 343,
              height: 56,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFF24262B),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  _buildOptionButton('Kg', _isKg),
                  const SizedBox(width: 4),
                  _buildOptionButton('Lbs', !_isKg),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Exibição do peso centralizado com animação suave
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Text(
                '${_isKg ? _weight.toStringAsFixed(0) : (_weight * 2.20462).toStringAsFixed(0)} ${_isKg ? 'kg' : 'lbs'}',
                key: ValueKey(_weight),
                style: const TextStyle(
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 96,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Slider personalizado com animação
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: _weight, end: _weight),
              duration: const Duration(milliseconds: 300),
              builder: (context, value, child) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: const Color(0xFF393C43),
                    thumbColor: Colors.white,
                    overlayColor: Colors.white.withOpacity(0.1),
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                    trackHeight: 2,
                  ),
                  child: Slider(
                    value: value,
                    min: 0,
                    max: 130,
                    onChanged: (newValue) {
                      setState(() => _weight = newValue);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 48),

            // Botão Continuar
            GestureDetector(
              onTap: () {
                // Navegar para a próxima página
                Navigator.pushNamed(context, '/formulario_page4');
              },
              child: Container(
                width: 343,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF0048),
                  borderRadius: BorderRadius.circular(19)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
          ],
        ),
      ),
    );
  }

  // Função para construir botões Kg e Lbs
  Widget _buildOptionButton(String label, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _isKg = label == 'Kg'),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFF0048) : const Color(0xFF393C43),
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFFFF0048).withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
