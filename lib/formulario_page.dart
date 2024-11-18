import 'package:flutter/material.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  int _currentPage = 1;
  String? _selectedGender;

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
              Navigator.pop(context);
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
                  fontWeight: FontWeight.bold, // Ajustado para bold
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
              'Qual seu gênero?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30, // Tamanho ajustado para 30
                fontWeight: FontWeight.bold, // Negrito (bold)
              ),
            ),
            const SizedBox(height: 40),

            // Card para opção "Homem"
            _genderOptionCard(
              label: "Homem",
              icon: Icons.male,
              imagePath: 'assets/images/homem.png',
              isSelected: _selectedGender == "Homem",
              onTap: () => setState(() => _selectedGender = "Homem"),
            ),

            const SizedBox(height: 16.0),

            // Card para opção "Mulher"
            _genderOptionCard(
              label: "Mulher",
              icon: Icons.female,
              imagePath: 'assets/images/mulher.png',
              isSelected: _selectedGender == "Mulher",
              onTap: () => setState(() => _selectedGender = "Mulher"),
            ),

            const Spacer(),

            // Botão "Prefiro não informar, obrigado!"
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(bottom: 12.0), // Espaçamento ajustável
              decoration: BoxDecoration(
                color: const Color(0xFFFF0047).withOpacity(0.25),
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: TextButton(
                onPressed: () {
                  // Lógica para "Prefiro não informar"
                },
                child: const Text(
                  'Prefiro não informar, obrigado!',
                  style: TextStyle(
                    color: Color(0xFFFF0048),
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Botão "Continuar"
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedGender != null
                    ? () {
                        setState(() => _currentPage++);
                        Navigator.pushNamed(context, '/formulario_page2');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0048),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19.0),
                  ),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderOptionCard({
    required String label,
    required IconData icon,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 344,
        height: 144,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: isSelected
              ? Border.all(color: const Color(0xFFFF0048), width: 1)
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFF0048).withOpacity(0.18),
                    blurRadius: 20,
                    spreadRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            // Imagem com gradiente harmônico radial
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Stack(
                children: [
                  // Imagem de fundo
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ],
              ),
            ),
            // Conteúdo do botão
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(icon, color: Colors.white, size: 24),
                      const SizedBox(height: 8),
                      Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Checkbox
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      color: isSelected ? Colors.white : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.black, size: 16)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


























// import 'package:flutter/material.dart';

// class GenderPage extends StatefulWidget {
//   const GenderPage({Key? key}) : super(key: key);

//   @override
//   State<GenderPage> createState() => _GenderPageState();
// }

// class _GenderPageState extends State<GenderPage> {
//   int _currentPage = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: Text(
//               '$_currentPage of 9',
//               style: const TextStyle(color: Colors.white, fontSize: 12),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 40),
//             const Text(
//               'Qual seu gênero?',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 40),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _currentPage++;
//                 });
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[900],
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Row(
//                   children: const [
//                     Icon(
//                       Icons.male,
//                       color: Colors.white,
//                     ),
//                     SizedBox(width: 16.0),
//                     Text(
//                       'Homem',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//                ),
//             ),
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _currentPage++;
//                 });
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[900],
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Row(
//                   children: const [
//                     Icon(
//                       Icons.female,
//                       color: Colors.white,
//                     ),
//                     SizedBox(width: 16.0),
//                     Text(
//                       'Mulher',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _currentPage++;
//                 });
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[900],
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Row(
//                   children: const [
//                     Icon(
//                       Icons.transgender,
//                       color: Colors.white,
//                     ),
//                     SizedBox(width: 16.0),
//                     Text(
//                       'Prefiro não informar',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Voltar'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _currentPage++;
//                     });
//                   },
//                   child: const Text('Continuar'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }