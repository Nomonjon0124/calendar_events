part of 'event_edit_part.dart';

class EventEditPage extends StatefulWidget {
  final EventEntity? event;
  const EventEditPage({super.key, required this.event});

  @override
  State<EventEditPage> createState() => _EventEditPageState();
}

class _EventEditPageState extends State<EventEditPage> with EventEditMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<CalendarBloc>().add(DeleteCalendarEvent(widget.event?.id ?? 0));
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Event name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
              SizedBox(height: 4),
              CustomTextField(
                controller: _titleCtrl,
                validator: (value) => NotEmptyValidator.validate(value),
                filled: true,
                showCursor: true,
                fillColor: Color(0xFFF3F4F6),
                borderRadius: 8.0,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              Text("Event description", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
              SizedBox(height: 4),
              CustomTextField(
                controller: _descCtrl,
                validator: (value) => NotEmptyValidator.validate(value),
                filled: true,
                showCursor: true,
                enabled: true,
                maxLines: 5,
                minLines: 3,
                fillColor: Color(0xFFF3F4F6),
                borderRadius: 8.0,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              Text("Event location", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
              SizedBox(height: 4),
              CustomTextField(
                controller: _locationCtrl,
                filled: true,
                showCursor: true,
                fillColor: Color(0xFFF3F4F6),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: SvgPicture.asset(
                    'assets/images/svg/ic_location.svg',
                    width: 10,
                    height: 10,
                    colorFilter: ColorFilter.mode(Color(0xFF009FEE), BlendMode.srcIn),
                  ),
                ),
                borderRadius: 8.0,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              Text("Priority color", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
              SizedBox(height: 4),
              PopupMenuButton(
                icon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF3F4F6)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 24, height: 24, color: AppColors.priorityColor(_priority)),
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/images/svg/arrow_down_outline.svg',
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(Color(0xFF009FEE), BlendMode.srcIn),
                      ),
                    ],
                  ),
                ),
                onSelected: (value) {
                  setState(() => _priority = value);
                },
                itemBuilder: (context) {
                  return [
                    _popMenuWidget(priority: EventPriority.low, text: "Low"),
                    _popMenuWidget(priority: EventPriority.medium, text: "Medium"),
                    _popMenuWidget(priority: EventPriority.high, text: "High"),
                  ];
                },
              ),
              SizedBox(height: 16),
              Text("Event time", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111827))),
              SizedBox(height: 4),
              CustomTextField(
                controller: _timeCtrl,
                filled: true,
                readOnly: true,
                showCursor: false,
                enabled: true,
                fillColor: Color(0xFFF3F4F6),
                validator: (value) => NotEmptyValidator.validate(value),
                borderRadius: 8.0,
                onTap: () async {
                  await _pickTime(context);
                },
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.none,
              ),
              const Spacer(),
              PrimaryButton(
                title: widget.event == null ? 'Add' : 'Update',
                fontSize: 16,
                width: MediaQuery.of(context).size.width,
                fontWeight: FontWeight.w600,
                backgroundColor: Color(0xFF009FEE),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _submit();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true, // agar 24 soatlik format kerak bo‘lsa
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final formatted = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';

      _timeCtrl.text = formatted;
    }
  }

  PopupMenuItem _popMenuWidget({required EventPriority priority, required String text}) {
    return PopupMenuItem(
      value: priority,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Container(width: 24, height: 24, color: AppColors.priorityColor(priority)), SizedBox(width: 10), Text(text)],
      ),
    );
  }
  void _submit() {
    final selectDateTime = DateTime(
      widget.event?.startDate.year??DateTime.now().year,
      widget.event?.startDate.month??DateTime.now().month,
      widget.event?.startDate.day??DateTime.now().day,
      int.parse(_timeCtrl.text.split(':')[0]),
      int.parse(_timeCtrl.text.split(':')[1]),
    );
    final endDate = DateTime(
      selectDateTime.year,
      selectDateTime.month,
      selectDateTime.day,
      selectDateTime.hour + 2,
      selectDateTime.minute,
      selectDateTime.second,
    );
    final event = EventEntity(
      id: widget.event?.id,
      title: _titleCtrl.text,
      description: _descCtrl.text,
      location: _locationCtrl.text,
      startDate: selectDateTime,
      endDate: endDate,
      priority: _priority,
    );
    final bloc = context.read<CalendarBloc>();
    bloc.add(UpdateCalendarEvent(event));
    Navigator.pop(context, <EventEntity>[event]);
  }
}

