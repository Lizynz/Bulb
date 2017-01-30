#import "LSStatusBarItem.h"

LSStatusBarItem* sbItem = nil;

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)arg1 {
	%orig;
	sbItem = [[NSClassFromString(@"LSStatusBarItem") alloc] initWithIdentifier:@"com.lizynz.ccstyle" alignment:StatusBarAlignmentRight];
	sbItem.imageName = @"Flash";
	sbItem.visible = NO;
}

%end

%hook AVFlashlight

- (BOOL)setFlashlightLevel:(float)state withError:(id *)arg2 {
	if(state > 0.0) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
	return %orig;
}

- (void)turnPowerOff {
	%orig;
	sbItem.visible = NO;
}

%end

%hook SBCCFlashlightSetting // iOS 8 - 9.3.3

-(BOOL)_enableTorch:(BOOL)state {
	%orig;
	if(state) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
	return %orig;
}

%end

%hook CCUIFlashlightSetting // iOS 10.2

-(BOOL)_enableTorch:(BOOL)state {
	%orig;
	if(state) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
	return %orig;
}

%end

%hook AVCaptureDevice

- (void)setTorchMode:(long long)state {
	%orig;
	if(state) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
}

- (void)setFlashMode:(long long)state {
	%orig;
	if(state) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
}

- (BOOL)setTorchModeOnWithLevel:(float)torchLevel error:(NSError **)outError {
	sbItem.visible = YES;
	return %orig;
}

%end

%hook AXVisualAlertSBCCFlashlightSetting // iOS 8 - 9.3.3

- (void)setFlashlightOn:(BOOL)state {
	%orig;
	if(state) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
}

%end

%hook AXVisualAlertCCUIFlashlightSetting // iOS 10.2

- (void)setFlashlightOn:(BOOL)state {
	%orig;
	if(state) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
}

%end