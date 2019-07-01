#import "MGLCircleStyleAnnotation.h"
#import "UIColor+MGLAnnotationsExtension.h"

NSString *const MGLPropertyCircleRadius = @"circle-radius";
NSString *const MGLPropertyCircleColor = @"circle-color";
NSString *const MGLPropertyCircleBlur = @"circle-blur";
NSString *const MGLPropertyCircleOpacity = @"circle-opacity";
NSString *const MGLPropertyCircleStrokeWidth = @"circle-stroke-width";
NSString *const MGLPropertyCircleStrokeColor = @"circle-stroke-color";
NSString *const MGLPropertyCircleStrokeOpacity = @"circle-stroke-opacity";

@interface MGLCircleStyleAnnotation ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MGLPointFeature * pointFeature;

@end

@implementation MGLCircleStyleAnnotation

- (instancetype)init:(CLLocationCoordinate2D)center {
    if (self = [super init]) {
        self.pointFeature = [[MGLPointFeature alloc] init];
        self.pointFeature.coordinate = center;
    }
    return self;
}

- (instancetype)init:(CLLocationCoordinate2D)center radius:(CGFloat)radius {
    if (self = [self init:center]) {
        self.circleRadius = radius;
    }
    return self;
}

- (instancetype)init:(CLLocationCoordinate2D)center radius:(CGFloat)radius color:(UIColor *)color {
    if (self = [self init:center radius:radius]) {
        self.circleColor = color;
    }
    return self;
}

- (void)setCircleRadius:(CGFloat)circleRadius {
    self.attributes[MGLPropertyCircleRadius] = @(circleRadius);
}

- (CGFloat)circleRadius {
    if (self.attributes[MGLPropertyCircleRadius]) {
        NSNumber *constantValue = self.attributes[MGLPropertyCircleRadius];
        return constantValue.doubleValue;
    }
    return 5.0;
}

- (void)setCircleColor:(UIColor *)circleColor {
    NSString *colorString = circleColor.mgl_rgbaColorString;
    self.attributes[MGLPropertyCircleColor] = colorString;
}

- (UIColor *)circleColor {
    if (self.attributes[MGLPropertyCircleColor]) {
        NSString *colorString = self.attributes[MGLPropertyCircleColor];
        return [UIColor mgl_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setCircleBlur:(CGFloat)circleBlur {
    self.attributes[MGLPropertyCircleBlur] = @(circleBlur);
}

- (CGFloat)circleBlur {
    if (self.attributes[MGLPropertyCircleBlur]) {
        NSNumber *constantValue = self.attributes[MGLPropertyCircleBlur];
        return constantValue.doubleValue;
    }
    return 0.0;
}

- (void)setCircleOpacity:(CGFloat)circleOpacity {
    self.attributes[MGLPropertyCircleOpacity] = @(circleOpacity);
}

- (CGFloat)circleOpacity {
    if (self.attributes[MGLPropertyCircleOpacity]) {
        NSNumber *constantValue = self.attributes[MGLPropertyCircleOpacity];
        return constantValue.doubleValue;
    }
    return 1.0;
}

- (void)setCircleStrokeColor:(UIColor *)circleStrokeColor {
    NSString *colorString = circleStrokeColor.mgl_rgbaColorString;
    self.attributes[MGLPropertyCircleStrokeColor] = colorString;
}

- (UIColor *)circleStrokeColor {
    if (self.attributes[MGLPropertyCircleStrokeColor]) {
        NSString *colorString = self.attributes[MGLPropertyCircleStrokeColor];
        return [UIColor mgl_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setCircleStrokeOpacity:(CGFloat)circleStrokeOpacity {
    self.attributes[MGLPropertyCircleStrokeOpacity] = @(circleStrokeOpacity);
}

- (CGFloat)circleStrokeOpacity {
    if (self.attributes[MGLPropertyCircleStrokeOpacity]) {
        NSNumber *constantValue = self.attributes[MGLPropertyCircleStrokeOpacity];
        return constantValue.doubleValue;
    }
    return 1.0;
}

- (void)setCircleStrokeWidth:(CGFloat)circleStrokeWidth {
    self.attributes[MGLPropertyCircleStrokeWidth] = @(circleStrokeWidth);
}

- (CGFloat)circleStrokeWidth {
    if (self.attributes[MGLPropertyCircleStrokeWidth]) {
        NSNumber *constantValue = self.attributes[MGLPropertyCircleStrokeWidth];
        return constantValue.doubleValue;
    }
    return 0.0;
}

- (id<MGLFeature>)feature {
    self.pointFeature.attributes = self.attributes;
    return self.pointFeature;
}

@end
