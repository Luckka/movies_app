import 'package:flutter/material.dart';
import 'package:presenter/ui/home/stores/movie_controller.dart';
import '../../../dependencies/dependencies.dart';
import '../components/custom_list_card_widget.dart';
import 'package:features/features.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  late final MovieController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Modular.get<MovieController>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies',style:TextStyle(color: Colors.white),),
        actions: [
        const Align(
          alignment: Alignment.center,
          child: Text('0'),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.favorite),
          color: Colors.red,
         ),
         Padding(
           padding: const EdgeInsets.fromLTRB(10,10,10,10),
           child: ElevatedButton(
            onPressed: (){},
             style:ButtonStyle(
               shape:  MaterialStateProperty.all(CircleBorder()),
               backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                return Colors.black;
                  return Color.fromARGB(144, 158, 158, 158); // Use the component's default.
                },
              ), 
           ),
            child: Icon(Icons.person)
           ),
           
         ),
         
        ],
        elevation: 1,
        backgroundColor: Color.fromARGB(59, 0, 0, 0), 
      ),
       
        body: Padding(
            padding: const EdgeInsets.all(28),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,5,10,5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(34, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        onChanged: _controller.onChanged,
                        decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                            fillColor: Colors.white30,
                            focusColor: Colors.white30,
                            hoverColor: Colors.white30,
                        ),
                          cursorColor: Colors.white30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),

                      ValueListenableBuilder<MoviesEntity?>(
                        valueListenable: _controller.movies,
                         builder: (_,movies,__) {
                            return movies != null
                            ? ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: movies.listMovies.length,
                                itemBuilder: (__, idx) => CustomListCardWidget(
                                    movie: MovieDetailDto.fromEntity(movies.listMovies[idx])),
                                separatorBuilder: (__, _) => const Divider())
                            : const Center(child: CircularProgressIndicator(),);
                         }
                      )
                ],
              ),
            )));
  }
}