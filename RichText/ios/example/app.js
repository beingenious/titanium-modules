

var RichText = require('com.obscure.RichText');

var win = Ti.UI.createWindow({ backgroundColor:'#FF0000', layout: 'vertical' });

var view = RichText.createRichTextView({                                       
  width: 220,
  height: 100,
  columnCount:2,
  columnGap:10,
  html: "<h2>Important message!</h2><p>hello, <b>world</b>! I'm <i>really</i> happy to see you.</p>",
});
win.add(view);

win.open();
