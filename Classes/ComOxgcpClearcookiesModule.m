/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComOxgcpClearcookiesModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComOxgcpClearcookiesModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"9afb6532-45f6-4b3d-9185-374f2ab62200";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.oxgcp.clearcookies";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

-(void)clearCookies:(id)url
{
  ENSURE_UI_THREAD_1_ARG(url);
  ENSURE_SINGLE_ARG(url,NSString);

  NSString *toUrl = url;
  NSLog(@"clearCookies[init]: %@", toUrl);
 
  NSHTTPCookie *cookie;
  NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
  
  for (cookie in [cookieJar cookies]) {
    if ([cookie.domain rangeOfString:toUrl].location != NSNotFound) {
        [cookieJar deleteCookie:cookie];
    }
  }
}

@end
