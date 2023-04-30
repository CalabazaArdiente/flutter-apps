import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/widgets.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rafa'),
        centerTitle: false,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://www.elinformador.com.co/images/stories/general/2020/02-febrero/24nota_1_copia.jpg'),
        ),
        leadingWidth: 100,
      ),
      body: _Chat(),
    );
  }
}

class _Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0
                    ? MineMessageBubbleWidget()
                    : TheirMessageBubbleWidget());
              },
            )),
            SendBoxWidget()
          ],
        ),
      ),
    );
  }
}
