import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'agora/utils/utils.dart';
/*import 'package:mywebrtc/GetUserMediaSample.dart';
import 'package:mywebrtc/src/basic_sample/basic_sample.dart';
import 'package:mywebrtc/src/call_sample/call_sample.dart';
import 'package:mywebrtc/src/call_sample/data_channel_sample.dart';
import 'package:mywebrtc/src/route_item.dart';
import 'package:shared_preferences/shared_preferences.dart';*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyAppState(false);
}

class MyAppState extends State<MyApp>{
  bool isColored;

  MyAppState(this.isColored);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mDefaultTheme,
      localizationsDelegates: <LocalizationsDelegate>[
		    FlutterI18nDelegate(translationLoader: FileTranslationLoader(
          fallbackFile: "ru",
          basePath: "assets/locales",
        )),
		    GlobalMaterialLocalizations.delegate,
		    GlobalWidgetsLocalizations.delegate,
		    GlobalCupertinoLocalizations.delegate
	    ],
	    supportedLocales: <Locale>[
	    	const Locale("en", "US"),
	    	const Locale("ru", "RU")
	    ],
      home: Scaffold(
         appBar: AppBar(
            title: Text('example'),
          ),
         body: Column(
           children: <Widget>[
          I18nText(
            'first_page.invalid_name', 
            child: Text(
              "",
              style: TextStyle(color: isColored ? Colors.red : Colors.blue),
          )),
          RaisedButton(
            child: I18nText(
              'first_page.enter',
              child: Text(
              ""
            )),
            onPressed: () {
            setState(() {
              isColored=!isColored;
            });
          })
          ]
         ) 
      ),
    );
  }
}

final ThemeData mDefaultTheme = ThemeData(
  primaryColor: string2Color('#0a0a0a'),
);

/*class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

enum DialogDemoAction {
  cancel,
  connect,
}

class _MyAppState extends State<MyApp> {
  List<RouteItem> items;
  String _server = '';
  SharedPreferences _prefs;

  bool _datachannel = false;
  @override
  initState() {
    super.initState();
    _initData();
    _initItems();
  }

  _buildRow(context, item) {
    return ListBody(children: <Widget>[
      ListTile(
        title: Text(item.title),
        onTap: () => item.push(context),
        trailing: Icon(Icons.arrow_right),
      ),
      Divider()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Flutter-WebRTC example'),
          ),
          body: new ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemCount: items.length,
              itemBuilder: (context, i) {
                return _buildRow(context, items[i]);
              })),
    );
  }

  _initData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _server = _prefs.getString('server') ?? 'demo.cloudwebrtc.com';
    });
  }

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        if (value == DialogDemoAction.connect) {
          _prefs.setString('server', _server);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => _datachannel
                      ? DataChannelSample(ip: _server)
                      : CallSample(ip: _server)));
        }
      }
    });
  }

  _showAddressDialog(context) {
    showDemoDialog<DialogDemoAction>(
        context: context,
        child: new AlertDialog(
            title: const Text('Enter server address:'),
            content: TextField(
              onChanged: (String text) {
                setState(() {
                  _server = text;
                });
              },
              decoration: InputDecoration(
                hintText: _server,
              ),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context, DialogDemoAction.cancel);
                  }),
              new FlatButton(
                  child: const Text('CONNECT'),
                  onPressed: () {
                    Navigator.pop(context, DialogDemoAction.connect);
                  })
            ]));
  }

  _initItems() {
    items = <RouteItem>[
      RouteItem(
          title: 'Basic API Tests',
          subtitle: 'Basic API Tests.',
          push: (BuildContext context) {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new BasicSample()));
          }),
      RouteItem(
          title: 'P2P Call Sample',
          subtitle: 'P2P Call Sample.',
          push: (BuildContext context) {
            _datachannel = false;
            _showAddressDialog(context);
          }),
      RouteItem(
          title: 'Data Channel Sample',
          subtitle: 'P2P Data Channel.',
          push: (BuildContext context) {
            _datachannel = true;
            _showAddressDialog(context);
          }),
    ];
  }
}*/
