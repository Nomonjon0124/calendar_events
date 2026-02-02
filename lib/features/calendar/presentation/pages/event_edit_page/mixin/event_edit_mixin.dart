part of '../event_edit_part.dart';

mixin EventEditMixin on State<EventEditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _timeCtrl = TextEditingController();

  EventPriority _priority = EventPriority.medium;

  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      _titleCtrl.text = widget.event!.title;
      _descCtrl.text = widget.event!.description ?? '';
      _priority = widget.event!.priority;
      _locationCtrl.text = widget.event!.location ?? '';
      _timeCtrl.text = DateFormat.Hm().format(widget.event?.startDate ?? DateTime.now());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _locationCtrl.dispose();
    _timeCtrl.dispose();
  }
}