import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:proyecto_sm/event.dart';

class TableEventsExample extends StatefulWidget{
  const TableEventsExample({Key? key}) : super(key: key);
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample>{
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime,List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState(){
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose(){
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay; // Actualiza _selectedDay con la fecha seleccionada
        _focusedDay = focusedDay; // Actualiza _focusedDay con la fecha enfocada
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }


  List<Event> _getEventsForDay(DateTime day){
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva tu horario'),
        backgroundColor: const Color(0xFF4B39EF),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              scrollable: true,
              title: const Text("Nombre del Evento"),
              content: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: _eventController,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    events.addAll({
                      _selectedDay!: [Event(_eventController.text)]
                    });
                    Navigator.of(context).pop();
                    _selectedEvents.value = _getEventsForDay(_selectedDay!);
                  },
                  child: const Text("Enviar"),
                )
              ],
            );
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010,3,14),
            lastDay: DateTime.utc(2030,3,14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: _onDaySelected,
            eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
            onFormatChanged: (format){
              if (_calendarFormat != format){
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay){
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context,value,_){
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onTap: () => print(""),
                          title: Text('${value[index].title}'), // Accede al atributo title del objeto Event
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}