import 'package:animated_list/animated_list.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_print

void main() {
  test('Should detect deletions correctly', () async {
    // arrange
    final oldItems = List.generate(10, (index) => _Model(index.toString()));
    // If you uncomment this, everything will work as expected.
    // final newItems = List.from(oldItems);
    final newItems = List.generate(10, (index) => _Model(index.toString()));
    // ignore: cascade_invocations
    newItems.removeAt(1);

    // act
    final diff = await MyersDiff.diff<_Model>(
      newItems,
      oldItems,
      areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
      // If you set this to false, everything will work as expected.
      spawnIsolate: true,
    );
    // assert

    print('old: ${oldItems.map((e) => e.id).toList()}');
    print('new: ${newItems.map((e) => e.id).toList()}');
    print('diff $diff');
  });
}

class _Model {
  _Model(this.id);

  final String id;

  @override
  String toString() => id;
}
