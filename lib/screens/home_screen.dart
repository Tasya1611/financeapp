import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'FinanceApp Dashboard',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Cards',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // ===== Banner Cards =====
                isDesktop
                    ? GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.9, // proporsi kartu
                        children: const [
                          AtmCard(
                            bankName: 'Bank Mandiri',
                            cardNumber: '**** 2345',
                            balance: 'Rp12.500.000',
                            backgroundImage: 'assets/images/atm_mandiri.png',
                          ),
                          AtmCard(
                            bankName: 'Bank BCA',
                            cardNumber: '**** 8765',
                            balance: 'Rp5.350.000',
                            backgroundImage: 'assets/images/atm_bca.png',
                          ),
                          AtmCard(
                            bankName: 'Bank BRI',
                            cardNumber: '**** 9988',
                            balance: 'Rp2.750.000',
                            backgroundImage: 'assets/images/atm_bri.png',
                          ),
                          AtmCard(
                            bankName: 'Bank BTN',
                            cardNumber: '**** 6655',
                            balance: 'Rp1.235.000',
                            backgroundImage: 'assets/images/atm_btn.png',
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 220,
                        child: PageView(
                          controller: PageController(viewportFraction: 0.9),
                          children: const [
                            AtmCard(
                              bankName: 'Bank Mandiri',
                              cardNumber: '**** 2345',
                              balance: 'Rp12.500.000',
                              backgroundImage: 'assets/images/atm_mandiri.png',
                            ),
                            AtmCard(
                              bankName: 'Bank BCA',
                              cardNumber: '**** 8765',
                              balance: 'Rp5.350.000',
                              backgroundImage: 'assets/images/atm_bca.png',
                            ),
                            AtmCard(
                              bankName: 'Bank BRI',
                              cardNumber: '**** 9988',
                              balance: 'Rp2.750.000',
                              backgroundImage: 'assets/images/atm_bri.png',
                            ),
                            AtmCard(
                              bankName: 'Bank BTN',
                              cardNumber: '**** 6655',
                              balance: 'Rp1.235.000',
                              backgroundImage: 'assets/images/atm_btn.png',
                            ),
                          ],
                        ),
                      ),

                const SizedBox(height: 28),

                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                GridView.count(
                  crossAxisCount: isDesktop ? 4 : 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    GridMenuItem(
                      icon: Icons.health_and_safety,
                      label: 'Health',
                    ),
                    GridMenuItem(icon: Icons.travel_explore, label: 'Travel'),
                    GridMenuItem(icon: Icons.fastfood, label: 'Food'),
                    GridMenuItem(icon: Icons.event, label: 'Event'),
                  ],
                ),

                const SizedBox(height: 28),

                const Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    separatorBuilder: (_, __) =>
                        const Divider(indent: 16, endIndent: 16, height: 1),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return TransactionItem(transaction: transactions[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
