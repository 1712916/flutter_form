import 'package:flutter/material.dart';

class SingleSelectionWidget<T> extends StatefulWidget {
  const SingleSelectionWidget({Key? key, required this.list, required this.builder, this.onSelected, this.initIndex})
      : super(key: key);

  final List<T> list;
  final Widget Function(T item, bool isSelected) builder;
  final ValueChanged<T>? onSelected;
  final int? initIndex;

  @override
  State<SingleSelectionWidget<T>> createState() => _SingleSelectionWidgetState<T>();
}

class _SingleSelectionWidgetState<T> extends State<SingleSelectionWidget<T>> {
  int _currentSelected = -1;

  @override
  void initState() {
    super.initState();
    if (widget.initIndex != null) {
      _currentSelected = widget.initIndex!;
    }
  }

  @override
  void didUpdateWidget(covariant SingleSelectionWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initIndex != _currentSelected) {
      _currentSelected = widget.initIndex ?? -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.list.length,
        (index) {
          return InkWell(
            onTap: () {
              _currentSelected = index;
              setState(() {});
              widget.onSelected?.call(widget.list[index]);
            },
            child: widget.builder(widget.list[index], _currentSelected == index),
          );
        },
      ),
    );
  }
}

class SingleSelectionSeparateWidget<T> extends StatefulWidget {
  const SingleSelectionSeparateWidget({
    Key? key,
    required this.list,
    required this.builder,
    this.onSelected,
    this.initIndex,
    required this.separate,
    this.canScroll = true,
    this.itemBackground,
  }) : super(key: key);

  final List<T> list;
  final Widget Function(T item, bool isSelected) builder;
  final Widget separate;
  final ValueChanged<T>? onSelected;
  final int? initIndex;
  final bool canScroll;
  final Color? itemBackground;

  @override
  State<SingleSelectionSeparateWidget<T>> createState() => _SingleSelectionSeparateWidgetState<T>();
}

class _SingleSelectionSeparateWidgetState<T> extends State<SingleSelectionSeparateWidget<T>> {
  int _currentSelected = -1;

  @override
  void initState() {
    super.initState();
    if (widget.initIndex != null) {
      if (widget.initIndex! >= 0) {
        _currentSelected = widget.initIndex!;
      }
    }
  }

  @override
  void didUpdateWidget(covariant SingleSelectionSeparateWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initIndex != _currentSelected) {
      _currentSelected = widget.initIndex ?? -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: widget.canScroll ? null : const NeverScrollableScrollPhysics(),
      shrinkWrap: !widget.canScroll,
      itemBuilder: (context, index) {
        return TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: widget.itemBackground,
          ),
          onPressed: () {
            _currentSelected = index;
            setState(() {});
            widget.onSelected?.call(widget.list[index]);
          },
          child: widget.builder(widget.list[index], _currentSelected == index),
        );
      },
      separatorBuilder: (_, __) => widget.separate,
      itemCount: widget.list.length,
    );
  }
}

class MultiSelectionWidget<T> extends StatefulWidget {
  const MultiSelectionWidget({
    Key? key,
    required this.list,
    required this.builder,
    this.onSelected,
    this.initList,
    this.maxSelect,
  }) : super(key: key);

  final List<T> list;
  final Widget Function(T item, bool isSelected) builder;
  final Function(T item, bool isSelected)? onSelected;
  final Set<T>? initList;
  final int? maxSelect;

  @override
  State<MultiSelectionWidget<T>> createState() => _MultiSelectionWidgetState<T>();
}

class _MultiSelectionWidgetState<T> extends State<MultiSelectionWidget<T>> {
  Set<T> _selectionList = <T>{};

  @override
  void initState() {
    super.initState();
    _initSelectedList();
  }

  @override
  void didUpdateWidget(covariant MultiSelectionWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initSelectedList();
  }

  void _initSelectedList() {
    if (widget.initList != null) {
      _selectionList = widget.initList!.intersection(widget.list.toSet());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) {
        final item = widget.list[index];
        return InkWell(
          onTap: () {
            if (widget.maxSelect != null) {
              if (_selectionList.length >= widget.maxSelect!) {
                return;
              }
            }
            if (_selectionList.contains(item)) {
              _selectionList.remove(item);
              widget.onSelected?.call(item, false);
            } else {
              _selectionList.add(item);
              widget.onSelected?.call(item, true);
            }

            setState(() {});
          },
          child: widget.builder(widget.list[index], _selectionList.contains(widget.list[index])),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(),
      itemCount: widget.list.length,
      padding: EdgeInsets.zero,
    );
  }
}
