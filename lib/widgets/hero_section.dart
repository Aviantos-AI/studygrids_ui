import 'package:flutter/material.dart';
import 'package:pie_study/widgets/app_card.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/ghost_button.dart';
import 'package:pie_study/widgets/primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Flex(
      direction: isWide ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(11, 59, 87, 0.06),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Live • Cohort • Hands-on',
                  style: TextStyle(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Build Future-Ready AI Skills with StudyGrids',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: isWide ? 34 : 28,
                  height: 1.03,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Master Agentic AI, Data Science, and next-gen automation through '
                'industry-designed, hands-on programs built for Managers, Leaders, '
                'Developers, and Career-Changers.',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  PrimaryButton(label: 'Explore Programs', onTap: () {}),
                  GhostButton(
                    label: 'Book Free Counselling Call',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'Live classes • Hands-on projects • Capstone portfolio • '
                'Internship pathways • Career support',
                style: TextStyle(color: AppColors.muted, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24, height: 24),
        Expanded(
          flex: 2,
          child: AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Why Thousands Trust StudyGrids',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(height: 10),
                _BulletList(
                  items: [
                    'Industry-designed curriculum by AI/ML & tech leaders',
                    'Completely hands-on training with real workflows, agents & RAG pipelines',
                    'Specialisation in Agentic AI — the future of automation',
                    'Internship pathways for Data Science learners',
                    'Affordable and flexible for working professionals',
                    'Learn from experts with 20+ years experience',
                  ],
                ),
                SizedBox(height: 12),
                _TrustedBadge(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TrustedBadge extends StatelessWidget {
  const _TrustedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(999),
      ),
      child: const Text(
        'Trusted • 1000+ learners',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: Color(0xFF071424),
        ),
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  const _BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 14, height: 1.4)),
                  Expanded(
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
