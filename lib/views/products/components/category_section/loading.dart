part of 'view.dart';
class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
        child: SizedBox(
          height: 128,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "الاقسام",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.grey, borderRadius: BorderRadius.circular(9)),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 15,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey, borderRadius: BorderRadius.circular(9)),
                          )
                        ],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(width: 24),
                      itemCount: 4))
            ],
          ),
        ));
  }
}