//
//  ComObscureRichTextRichTextView.h
//  richtext
//
//  Created by Paul Mietz Egli on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TiUIView.h"
#import "DTCoreText.h"

typedef enum {
    kContentTypeText,
    kContentTypeHTML
} ContentType;

@interface ComObscureRichTextRichTextView : TiUIView <DTAttributedMultiTextContentViewDelegate> {
    NSString* content;
    int columnCount;
    int columnGap;
    
    DTAttributedMultiTextContentView* view;
}
@end
