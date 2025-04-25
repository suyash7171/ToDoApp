import 'package:flutter/material.dart';
import 'models/todo.dart';
import 'theme/app_theme.dart';
import 'widgets/todo_card.dart';
import 'widgets/todo_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todos = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<Todo> get _filteredTodos {
    return _todos.where((todo) {
      final matchesSearch = todo.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'All' || todo.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  List<String> get _categories {
    final categories = _todos.map((todo) => todo.category).toSet().toList();
    categories.sort();
    return ['All', ...categories];
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (context) => const TodoDialog(),
    );

    if (todo != null) {
      setState(() {
        _todos.add(todo);
      });
    }
  }

  void _editTodo(Todo todo, int index) async {
    final editedTodo = await showDialog<Todo>(
      context: context,
      builder: (context) => TodoDialog(todo: todo),
    );

    if (editedTodo != null) {
      setState(() {
        _todos[index] = editedTodo;
      });
    }
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _toggleTodo(int index) {
    setState(() {
      _todos[index].isCompleted = !_todos[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addTodo,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search todos...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _categories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: _selectedCategory == category,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _selectedCategory = category;
                              });
                            }
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _filteredTodos.isEmpty
                ? Center(
                    child: Text(
                      _searchQuery.isEmpty
                          ? 'No todos yet. Add one!'
                          : 'No todos match your search.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredTodos.length,
                    itemBuilder: (context, index) {
                      final todo = _filteredTodos[index];
                      final originalIndex = _todos.indexOf(todo);
                      return TodoCard(
                        todo: todo,
                        onToggle: () => _toggleTodo(originalIndex),
                        onDelete: () => _deleteTodo(originalIndex),
                        onEdit: () => _editTodo(todo, originalIndex),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
