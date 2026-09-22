import 'package:flutter/material.dart';

class FinanceHome extends StatefulWidget {
  const FinanceHome({super.key});

  @override
  State<FinanceHome> createState() => _FinanceHomeState();
}

class _FinanceHomeState extends State<FinanceHome>
    with SingleTickerProviderStateMixin {
  bool isIncomeActive = false;
  bool isSpendingActive = false;
  bool isRotationActive = false;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 55, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GOOD MORNING :)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF526A5B),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Your Finances',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26352C),
                        ),
                      ),
                      Text(
                        'Small steps make big progress',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF526A5B),
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isIncomeActive = !isIncomeActive;
                        isSpendingActive = !isSpendingActive;
                        isRotationActive = !isRotationActive;
                      });

                      controller.reset();
                      controller.forward();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE4EAE5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: Color(0xFF526A5B),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Total Balance
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: animation.value,
                    child: Transform.translate(
                      offset: Offset(0, 30 - (30 * animation.value)),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFF526A5B),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Balance',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '\$8,450.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          AnimatedRotation(
                            turns: isRotationActive ? 0.05 : 0.0,
                            duration: const Duration(milliseconds: 400),
                            child: const Icon(
                              Icons.trending_up_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            '+12.5% this month',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Income and Expense
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isIncomeActive = !isIncomeActive;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isIncomeActive
                              ? const Color.fromARGB(255, 106, 94, 114) // tap
                              : const Color(0xFFE5EDE4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.arrow_downward_rounded,
                              color: Color.fromARGB(255, 60, 80, 68),
                            ),
                            const Text(
                              'Income',
                              style: TextStyle(
                                color: Color(0xFF71877A),
                                fontSize: 15,
                              ),
                            ),
                            const Text(
                              '\$5,200',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF26352C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 211, 177, 169),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_upward_rounded,
                            color: Color(0xFF9A5C55),
                          ),
                          Text(
                            'Expense',
                            style: TextStyle(
                              color: Color(0xFF9A5C55),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '\$2,180',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF26352C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Monthly Spending
              AnimatedScale(
                scale: isSpendingActive ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSpendingActive = !isSpendingActive;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFDFC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Monthly Spending',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF71877A),
                              ),
                            ),
                            Text(
                              'View Details >',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF71877A),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [
                            Container(
                              height: 65,
                              width: 63,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE4EAE5),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '68%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF526A5B),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 15),

                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'You have spent',
                                  style: TextStyle(
                                    color: Color(0xFF8A918C),
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '\$2,180 of \$3,200',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF26352C),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 7),

              // Recent Transactions
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26352C),
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF526A5B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Coffee
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4EAE5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.local_cafe_outlined,
                          color: Color(0xFF526A5B),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coffee Shop',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF26352C),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Today, 10:30 AM',
                              style: TextStyle(
                                color: Color(0xFF8A918C),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '-\$8.50',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9A5C55),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Shopping
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4EAE5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Color(0xFF526A5B),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shopping',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF26352C),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Yesterday, 4:20 PM',
                              style: TextStyle(
                                color: Color(0xFF8A918C),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '-\$72.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9A5C55),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Salary
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4EAE5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Color(0xFF526A5B),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Salary',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF26352C),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Sep 15, 9:00 AM',
                              style: TextStyle(
                                color: Color(0xFF8A918C),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '+\$2,500',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF526A5B),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Food
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4EAE5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.restaurant_outlined,
                          color: Color(0xFF526A5B),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food & Dining',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF26352C),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Today, 1:12 PM',
                              style: TextStyle(
                                color: Color(0xFF8A918C),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '-\$35.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9A5C55),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Bottom Navigation
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFDFC),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.home_rounded,
                          color: Color(0xFF526A5B),
                          size: 25,
                        ),
                        Icon(
                          Icons.bar_chart_rounded,
                          color: Color(0xFF9AA39D),
                          size: 25,
                        ),
                        Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF9AA39D),
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
