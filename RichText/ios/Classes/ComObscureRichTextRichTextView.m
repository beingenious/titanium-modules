//
//  ComObscureRichTextRichTextView.m
//  richtext
//
//  Created by Paul Mietz Egli on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ComObscureRichTextRichTextView.h"
#import "TiViewProxy.h"

@interface ComObscureRichTextRichTextView (PrivateMethods)
- (void)setAttributedTextViewContent;
@end

@implementation ComObscureRichTextRichTextView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self backgroundColor];
    }
    return self;
}

- (void)dealloc {
    RELEASE_TO_NIL(view)
    RELEASE_TO_NIL(content)
    [super dealloc];
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds {
    [super frameSizeChanged:frame bounds:bounds];
    [view setFrame:bounds];
}

#pragma mark -
#pragma mark TiUIView

- (void)setBackgroundColor_:(id)val {
    UIColor* color = [TiUtils colorValue:val].color;
    self.backgroundColor = color;
}

#pragma mark -
#pragma mark DTAttributedTextView

- (void)setAttributedTextViewContent {
    NSLog(@"::::::: setAttributedTextViewContent");
    view = [[DTAttributedMultiTextContentView alloc] initWithFrame:[self bounds]];
    view.delegate = self;
    view.columnCount = [TiUtils intValue:[self.proxy valueForKey:@"columnCount"] def:1];
    view.columnGap = [TiUtils intValue:[self.proxy valueForKey:@"columnGap"] def:0];
    view.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    view.attributedString = [[NSAttributedString alloc] initWithHTML:[content dataUsingEncoding:NSUTF8StringEncoding] options:nil documentAttributes:nil];
    [self addSubview:view];
    [(TiViewProxy *)[self proxy] contentsWillChange];
}

- (void)setHtml_:(id)html {
    NSLog(@"::::::: setHtml");
    ENSURE_STRING_OR_NIL(html)
    RELEASE_TO_NIL(content)
    content = [html retain];
    [self setAttributedTextViewContent];
}

#pragma mark -
#pragma mark DTAttributedTextContentViewDelegate

@end
