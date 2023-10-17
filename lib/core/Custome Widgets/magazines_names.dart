import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/sourceModel_provider.dart';
import '../constants/colors_const.dart';

class MagazinesNames extends StatelessWidget {
  const MagazinesNames({super.key});

  @override
  Widget build(BuildContext context) {
    SourceModelProvider sourceModel = Provider.of<SourceModelProvider>(context);
    return Expanded(
      //flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color: ColorsConstants.primeGreen, width: 3),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    sourceModel.sourceModel!.sources[index].name,
                    style: const TextStyle(
                        color: ColorsConstants.primeGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                print("Clicked");
                print(
                  sourceModel.sourceModel!.sources[index].name,
                );
              },
            ),
          );
        },
        itemCount: sourceModel.sourceModel!.sources.length,
      ),
    );
  }
}
