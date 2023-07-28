 part of 'view.dart';

class _Item extends StatelessWidget {
  final MovieModel model;
  const _Item({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.3),
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
          bottomEnd: Radius.circular(10)
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              model.poster,
               height: 200,
              fit: BoxFit.cover,
              loadingBuilder:
                  (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    value:
                    loadingProgress.expectedTotalBytes !=
                        null
                        ? loadingProgress
                        .cumulativeBytesLoaded /
                        loadingProgress
                            .expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(model.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 5,),
                  Text(model.overView,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Theme.of(context).hintColor),maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),
                   Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.orange,),
                      Text(model.vote.toString(),style: const TextStyle(color: Colors.orange,fontWeight: FontWeight.w700,fontSize: 15),),
                    ],
                  ),
                  GestureDetector(onTap: (){
                    navigateTo(context, MovieDetailsView(model: model ,));
                  },
                      child: const Text("More...>>",style: TextStyle(fontSize: 15),))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}