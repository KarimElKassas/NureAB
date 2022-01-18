import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/model/drop_list_model.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SelectDropList extends StatefulWidget {
  final OptionItem itemSelected;
  final DropListModel dropListModel;
  final IconData listIcon;
  final Function(OptionItem optionItem) onOptionSelected;

  // ignore: use_key_in_widget_constructors
  const SelectDropList(
      this.itemSelected, this.dropListModel, this.onOptionSelected, this.listIcon);

  @override
  // ignore: no_logic_in_create_state
  _SelectDropListState createState() =>
      // ignore: no_logic_in_create_state
      _SelectDropListState(itemSelected, dropListModel);
}

class _SelectDropListState extends State<SelectDropList>
    with SingleTickerProviderStateMixin {
  OptionItem optionItemSelected;
  final DropListModel dropListModel;

  AnimationController expandController;
  Animation<double> animation;

  bool isShow = false;

  _SelectDropListState(this.optionItemSelected, this.dropListModel);

  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 30, color: Colors.black12, offset: Offset(0, 2))
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Visibility(
                 visible: widget.listIcon != null,
                 child: Icon(
                  widget.listIcon,
                  color: darkBlueColor,
              ),
               ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: AutoSizeText(
                    optionItemSelected.title,
                    style:  TextStyle(color: darkBlueColor, fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true)),
                  )),
              GestureDetector(
                onTap: () {
                  isShow = !isShow;
                  _runExpandCheck();
                  setState(() {});
                },
                child: Align(
                  alignment: const Alignment(1, 0),
                  child: Icon(
                    isShow ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color:  darkBlueColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: animation,
            child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(bottom: 10),
                decoration:  const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: Offset(0, 4))
                  ],
                ),
                child: _buildDropListOptions(
                    dropListModel.listOptionItems, context))),
//          Divider(color: Colors.grey.shade300, height: 1,)
      ],
    );
  }

  Column _buildDropListOptions(List<OptionItem> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(OptionItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5, right: 26.0),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 1)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: AutoSizeText(item.title,
                      style:  TextStyle(
                          color: darkBlueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true)),
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          optionItemSelected = item;
          isShow = false;
          expandController.reverse();
          widget.onOptionSelected(item);
        },
      ),
    );
  }
}
