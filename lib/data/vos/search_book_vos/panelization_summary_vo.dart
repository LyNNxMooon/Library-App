import 'package:json_annotation/json_annotation.dart';
part 'panelization_summary_vo.g.dart';

@JsonSerializable()
class PanelizationSummaryVO {
  final bool containsEpubBubbles;
  final bool containsImageBubbles;

  PanelizationSummaryVO(
      {required this.containsEpubBubbles, required this.containsImageBubbles});

  factory PanelizationSummaryVO.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryVOFromJson(json);
}
